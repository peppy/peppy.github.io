---
layout: post
title: 'This Week in osu! #8'
date: '2013-01-06T20:06:00+09:00'
tags:
- dev
- osu!
- weekinosu!
tumblr_url: http://pppy.tumblr.com/post/39831318171/this-week-in-osu-8
---
I spent the last week stumbling around trying to keep up with both real life as well as osu! commitments. I don’t have much to show this week so instead I will go a bit more in detail than usual on what I did get up to.

I got really annoyed at cross-compatibility of symlinks which are committed to git, so took a day to get rid of every symlink (more effort than you’d think!). The real issue only shows itself when you are using a git repository shared across multiple PCs using Dropbox.

Most symlinks were in place for large data stores which may be mounted across disks or PCs (using NFS). Removing them meant replacing with nginx location/aliases where possible, or absolute paths in other cases.

For example: ./repo/www/mp3/ → /data/large/mp3/

In this example, we see ./repo/www/mp3 inside a git repo pointing to an absolute path which may be a local folder or mounted hard disk. In the case of storing these in git, there is no initial issue – symlinks are a file with a special link attribute set and contain the path to their destination.

After checking out the repository on a unix based system, symlinks will correctly point to their absolute destination, so if you have a folder available at /data/large/mp3/ it will work instantly after deployment via git. This works great for automatic server-side deployment without having per-system configuration containing locations of certain sets of files.

I store all my git projects inside Dropbox, which means I can use multiple PCs simultaneously without a tiresome commit->push->pull to get both PCs in sync. When symlinks are synchronised across to windows PCs via git, windows is unable to keep the link attribute intact (it contains no such attribute), and the links become non-linked text/binary files. This causes a conflict between the two dropbox connected PCs and results in really weird scenarios which generally break git until you pause one PC’s Dropbox syncing and reset any file changes.

Long story short, I would highly recommend avoiding symlinks inside git unless completely required :).
Database was getting big, so I took a day to prune unnecessary data and do a clean-up of indices. I aim to do this about once a month (basically as soon as things start to fill up) to both keep the overall filesize within acceptable limits and keep the database running in an optimal state.

This generally involves:

Review any new tables added. Decide if data needs to be stored permanently – if not, start culling old data on a daily or weekly basis.
Use some smart index queries to find any unused (or very infrequently used) indices on new or old tables. These can usually be removed and result in a positive impact to insert performance due to less disk writes.
For data paths which are read and write heavy, it may be possible to move indices to slave database servers, leaving the master free to write only the base data, but still have performance benefits when querying slaves.
Check for any tables which have abundant free space. This generally happens when large amounts of data are temporarily written to tables (sometimes due to a bug, something due to a short and sudden increase in traffic). Cleaning these up is as simple as running an OPTIMIZE TABLES n; command, and defragments remaining data in the process.
End result was a 10% reduction in database size!
Ephemeral started widescreen support for the editor, and I finished it. Feels pretty nice to use! Also if you run osu! fullscreen, the editor will always default to borderless fullscreen now, meaning an almost imperceptibly smooth flow to the editor.
A lot of time spent trying to get Catch the Beat “Hyperdash” to work correctly for all patterns. Previously there have been issues in cases where objects next to each other should be hyperdahsed, but aren’t due to sub-frame calculation errors. Still haven’t finished work on this, and it is holding up the next public build, so is my highest priority at the moment. You can read about the specifics of fixing hyperdash in my separate blog entry.
