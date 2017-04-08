---
layout: post
title: managing and repairing partition tables w/boot camp
date: '2011-08-25T00:13:00+09:00'
tags:
- partitioning
- os x
- disk utility
- gdisk
- refit
- mbr
- gpt
tumblr_url: http://pppy.tumblr.com/post/9336578090/managing-and-repairing-partition-tables-wboot
---
It is no secret that I stand by Apple hardware — with my desk covered in far too much aluminium — but on a day-to-day basis I use OS X and Windows roughly equally. This means that for my portable setup (MBP 13" late-2009), I need a working copy of both operating systems, and the ability to switch between them with minimal effort.
Recently I have become more reliant on Dropbox in order to sync files between PCs (and in this case, OSes). This is generally more efficient than bringing git up-to-date each time i reboot, which would usually involve stashing, committing, pushing, pulling, popping stash every time. The problem created is that Dropbox doesn’t sync instantly – in fact it takes a fair amount of time.
Due to OS X not having write support to NTFS partitions (and vice-versa with Windows and HFS+) I had been unable to store dropbox in one location.
The plan? Create a new shared ExFAT (basically FAT64, with case-sensitivity and more goodness) partition which could be accessed by both operating systems, and use it solely to store my dropbox.
Intel 160gb SSD [120gb OS X | 8gb shared | 32gb Windows 7]
I have 11.2gb of dropbox storage using referrals and various promotions they have had over the years, but don’t plan on using this much space in the near future, so settled for 8gb. Disk Utility on OS X allows resizing HFS+ partitions on-the-fly, so I freed up enough space and tried to make this happen… and then ran into some problems…
It was not meant to be:

No go. Disk Utility gave me random errors while trying to use the space that I assumed to be free. A quick reboot into Windows made it apparent that Disk Utility was unaware of the Lion recovery partition – which exists after the end of the primary OS partition – and was allowing me to create a partition larger than I should in fact be able to.

Settling for around 7.3gb, I set things up and did a test run. Found that the default cluster allocation size in both OS X and Windows when formatting ExFAT is 32kb (probably as an optimisation for USB/flash drives, which are the primary target medium for the ExFAT filesystem). So I reformatted the partition, and decided to try my luck and also remove the recovery partition. It shouldn’t be used for anything under normal circumstances, right?!
It most definitely isn’t, but in the process I upset the balance of things. During the Boot Camp setup process, a hybrid boot sector is made on the target disk, containing both MBR(windows) and GPT(os x) records. By changing the partition layout in windows, this caused the two do become desynced. OS X would no longer boot, and on further inspection (using a Lion install DVD.. err, memory stick) thought the primary HFS+ partition was now ExFAT.

“Ohshi–” was the first thing that ran through my head, and I mentally calculated how much data I would lose should I need to restore from backups (around 4 days, mostly iTunes imports/tagging). But of course I couldn’t just give up and stop here; the night was young and I was curious as to how this could be fixed.
After doing a lot of searching around and finding some people in similar situations with the classic “reinstall your OS” responses, I set out with two utilities in hand that I was sure could be used to resolve the situation I caused.
rEFIt: an EFI boot manager and recovery suite, containing gptsync – an app specifically made to bring the MBR record back in sync with the GPT table.
gpt-fdisk (aka gdisk): a release of fdisk which has gpt support. handily available in binary form for every OS!
A quick test using the rEFIt gptsync tool proved unsuccessful; it tried to sync the GPT over to MBR but failed due to the changes I made to the MBR in windows. I couldn’t find a way to sync in the other direction. I took a photo of the disk’s layout at this point, which showed start and end sectors for each partition in both MBR and GPT layouts. This would prove a life-saver after I proceeded to destroy my partition layouts beyond perceivably recoverable levels (let’s skip this part lest this post turn into a book).
On to gdisk (running from windows), and I could now fix the gpt layout based on the photo I took previously. This process was fairly straightforward as I am familiar with fdisk commands, but there is plenty of information here that would help those that aren’t.
End result? After about six hours I had recovered both OSes, removed the Lion recovery partition and created my new shared home for Dropbox. Was it worth it? I’ll leave that for you to answer. I do recommend that if at all possible, you should do all your partitioning in OS X (and leave the recovery partition be) to avoid a similar situation.

I have been using a shared dropbox across both operating systems for a couple of days now and have hit a few bumps (which I will detail in a future post), but overall it feels *that* much better to not have to wait 10-30 minutes for Dropbox syncs. I have been switching OSes a lot more since the change, which means overall more productivity.
Lessons learnt:
Backup before playing with partitions.
Always keep a record of the original partition table layout, so you can restore if something goes wrong. As long as you don’t format any partition changes all data is recoverable.
Windows prefers reading and writing the MBR when available, even though it supports GPT.
Keep rEFIt on a recovery USB stick or DVD (my 8gb usb stick now has OS X Lion Install and rEFIt).
