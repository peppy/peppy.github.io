---
layout: post
title: This Week in osu! #4
permalink: /post/37418441818/this-week-in-osu-4
date: 2012-12-07 19:53:00 +0000
tumblr_url: http://pppy.tumblr.com/post/37418441818/this-week-in-osu-4
categories: dev osu! weekinosu!
---
This week I set aside a good block of time to replace the registration and activation process for osu!. The main reasoning behind focusing on improvement in this area is the number of emails I receive each week from people who have issues with either the captcha or email verification/confirmation, requiring manual intervention.

*	Registration process was completely rewritten to be as simple as possible. Rather than hinging on standard verification methods, new users are now only asked for their username, email and password (and only once for each). Once these are validated, they are asked to login to osu!.

	![registration step 1](http://puu.sh/1ydi5.png)


	The login to osu! not only double-checks they entered the password they think they did, but it also means they are instantly logged in without any annoying email checking getting in the way.
	
	![registration step 2](http://puu.sh/1ydjm.png)
	
	The main disadvantage to this change is that anyone who cannot access an osu! client will not be able to register. This means that (for the moment), osu!droid or osu! iPhone users will not be able to participate in the forums. I may provide a solution for these people in the coming week(s).
	
	For a limited time, you can test the new registration process for yourself [on the test server](http://ha.ppy.sh/p/register). Note that you will need to run the test build of osu! to complete activation. Accounts created here will be deleted around every three hours, so don't worry about making more than one (or entering valid details).
	
*	When creating new accounts, users are now warned if it is likely they are about to (unknowingly) create a multi-account.

	![warning](http://puu.sh/1ydf1.jpg)
	
*	The [download page](http://osu.ppy.sh/p/download) got a much needed redesign. I plan on doing some more work here, but it is already feeling a lot nicer.

*	Next up is fixing the email change, password change and forgotten details processes to bring them in line with the quality and simplicity of the new system. I hope to complete these next week.

*	Tournament spectator client has some upgrades! It now synchronises playback between all clients, which looks [pretty damn cool](http://www.youtube.com/watch?v=muIhIvwvnnk) in [practice](http://www.twitch.tv/peppyhax/c/1763233). I can't wait to see what people think during the [OWC matches this weekend](http://twitch.tv/osuworldcup).

	The spectator setup process is now completely automated, meaning streamers no longer need to track player or song changes. On providing a multiplayer match ID, osu! will handle the rest. Automation Ho!

*	Previously mentioned bancho protocol optimisations have gone live and have reduced overall outwards traffic by around 5-10%. This is quite a substantial improvement – especially since this saving occurs during game client connections, reducing the delay before users can enter multiplayer etc. by around 20%. I still have a few more improvements up my sleeve for further down the track :).

*	I changed the file structure of avatar storage to allow for easier access from multiple sources. File extensions are no longer provided, and as such file types are determined during client-side display logic. As a result, there are no longer conflicts when users upload multiple formats of avatars over a period of time, and the logic for displaying avatars is super-simple. As an interesting tidbit, osu! has over 5.6gb worth of 128x128 avatars in its store!

Going to be another busy weekend with OWC matches throughout Saturday and Sunday. Make sure to [tune in](http://twitch.tv/osuworldcup) and witness the improvements to the streaming setup!