---
layout: post
title: This Week in osu! #7
permalink: /post/39199716514/this-week-in-osu-7
date: 2012-12-30 07:11:52 +0000
tumblr_url: http://pppy.tumblr.com/post/39199716514/this-week-in-osu-7
categories: dev osu! weekinosu!
---
I hope everyone has an enjoyable Christmas break. I took a day or two off, but spent the rest of the week focussing on some scalability issues creeping up on osu! – the main one being the initialisation process when first connecting to bancho.

*	Using the concept of caching user information locally, I reduced the amount of data from server→client by 90%. osu! can now play in solo mode without ever receiving more than userIds of all online players. When users need to be displayed or interacted with (chat / multiplayer / online users display) this information is requested on-demand. I am still experimenting with the best balance between local cache size and expiry times, but you should already be able to see the improvements when first starting osu! and connecting to bancho. THis should help out those with slow internet connections quite a lot.

*	I reworked much of bancho's internal to treat all clients (osu! / irc) evenly. Previously there were a lot of special cases to handle multiple logins from the same account, including |osu suffixes on all osu! client's username, and the inability to have an IRC client share a username with an osu! client in many cases.

	These changes not only allowed dropping that ugly username suffix, but also means that a single user can have multiple IRC clients all running under a single unified username. In the process, I also removed the ability to change IRC usernames, so it should be a lot easier to identify people too (even though you could only add a suffix previously). The code for handling user connection is also a lot cleaner, and will allow for special cases like tournament spectating without having one osu! account per running client.

*	I fixed most of the remaining widescreen compatibility issues, and also went through a lot of hard crash bug reports and fixed them. osu! should be a whole lot more stable after this week's updates. In addition, I changed the way crashes are handled so a lot of errors (>80%) that would previous hard-crash osu! are now handled (and reported to me) without the game dying completely.

*	I made some fixes to input handling which allow prioritising certain groups of game elements on a situational basis. The main reason for doing this was to allow universal volume adjustment – now available either using up/down arrows or mouse wheel, and in dialogs where it wasn't previously by holding ctrl+shift while using the controls – but also allows for a lot finer control of input handling, especially in cases where there are many scrollable areas, buttons and overlapping layers on screen at once. Quite large internal changes, but quite invisible to the end-user.

*	I have started work on fixing long-standing Catch the Beat hyperdash issues, where fruit would occasionally be impossible to catch due to sub-frame calculation errors. It is going to take a bit more time to get things finely tuned without affecting the difficulty of existing maps, but should be ready for the next public build, if not the one after.

Let me take a moment to note that I have recently been streaming dev sessions on twitch.tv. Make sure to [follow me](http://twitch.tv/peppyhax) if you're interested in coming and watching, asking questions or whatever. It's a lot of fun, and I play some epic music playlists to boot :).