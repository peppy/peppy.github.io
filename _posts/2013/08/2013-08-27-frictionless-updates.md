---
layout: post
title: Frictionless Updates
permalink: /post/59476446944/frictionless-updates
date: 2013-08-27 09:04:00 +0000
tumblr_url: http://pppy.tumblr.com/post/59476446944/frictionless-updates
categories: osu! dev patching updates osume
---
One area of development that has both interested me and consumed a lot of my thought time over the years has been the deployment process for osu! (and games in general). As far as deployment is concerned, I have got things down to a very concise process at my end, allowing me to push a variety of new builds/updates for osu! out to you guys with a few key-presses. In this post, I'd like to focus on the other side of the picture – what you see when an update is available, and how that update is applied to your game.

Let's begin by understanding how updates are seen by end users, and the various methods of deployment that can change this perception.

When a user clicks the icon of a game, they want to play the game. Anything that gets in the way of this should be avoided from a developer's perspective. Most games force users to update before the game starts, via an enforced patcher – sometimes referred to as a launcher – that serves as a gateway to starting the game (as seen in every MMO, League of Legends, Starcraft 2 etc.). When updates are only being released once a week – or much less in many cases – I can only see this as a horribly inefficient approach which inconveniences users to no end. I'll go out on a limb here and say that most gamers' minds have been trained over the years to accept the added 5-20 seconds spent at the patcher (only to be told their game is up-to-date) as something which must exist. Add up this wasted time and we're probably looking at some big numbers.

![launcher patching is zzz](http://puu.sh/4c1ul/e799d82906.jpg)

*(I have to make a call out to Blizzard who have recently changed their game patchers to have multiple update "levels", allowing the game to start without applying non-critical updates. This is an improvement, but the launcher is very hard to understand as a result, with stages such as "optimising", which should IMHO not be the concern of the end-user.)*

Ever since the beginning of osu!, I have avoided this method of updating. Until recently, osu! would only launch the patcher if an update was found. The user would always be running osu! and in the game ready to play. In this scenario, unless a critical update is released, the user is able to get into their game instantly without interruption, and start playing.

This may seem like a huge improvement, but I have learnt over the years that this backfires to a certain extent. Because osu! users are generally used to the gratification of being able to interact with the game so quickly, when they are interrupted by the game closing to run the patcher, they are more aggravated than they may have been with a "launcher" style patch process. Even though the update-as-an-afterthought I had been using is more efficient overall, due to the way users perceive interruptions, it seemed to be shedding more of a negative light on updates than I expected, with regular storms of complaints in in-game chat following the release of patches which bring new features and bug fixes players should be pumped to receive.

So it was time to re-think the update process. I am a fond user of Chrome as a browser and have to applaud them for their awesome update process, which goes something like this:

* The browser runs a daemon in the background which checks for updates on what we will assume is an hourly basis.
* When an update is found, files are patched in the background.
* If the browser isn't running, the patch can be fully applied, and next time the user opens the browser they are magically (and usually without being aware) on the latest version!
* If the browser is running, Chrome's menu button changes from the usual black icon to a glowing green, letting the user know that an update is present.
* Should the user choose to do so, they can complete the update process from within that menu (triggering a browser restart), else the browser will update itself next time it is closed.

Due to the slickness of this process, I decided to switch osu! across to something similar. I'm not too fond of running a daemon in the background, so had to skip out on this part (which does make the final solution a touch less slick), but moving forwards this can be implemented if osu! gets to the point of running in the background for other (cool) reasons :).

The updater now lives in the main menu, in the form of a subtle message in the bottom-left corner while downloading/applying updates, and a spinning arrow to notify when osu! can be restarted to finish the process. There are no progress bars or external applications involved – it all lives inside osu! itself.

![spinny things](http://puu.sh/4c1F5/d4fb065670.gif)

If the user wants to play on their older version, they can continue to do so. There is nothing forcing them to update. On the other hand, if they want the latest and greatest fixes/feature additions, they have the one-click option to update their game. The process is very quick (as the patch has *already been applied* in the background, and is differential using [binary diff](http://www.daemonology.net/bsdiff/) patching), just requiring a restart of the client.

From what I can tell, this has seen an improvement in how users perceive updates, and there is no longer a outbreak of complaints in chat whenever an update is made available. There are still some areas I would like to improve in the future, though.

* At the moment, if osu! has an update ready to apply on next startup, but another update is released since then, it isn't smart enough to check for this before running. In this case, it takes another restart of osu! if the user wishes to apply the next update.
* If an update is found before osu! finishes launching to the menu (for people that have large beatmap collections, for instance), it would be best to apply it at that point, since it will add nominal time to the startup process.
* There are rare cases which the external updater is still launched as a fail-safe. I think I have ironed all these bugs out, but I still see a small number of users having this happen to them. Eventually I want to deprecate the external updater (osume.exe) completely, so this will need to be resolved.
* Consider the daemon option. Updating in the background would be an amazing improvement from a user experience point of view. If I was to take this direction, rather than running a daemon on startup (which is a bit obnoxious), osu! would just remain in memory after "exited" by the user (until system reboot) and keep things warm. Memory footprint would be very small in this state, of course.

Any thoughts on the update process? Any issues or suggestions? Let me know, since I'm always looking to improve!