---
layout: post
title: 'This week (month) in osu! #13'
date: '2013-04-02T16:45:43+09:00'
tags:
- osu!
- dev
- weekinosu!
tumblr_url: http://pppy.tumblr.com/post/46924535831/this-week-month-in-osu-13
---
Been working so hard on new stuff that I’ve basically forgotten all the things I have done and need to post about. Let’s get started with the big one: the osu! UI and default skin graphics refresh!

Over the course of two long weeks, I spent basically every minute awake in photoshop going through all 421 osu! sprites and doubling the dimensions of each and allowing pixel perfect display at 2048x resolutions. Yep, osu! is now “HD”, if you will! Where I was no longer happy with the old design, or where vector data was not available, they were re-created from scratch. This ended up being over half of the resources.



Let me start by saying that I couldn’t have done this alone. A huge thanks to RBRat3 for helping out with a lot of the icons which did not have vector data, including (but not limited to) the main menu icons, the editor control icons and the mod icons.

I also took this opportunity to not only split the resources into two separate resource collections (UI and gameplay), but also decided to distribute in the compressed PNG format rather than raw bitmaps. This is a trade-off allowing for faster patching and less disk usage while adding a load-time performance overhead. This overhead worked out to around 5% and does not affect runtime performance – plus it is only relevant when using the default skin, so all the people using custom skins won’t even notice a difference – so I figured it was beneficial overall.

I will be distributing the elements of this skin for use as templates and/or modification in the near future. The only reason I haven’t yet is because there are a few parts left which are not finished, including Taiko / CtB / osu!mania modes. Keep a watch on the skinning forum for the template release in the near future.

BUT WAIT, this update didn’t just stop at sprite changes! While changing all these sprites, I found so many other things along the way that I was no longer happy with, and took the liberty of changing them too. Let’s try and make a list!

The follow points (those dots which display between hitobjects) are now directional. In the new default skin, they become arrows which – in my testing – really help with map readability.


Hit explosions are visually much smaller, allowing increased readability and reducing the cases they overlap future hitobjects. They also have a really nice glowy effect and a true particle system!



You might also notice that they will briefly appear top-most, but quickly fade to a new position underneath hitobjects, helping with readability on streams.


The ranking popup dialog which used to show your online ranking has been moved so it is no longer a popup. It is now accessible by scrolling downwards, or clicking the handy button at the bottom of the screen.


Special mode selection screen is gone. You can now change modes from song select using the new “Mode” menu! This makes a lot more sense to me these days, where the special modes are basically treated the same as osu! mode.


Scrollable views can now be dragged. Also scrolling is a lot smoother, with improved acceleration/inertia handling (please don’t sue me for patent infringement apple <3).
The back button has been unified across the game (it used to behave slightly differently in some cases).
The background has been removed from osu!direct. It now uses the default menu-background or a user replacement if one exists.
I’ve probably forgotten some other stuff, but I have a few more posts up my sleeve, so will tag it on the end of one of those if I do happen to recall it. I’ve already received quite a lot of feedback on the new design, but feel free to leave anything you have to say in the comments here as well :).
