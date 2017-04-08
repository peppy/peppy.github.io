---
layout: post
title: virtualising windows
permalink: /post/10347157655/virtualising-windows
date: 2011-09-18 04:47:26 +0000
tumblr_url: http://pppy.tumblr.com/post/10347157655/virtualising-windows
categories: vm virtualisation vmware parallels fusion os x
---
<p>I primarily use OS X Lion on my laptop for menial tasks, as well as development for anything that isn't .NET. For the .NET side of things, I prefer Visual Studio over other available options, and have therefore opted to keep a Windows 7 multi-boot setup. As per my <a target="_self" href="http://blog.ppy.sh/post/9336578090/managing-and-repairing-partition-tables-w-boot-camp">previous post</a>, this does come with some problems when I am trying to make my shared files accessible from both OSes.</p>&#13;
<p>Over the last few weeks I have been in an ongoing fight with various partition types, NTFS drivers for OS X (and HFS+ for windows) and am not yet happy with any of these options. Metadata for files is not correctly handled with any of the shared filesystem setups I tested, which leaves messy attribute/metadata files lying around in directories, synced with dropbox and thrown into other people's shared folders.</p>&#13;
<p>With the recent release of Windows 8 dev preview, as well as major versions of the two competing virtualisation packages for OS X -- VMWare Fusion 4 and Parallels 7 -- I decided to nuke my dual-boot setup and give virtualisation another try.</p>&#13;
<p>I am currently in a state of having six virtual machine images across the two software packages (XP/Win7/Win8) in order to compare performance and stability. My journey still continues, but what I can say so far is:</p>&#13;
<ul><li><strong>Neither option allow for hardware accelerated video in Windows 8</strong>. This seems to be an issue with driver signing/support. Windows 8 is quite chuggy without hardware accelerated drawing, so I don't believe running it in a virtual machine is a great option for daily use or performance testing.</li>&#13;
<li><strong>VMWare is unstable</strong>. In several cases it would lock up at 100% CPU usage with no feedback on the VM.</li>&#13;
<li><strong>VMWare mouse integration with OS X is not perfect</strong>. When entering the VM window there is a 1-2 frame "jump", where the cursor appears in the wrong position on both OSes before synchronising to the correct location.</li>&#13;
<li><strong>Neither option handles suspending in an optimal way.</strong> They both seem to save an image of the *full size* of the block of RAM assigned, rather than only the used portion. If you need quickly resuming VMs, you're best off using the Windows hibernate options as opposed to the VM one.</li>&#13;
</ul><p>I am planning on using Parallels for the time being, and testing how usable it is for day-to-day dev work in VS2010 (and VS11 preview). As I do have VMWare still setup, I may do some performance comparisons between them, but Parallels seems to be the better option this round.</p>&#13;
<p>Will report back with more detail once I have had some time to form a solid judgement.</p> 