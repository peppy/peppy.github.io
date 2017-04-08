---
layout: post
title: 'This Week in osu! #5'
date: '2012-12-17T10:06:00+09:00'
tags:
- dev
- osu!
- weekinosu!
tumblr_url: http://pppy.tumblr.com/post/38114063519/this-week-in-osu-5
---
Running a bit late with the post this week, due to an all-weekend LAN event which involved updating and taking along my two osu!arcade units! Currently playing catch-up with both sleep and work.

I again spent some time optimising the tourney spectator client during the weekend’s OWC matches. Mostly just some minor tweaks to ensure smoothness and reduce buffering.
Made some UI changes to the updater – mainly that the “use test build” checkbox has been removed. Some people seem to have been accidentally clicking this without understanding what it means, and locking themselves into the test build. Also looking at changing the update process a bit. Not too happy with how the updater is such a context switch out of the game.
Switched CDN/static content over to https with SPDY support. As most major browsers support SPDY, there is no need to distribute content over multiple domains to achieve parallel throughput, so I also moved all javascript resources locally. Based on my own performance tests, the difference was not discernible, but I have had positive feedback from countries such as China, where this kind of thing matters.
Improvements to lobby layout, making better use of available screen space. The filters toggle is no longer available, with filters always being shown instead. I have plans for further changes here, but still brewing in my head. The users list is no longer displayed, saving on a bit of network traffic as well.


I rewrote the in-game chat link parsing algorithm. This was a pretty big endeavour, replacing some at-times-hacky character counting for link styles like [http://test.com test words [may contain brackets]] with single regex match-and-replaces:

\[([a-z]+://[^ ]+) ([^\[\]]*(((?<open>\[)[^\[\]]*)+((?<close-open>\])[^\[\]]*)+)*(?(open)(?!)))\]

Explaining this would be require a separate post, I think. Let’s just say that chat links now support line breaks, cases where multiple links are on the same line, and gracefully display erroneous links. They also look a bit nicer!


Messaages in chat by silenced users is now removed from in-game chat history. This ensures that bad behaviour – especially linking inappropriate content – has minimal effect on other users. Took this idea from twitch/justin.tv’s book.
Hosted osu!arcade units at RFLAN yet again. This included adding experimental support for conversion of osu! maps to osu!stream, which is working pretty well! I spent about half the LAN watching people play and modifying the game to provide a better experience based on this feedback.

Make sure to check out this highlight of an osu! map being played with a straw, or dive in and watch some of the recorded stream of the 24 hour event!
I also released an osu!stream update on the App Store with iPhone 5 support.
I’ve got some interesting stuff planned for osu! updates in the near future, so stay tuned :).
