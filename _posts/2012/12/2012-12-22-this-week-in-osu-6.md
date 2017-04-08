---
layout: post
title: This Week in osu! #6
permalink: /post/38531298013/this-week-in-osu-6
date: 2012-12-22 07:53:47 +0000
tumblr_url: http://pppy.tumblr.com/post/38531298013/this-week-in-osu-6
categories: dev osu! weekinosu!
---
Spent this last week finishing up work on widescreen background support during play mode, and took the opportunity to improve the transition between song select and play mode, along with the loading process.

*	All loading is now done asynchronously on a separate thread. This means there is no visual pause when loading beatmaps. While this doesn't mean much for most people with fast hardware, it was a prerequisite to the changes I wanted to make to the transition into play mode.

	For the time being, I added a fixed one second delay to the loading process to make the UX how I envisaged it working (especially important for fast PCs). I have further plans on what will happen during this loading process to make it more than just loading, but that will come in a future update.

*	Fun Spoiler has been renamed to Visual Settings, and buffed a bit. It is now possible to dim background images to black after playing maps at least once. The new dialog is also featured in a much more prominent place, hopefully meaning more people will see and make use of it.

	![visual settings](http://puu.sh/1DQ6l.jpg)
	
*	Widescreen support for play mode, with aspect fill now used for all backgrounds and videos. Automatically detects when storyboards are present and falls back to 4:3 display, to ensure alignment is not broken as a result. There are still a few cases where artifacts can be seen here, suck as storyboards which used to have hidden elements due to letter-boxing now being visible. This will be fixed and improved going forward, along with the option to make widescreen storyboards.

	As a side note, you can now start using widescreen backgrounds and video and they should be recognised appropriately.

*	I made some fixes to opengl display – especially to the initialisation process. This means that opengl should load faster than ever and no longer flicker on load. I also looked into getting context sharing over multiple threads, to bring opengl up to the same level of threaded performance is direct x. One more step forward towards dropping direct x support completely – part of my master plan of ridding osu! of XNA and supporting more platforms more natively than ever before.

*	Added the ability to set custom refresh rates (for fullscreen mode) and custom fps targets for frame limiter mode. Should be useful for people playing osu! on 120hz monitors, or those who are after a frame-rate limit somewhere between unlimited and 120fps.

*	Best of osu! 2012 voting is now open! Make sure to [check it out](http://osu.ppy.sh/p/bestof2012) and vote for the beatmaps you enjoyed the most over the last year.

I have quite a bit of stuff to organise over the coming weeks, so updates may be a bit slower than usual. I do have plans for a small osu!stream update, including a new map pack, so keep an eye out if that kind of thing interests you :).