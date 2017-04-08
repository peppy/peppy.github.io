---
layout: post
title: 'This Week in osu! #10'
date: '2013-02-03T18:53:13+09:00'
tags:
- dev
- weekinosu!
- osu!
tumblr_url: http://pppy.tumblr.com/post/42178900910/this-week-in-osu-10
---
I’ll make no excuses for my lack of updates. Let’s move straight on to what has changed over the last couple of weeks!

The osu! website now makes use of SSL for all communications after logging in. This happens on the next login attempt, so if you are using a stored cookie, you may need to re-login once to get switched over.

I am providing ssl support via a cloudflare issued certificate on a trial basis. My reasoning for doing this is that they (via globalsign) host the fastest SSL resolution available, beating the competition by ~50-80% depending on location, and allowing for almost no overhead in SSL negotiation time.

As a result, the whole site is also being served via cloudflare’s piping service. Looking at analytics since enabling this, there has been negligible measurable change to performance (client-side load time), so it looks to be a keeper. It also allows me to throw up a custom error page should there be connectivity issues with data-centres or servers, which came in quite handy with recent data-centre troubles.
Speaking of data-centre troubles, I am currently monitoring the situation after the downtime experienced over the last month. The issue was quite a serious one, and while I don’t believe Softlayer’s resolution was completely correct, they were trying hard to get things back online.

The one area I am not happy with is the delay in communication from their end, and the lack of public acknowledgement (all ticket details are available only to clients via private support tickets). I will be considering my options, but likely won’t move from Softlayer this time around. They have a very stable network usually, and this may likely be the first major disaster at their end, so I am willing to give them a second chance.
woc2006 has been working hard on a new version of the osu!mania editor (let’s pretend the last one didn’t exist). It has a proper osu!mania layout and controls which allow for both real-time and manual mapping. Currently available on the test build for those who wish to check it out!


I pushed fixes to taiko backgrounds, by giving taiko mode a “metadata” bar below the playfield. This displays common information like the song artist/title, and replaces custom-baked backgrounds which were becoming quite prominent in taiko maps.



In order to make this work correctly, I shifted all taiko backgrounds based on the standard “taiko map template”, which not only provides a better default alignment, but makes sure the metadata in the background is not visible. The taiko playfield is no longer transparent, so any custom skins should be updated to take this into account and avoid artifacting.

The font used on the “metadata” bar defaults to a system font, but can be overridden on a per-skin basis by adding a taiko.ttf file to your skin. The taiko skin has been updated to reflect this (and should be automatically downloaded by the updater if you previous grabbed it via this method).

Oh, and the taiko playfield bar now fades in and out of kiai time :).
The osu! wiki has now been integrated with the main site design, and the old FAQ decommissioned as a result. The transition isn’t complete yet, with some styling looking a bit off and some basic javascript not working, but it is much better than what we had before. I hope this will


Stay with me here. I’m trying my best given circumstances.
