---
layout: post
title: Optimal Database Backups
permalink: /post/51784754475/optimal-database-backups
date: 2013-05-31 05:23:00 +0000
tumblr_url: http://pppy.tumblr.com/post/51784754475/optimal-database-backups
categories: osu! dev db backup
---
No one enjoys database backups. They usually involve a load spike and a lot of table locking (even in best-case scenarios) which can be felt on live servers. Some sites bring their services down to perform backups, others slow to a halt. It is a very important aspect of running an online service, and finding an optimal and elegant solution is usually very specific to the infrastructure and nature of services being offered.

I am very serious about keeping live backups. The osu! database is replicated to a slave server, providing a real-time fallback in case the main server happened to fail. This is already ample to handle any server software/hardware issues – for instance if a drive was to fail. This alone does unfortunately leave the possibility of human mistake – where the database is damaged internally – which while I'd love to say doesn't happen, is generally unavoidable (especially when expanding the size of the team which is working with database access). In the case of a human mistake, both the master *and* slave server's data is in a bad state, making slaves of this nature useless.

In the case of human error, my current backup solution was to take database snapshots from the slave server. This results in very minimal effect on the front-facing service, as user based actions rarely require a query to the slave database, but the storage requirements, the IO requirements and the general clunkiness of snapshots has always bugged me. It also means that as backups were only made once a week, in the case we needed to recover data it may be up to seven days old, which is not acceptable.

Incremental snapshots is one way to avoid this pitfall, but does require all database tables to be of InnoDB engine. I regularly test InnoDB (or in this day and age, [XtraDB](http://www.percona.com/doc/percona-server/5.5/percona_xtradb.html?id=Percona-XtraDB:start)) but am still getting better overall performance with the arguably less reliable MyISAM, so this is not an option.

Introduce a delayed slave to the equation. This is a separate server which is initialised as a slave to the master database, but maintains a time distance from the live data. This is easily done using the Percona Toolkit's [pt-slave-delay](http://www.percona.com/doc/percona-toolkit/2.1/pt-slave-delay.html), which runs as a daemon and allows specifying a period for which it should delay sql operations by.

There are a few amazing advantages here:

*	There is *no* added load to any of the live servers, apart from the network overhead of streaming binlogs.
*	It is a continuous backup. You can't get better than this. No snapshots to worry about; only the assurance that you can always recover.
*	Because binlogs are always sent instantly, this slave instance can also be replayed to any particular point in history within the delayed duration. So if it is running 24 hours behind by default, it could be asked to catch up to 12 hours, or even removing the delay – making it a potential real-time backup slave in case of failures.
*	If you already have replication setup, initialising the new slave can be done with zero front-facing impact by using an existing slave as the point of initialisation.

To initialise the `pt-slave-delay` command, it's as simple as ensuring replication is started, then specifying the delay and check interval. I am currently using the following, which should be run at system startup if you want it to persist:

	#!/bin/sh
	mysql -e 'start slave;'
	pt-slave-delay --delay 24h --interval 5s --no-continue localhost

Take note that while replication is stopped, you will now be able to see how many seconds behind the server is using the `SHOW SLAVE STATUS` command. As I regularly use this for monitoring the slave delay, I had to use an alternative method to find the delay. For me, the easiest way was to select the `MAX(timestamp)` from a table with high activity and compare this to `CURRENT_TIMESTAMP` as follows:

	SELECT UNIX_TIMESTAMP(CURRENT_TIMESTAMP) - UNIX_TIMESTAMP(max(`date`)) AS seconds FROM `osu`.`osu_scores`;

I really enjoy databases and the optimisation of them at low and high levels. osu! is still *relatively* simple when it comes to database infrastructure but it is rapidly expanding. Keeping up with the increasing load is an interesting and very fun process. I hope to post more articles like this delving into the slightly more technical side of things going forward.

**Update:**

I just found out that as of MySQL5.6 (which I am actually running, so have switched to this method) you no longer need the `pt-slave-delay` script as this is [built-in functionality](http://dev.mysql.com/doc/refman/5.6/en/replication-delayed.html). You can add a delay with one simple command (make sure to `STOP SLAVE;` first):

	CHANGE MASTER TO MASTER_DELAY = 14400; --delays 4 hours

***SUPER IMPORTANT NOTE:*** If you are delaying further back than the master has stored in binary logs, running a `CHANGE MASTER TO` like this will cause the world to fall apart, as it resets all slave relay logs. Make sure to carefully read the [documentation](http://dev.mysql.com/doc/refman/5.6/en/change-master-to.html) – specifically:

    CHANGE MASTER TO deletes all relay log files and starts a new one, unless you specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay log files are kept; the relay_log_purge global variable is set silently to 0.

p.s. I haven't forgotten about the "this week in osu!" series, but some of the things i planned on writing about have been lost in my forgetful mind. I'll try and knock one out along with the next public release, which I am hard at work on getting finalised. I am trying to [livestream](http://twitch.tv/peppyhax) as much as I can, so if you are interested in the development of osu!, make sure to tag along and say hi in chat :).