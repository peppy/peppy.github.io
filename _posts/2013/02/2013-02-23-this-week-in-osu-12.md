---
layout: post
title: This Week in osu! #12
permalink: /post/43823357969/this-week-in-osu-12
date: 2013-02-23 19:25:00 +0000
tumblr_url: http://pppy.tumblr.com/post/43823357969/this-week-in-osu-12
categories: osu! weekinosu! dev
---
Catching up on bug-fixes, I have finally been able to work on a few new features which are visible to the end user. Let's get right into it!

*	The user panels display now adjusts to display four columns on _all_ widescreen modes. This solves the long time problem of having a gap to the right on some widescreen aspect ratios.

	![widescreen display](http://puu.sh/278mw/50da80ce2f.png)

	It also allows for over four columns on super-widescreen resolutions, should you be running across two monitors using something like eyefinity.

*	osu!mania now support vertical flip, making gameplay similar to that of DDR/o2jam. This should help people coming to osu! from said game systems adapt quite easily, instead of resorting to flipping their monitors upside-down. I was planning on adding this one, but woc beat me to it ;).

	![upscroll](http://puu.sh/278pi/3060329897.jpg)
	
	The skin you see above is [available here](http://osu.ppy.sh/forum/t/119599).

*	Skinning now supports double-resolution sprites, allowing for very high resolution gameplay. osu! now uses these sprites when the window width is greater than 1600 pixels.

	To add support to a skin, add images with double the width/height containing the "@2x" suffix before the file extension.

*	The editor now supports widescreen resolutions more elegantly. The biggest change is allowing selections outside the play-field grid. This works even when the current placement mode is _not_ select, meaning you can start a selection while in circle or slider placement mode as long as you begin the selection outside the grid area.

*	I completely restructure Bancho to allow for usergroup authentication on a per channel basis. In the process, I was able to combine the osu!stream and developer channels into the main bancho server, reducing the overhead to get people into the chat rooms. In the future, this also means we can have chat rooms pop up for teams in the case of tourneys or similar. Much more flexibility :).

Got more awesomeness already in the works. Stay tuned!

p.s. Sorry for the slider issues in the editor. Hopefully all the bug fixes made up for it.