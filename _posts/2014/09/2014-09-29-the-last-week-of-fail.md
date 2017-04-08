---
layout: post
title: the last week of fail
permalink: /post/98719548598/the-last-week-of-fail
date: 2014-09-29 12:22:00 +0000
tumblr_url: http://pppy.tumblr.com/post/98719548598/the-last-week-of-fail
---
The last week has been quite a roller-coaster ride as far as keeping osu! above the water. In the interest of transparency I am writing up the various problems that arose over this period.

![this kind of sums things up...](http://puu.sh/bSCuR/8afd31e495.png)

Issue #1
========

Internal IP address of main webserver was revealed. Onslaught of DDoS attacks hitting box directly rather than getting stopped at cloudflare. Digitalocean has a null route policy, which means that box is inaccessible for three hours after any DDoS hits. They also managed to find the bancho server IP, likely as it hasn't changed for many years and was revealed in the distant past.

Daily DDoS attacks knocking osu! off the internet (and null-routing the web server).

![null routes are annoying, but unavoidable](http://puu.sh/bSwVn/35481fff71.png)

Resolution
----------

Figure out how the IP was revealed. Found a few methods and patched them all:

* PTR records (digitalocean makes these public based on hostname, so a scan of the digitalocean IP range searching for relevant hostnames is feasible). Moral of the story: never name your digitalocean droplets anything distinguishable (use random names).
* Postfix. This is probably the silliest of all: the IP address was in mail headers, as all mail was sent from that server. To fix this I made a new relay server for mail which removes sensitive header information before performing the final send operation.
* phpbb. When posting a forum post, phpbb was checking image dimensions with a call to `getimagesize`. This would run even on remote URLs, which meant the box's IP was revealed. I removed this dimensions lookup as it wasn't even being enforced.

To combat the DDoS attacks quickly, I ramped up around 10 web servers from a snapshot and had them waiting as hot backups should one of them get null-routed. This allowed for minimal downtime.

This meant reassigning new IP addresses to all services which may have previously been revealed.

I'm quite glad this came up, as patching the above security flaws makes me feel a lot more at ease, going forward.

Issue #2
=========

Over the past few weeks, many of my digitalocean droplets were having sudden IO starvation, during which their IOPS would drop to zero for sometimes up to 5 minutes at a time.

Resolution
----------

Digitalocean support suggested I redeploy the droplets, as my "old" droplets were running on an old version of their hypervisor code (and on older hardware). So I did this, which may have been my biggest - yet unavoidable - mistake.

Issue #3
=========

Redeployed droplets were seeing very high and spiky steal% (yellow in the graph below), suggesting high host contention. I took the redeployment as an opportunity to upgrade the master database (32gb -> 64gb RAM, 12 -> 20 cores), but regardless of this it was performing so badly that the site would often come to a halt during peak.

![yellow is stolen cpu time](http://puu.sh/bOdIA/4dd8139a85.png)

Resolution
----------

After a 10+ page back-and-forth with digitalocean I really didn't get anywhere. The final solution was to keep redeploying until performance was satisfactory.

Even after redeploying I am still noticing spikes of steal%, which results in sudden CPU starvation. This is an ongoing issue to which I have no solution (although I do have some leads which I am investigating actively).

Keep in mind switching master database servers is not an easy task either. It requires synchronising multiple things happening at once: ensuring all slave servers are stopped at the same point in time (while the old master is in read-only mode); switching slaves to new master and ensuring they are still in sync with; updating configuration of all services reliant on the database; switching monitoring to understand the new database layout.

I had to do this master switch twice this week, which was a huge time-sink. I was able to partly automate the process along the way, which is a nice bonus.

Issue #4
=========

A new kind of DDoS arose which was not being blocked by cloudflare. Someone was making use of a wordpress botnet to flood http requests at osu.ppy.sh. This totaled around 300mbit of incoming requests, which is enough to bring the most powerful of servers to a halt.

![that's megabytes, not bits.](http://puu.sh/bSwLR/4577ada5b0.png)

Resolution
----------

Initial resolution was to switch cloudflare to "I'm under attack" mode, which forces every visitor's browser to perform javascript computations before allowing access to the site. This required adding special rules to allow bancho and other services (which can't perform javascript).

Longer term solution was to add filtering rules at an nginx level to avoid passing such bogus requests on to php workers. This reduces the bulk of the stress on the server allowing it to continue operation even under such an attack.

*Update*: I found out that this blocking can be done at a cloudflare level using a specific WAF rule.

Issue #5
=========

When I was finally happy with a database deploy at digitalocean (lowish steal%), it went radio silent during peak one night, without any notice. Upon following up with digitalocean support, they said there was a problem with the hypervisor it was running on which in turn triggered a reboot of all droplets running on it.

But not only that, mine rebooted **without a kernel**, and thus had no networking (apparently). This happened  due to another bug at DO's end involving deploying from snapshots, but that is unimportant.

Resolution
----------

This was completely out of my control. I'm waiting for follow-up on exactly how this happened from DO support, while also looking at my options to switch key infrastructure away (back?) to dedicated hosting, while leaving a hot backup at DO in case of failure. I will likely post an update if/when I decide to migrate to somewhere else.

So let me clarify: DigitalOcean are an **amazing host**. They offer computing power at prices which make sense, rather than inflated server rental rates that are oh-so-common in today's market. They have been working very closely with me to overcome the aforementioned issues, going out of their way to do what they can. Their support is so far the most personal and expident of any datacenter I have tried (and I've been around..).

Much of what has occurred has not been their direct fault; mostly a series of unlucky events which happened to overlap. If I do decide to move away, it will not be moving away from DigitalOcean, but from cloud hosting in general (returning to self-managed infrastructure). I would not even consider another cloud provider due to the unrealistic costs.

At the end of the day, I would still recommend DigitalOcean. If you decide to give them a try, you're welcome to use my [referral link](https://www.digitalocean.com/?refcode=ad09ab889290) to help offset the costs of osu! servers (and gives you free credit too).

Let me also mention that while I felt that my infrastructure was robust to withstand such failures, I have determined a few areas which can be improved. And you can count on me to improve those areas.