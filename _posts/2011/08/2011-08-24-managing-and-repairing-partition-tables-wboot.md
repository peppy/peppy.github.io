---
layout: post
title: managing and repairing partition tables w/boot camp
permalink: /post/9336578090/managing-and-repairing-partition-tables-wboot
date: 2011-08-24 16:13:00 +0000
tumblr_url: http://pppy.tumblr.com/post/9336578090/managing-and-repairing-partition-tables-wboot
categories: partitioning os x disk utility gdisk refit mbr gpt
---
<p>It is no secret that I stand by Apple hardware — with my desk covered in far too much aluminium — but on a day-to-day basis I use OS X and Windows roughly equally. This means that for my portable setup (MBP 13" late-2009), I need a working copy of both operating systems, and the ability to switch between them with minimal effort.</p>&#13;
<p>Recently I have become more reliant on Dropbox in order to sync files between PCs (and in this case, OSes). This is generally more efficient than bringing git up-to-date each time i reboot, which would usually involve stashing, committing, pushing, pulling, popping stash every time. The problem created is that Dropbox doesn't sync instantly -- in fact it takes a fair amount of time.</p>&#13;
<p>Due to OS X not having write support to NTFS partitions (and vice-versa with Windows and HFS+) I had been unable to store dropbox in one location.</p>&#13;
<p><strong>The plan?</strong> Create a new shared ExFAT (basically FAT64, with case-sensitivity and more goodness) partition which could be accessed by both operating systems, and use it solely to store my dropbox.</p>&#13;
<p><strong>Intel 160gb SSD [120gb OS X | 8gb shared | 32gb Windows 7]</strong></p>&#13;
<p>I have 11.2gb of dropbox storage using referrals and various promotions they have had over the years, but don't plan on using this much space in the near future, so settled for 8gb. Disk Utility on OS X allows resizing HFS+ partitions on-the-fly, so I freed up enough space and tried to make this happen... and then ran into some problems...</p>&#13;
<p><!-- more -->It was not meant to be:</p>&#13;
<p><img height="590" width="673" src="http://puu.sh/4E1j" /></p>&#13;
<p>No go. Disk Utility gave me random errors while trying to use the space that I assumed to be free. A quick reboot into Windows made it apparent that Disk Utility was unaware of the Lion recovery partition -- which exists after the end of the primary OS partition -- and was allowing me to create a partition larger than I should in fact be able to.</p>&#13;
<p><img height="506" width="652" src="http://puu.sh/4Joe" /></p>&#13;
<p>Settling for around 7.3gb, I set things up and did a test run. Found that the default cluster allocation size in both OS X and Windows when formatting ExFAT is 32kb (probably as an optimisation for USB/flash drives, which are the primary target medium for the ExFAT filesystem). So I reformatted the partition, and decided to try my luck and also remove the recovery partition. It shouldn't be used for anything under normal circumstances, right?!</p>&#13;
<p>It most definitely isn't, but in the process I upset the balance of things. During the Boot Camp setup process, a hybrid boot sector is made on the target disk, containing both MBR(windows) and GPT(os x) records. By changing the partition layout in windows, this caused the two do become desynced. OS X would no longer boot, and on further inspection (using a Lion install DVD.. err, memory stick) thought the primary HFS+ partition was now ExFAT.</p>&#13;
<p><img src="http://puu.sh/4Jmo" /></p>&#13;
<p>"Ohshi--" was the first thing that ran through my head, and I mentally calculated how much data I would lose should I need to restore from backups (around 4 days, mostly iTunes imports/tagging). But of course I couldn't just give up and stop here; the night was young and I was curious as to how this could be fixed.</p>&#13;
<p>After doing a lot of searching around and finding some people in similar situations with the classic "reinstall your OS" responses, I set out with two utilities in hand that I was sure could be used to resolve the situation I caused.</p>&#13;
<p><strong><a target="_blank" href="http://refit.sourceforge.net/">rEFIt</a></strong>: an EFI boot manager and recovery suite, containing <strong>gptsync</strong> -- an app specifically made to bring the MBR record back in sync with the GPT table.</p>&#13;
<p><strong><a target="_blank" href="http://sourceforge.net/projects/gptfdisk/">gpt-fdisk</a></strong> (aka gdisk): a release of fdisk which has gpt support. handily available in binary form for every OS!</p>&#13;
<p>A quick test using the rEFIt gptsync tool proved unsuccessful; it tried to sync the GPT over to MBR but failed due to the changes I made to the MBR in windows. I couldn't find a way to sync in the other direction. I took a photo of the disk's layout at this point, which showed start and end sectors for each partition in both MBR and GPT layouts. This would prove a life-saver after I proceeded to destroy my partition layouts beyond perceivably recoverable levels (let's skip this part lest this post turn into a book).</p>&#13;
<p>On to gdisk (running from windows), and I could now fix the gpt layout based on the photo I took previously. This process was fairly straightforward as I am familiar with fdisk commands, but there is plenty of information <a target="_blank" href="http://www.rodsbooks.com/gdisk/">here</a> that would help those that aren't.</p>&#13;
<p><strong>End result?</strong> After about six hours I had recovered both OSes, removed the Lion recovery partition and created my new shared home for Dropbox. Was it worth it? I'll leave that for you to answer. I do recommend that if at all possible, you should <strong>do all your partitioning in OS X</strong> (and leave the recovery partition be) to avoid a similar situation.</p>&#13;
<p><img src="http://puu.sh/4JnK" /></p>&#13;
<p>I have been using a shared dropbox across both operating systems for a couple of days now and have hit a few bumps (which I will detail in a future post), but overall it feels *that* much better to not have to wait 10-30 minutes for Dropbox syncs. I have been switching OSes a lot more since the change, which means overall more productivity.</p>&#13;
<p>Lessons learnt:</p>&#13;
<ul><li><strong>Backup</strong> before playing with partitions.</li>&#13;
<li>Always <strong>keep a record of the original partition table layout</strong>, so you can restore if something goes wrong. As long as you don't format any partition changes all data is recoverable.</li>&#13;
<li>Windows prefers reading and writing the MBR when available, even though it supports GPT.</li>&#13;
<li>Keep rEFIt on a recovery USB stick or DVD (my 8gb usb stick now has OS X Lion Install and rEFIt).</li>&#13;
</ul>