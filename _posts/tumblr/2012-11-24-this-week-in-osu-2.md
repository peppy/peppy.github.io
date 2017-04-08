---
layout: post
title: 'This Week in osu! #2'
date: '2012-11-24T00:02:00+09:00'
tags:
- osu!
- weekinosu!
- dev
tumblr_url: http://pppy.tumblr.com/post/36356913092/this-week-in-osu-2
---
Another relatively busy week on the server maintenance side of things, switching out the old bancho server with the new one. There also seems to be a sudden surge in tournaments being organised, which triggered a temporary change in priorities!

Bancho is now running on the new server. The switch was made  at low-peak on the 19th, and there was no downtime experienced. This did require an osu! client update, which was rolled out over a few hours beforehand. Non-updated clients will not be able to connect, but as always, are automatically updated.

The new server is provisioned for an extra 66% bandwidth (allowance, not speed), and should be able to handle increasing traffic for well into next year.
I shifted server monitoring to a hosted service (ScoutApp). This was primarily done to alleviate the risk of failure (and maintenance) involved in running monitoring myself, which was previously done using Cacti.

ScoutApp was my choice for monitoring because it offers reasonable pricing and easy setup. I am still running my monitoring using their one month trial, but am happy enough to continue using it into the future.



The ability to log many stats and create dynamic graphs at any point in the future makes ScoutApp super powerful. It also has an open plugin architecture, which allowed me to graph .NET metrics even though they don’t actually support Windows Server as an OS.
The screenshots page now shows a selection of relatively-popular user uploads (those things that come from hitting Shift-F12 in-game).
I implemented a new spectator mode for tournament use, which automates the process of setting up an array of spectator clients to live-stream tournaments. This will be used for streaming the upcoming osu! World Cup #3 (starting in just over six hours, running for a month or so) and a smaller Japanese osu!mania tournament running this weekend (Saturday UTC11:00~).

I have plans to further improve this functionality and make it semi-public, so anyone wishing to use it can apply for temporary access. It is currently available via private applications. If interested, please make sure your tournament is well set-up, has a thread and reliable staff and is fully scheduled before contacting me via PM for access.
While investigating performance issues (latency occurring on the last hitcircle of a beatmap), I accidentally found other areas of osu! I could optimise. This ended in a rewrite of texture handling which means that when running in Direct X mode, osu! no longer needs to store a copy of textures in RAM when they are already sent to video memory. This resulted in ~33% decrease in memory consumption across the board – and even more in some cases.

The reason textures were stored in RAM was due to XNA allowing developers to be more lazy in how they choose to load textures, meaning if a graphics context is lost (window changes to another monitor, resolution is changed, full-screen toggle etc.) there is no extra code complexity to reload textures. osu! already handles this correctly and having XNA still managing textures was completely useless. I was very happy to find this one, as it was a quick win which will help users with low-spec machines across the board!
I found and fixed a memory leak occurring when loading custom hit-sounds. After loading any sample, the sample was being freed using an incorrect call, leaving some resources hanging on to invalid memory references. This may have caused crashes or excessive memory usage after several hours of playing maps using custom samples.
Localisations for osu! have been updated to use the new Google Sheet localisation method. This should allow for very speedy changes and additions to localisations. A total of 26 languages are now available for selection in osu!.

Every time I build a new public release of osu!, new translations are automatically pulled from the shared spreadsheet. I do take the time to look over changes and make sure there have not been any malicious modifications/additions (since it is publicly editable) before pushing them out to users. That said, localisations are not tied to individual osu! builds, and will be updated automatically when available.

The code to integrate reading from google docs was handily borrowed form osu!stream, where it has proven to be a very efficient method of localising in-game text. I do plan on adding more localisable text in the near future, including eventual editor support.
That’s all for this week! Let me know if you want less or more detail; if you want to know about different aspects I have failed to cover; even just that you enjoyed this post :).
