---
layout: post
title: The Last Two Months in osu!
permalink: /post/54501455726/the-last-two-months-in-osu
date: 2013-07-03 09:11:00 +0000
tumblr_url: http://pppy.tumblr.com/post/54501455726/the-last-two-months-in-osu
---
I've held off writing these (originally) weekly posts because I feel like gathering the required content to make them interesting – screenshots, links and such – to be quite a large time sink, which I would rather spend on making things happen. I also feel like you guys deserve more updates. So here's a brief summary of all the awesomeness I (and others) have been doing, mostly behind the scenes:

* The update system was rewritten. osu! should now be able to update in the background without running the external updater app (osume). I have a blog post specifically on the reasoning behind this change and a lot more detail written and almost ready to post, so check that out when it appears.

	![update now!](http://puu.sh/2PkJo/b0d82cdbd3.png)

* The whole osu! infrastructure has needed to scale with the increasing user base. Database load was edging closer towards saturation, so I went performed a bunch of software and hardware optimisation with a very fine comb. This involved deploying more read-only slaves, tweaking indices for better write performance, switching table engines of some high-write tables, altering MySQL configuration on the master, re-partitioning some tables, and making more room on SSDs for hot IO paths. This really needs a full post to understand the scale and effort which goes into keeping a system like osu! running (on my own).

	![database load](http://puu.sh/3tZTf/3155c6099b.png)

* To make space on SSDs, I finally took steps to move replay data out of the database. Many of my database servers operate with no HDD storage, which means irregularly accessed replay data was taking up valuable storage space (those replays ain't small by any means). I tested riak and mongodb, but finally settled with a hosted solution: Amazon S3. This relieves the task of maintenance of storage, and adds redundancy which hasn't existed to the level it should have until now. As a result, I have also started **storing the top 50 replays** for every beatmap, rather than top 40.

* The osu! main menu now has a [shiny visualisation](http://www.youtube.com/watch?v=nf2_H1nQ70k)! The osu! cookie now glows as your music gets more intense. It also pulses more as the song gets louder.

	![shiny!](http://puu.sh/3u0cc/d538e902af.png)

* In order to make audio transitions and loading more performant and flexible, I rewrote a large portion of the osu! audio framework. This isn't yet in a public release, but should be coming soon. Will help decrease load time on song select previews and making the transition into gameplay a lot more smooth. Also allows for multiple audio tracks playing at once, which may be useful for storyboarding.

* Resolution switching has also received some attention, making switches from fullscreen to windowed quicker and smarter. Handling of borderless window is now done so as its own mode, which won't overwrite your window resolution settings.

* The cause of some replays breaking (misses where the player didn't actually miss) has been found and patched. Unfortunately it was an error with the replay data itself, so some existing replays are going to be broken for eternity. I tried to hack in a fix for them, but it's just not worth it due to the potential of causing weirdness on other replays. Might be best to just get a list of the remaining broken replays and edit the replay data.

* I rewrote my localisation toolkit to allow *almost* automatic string extraction from osu!. An initial test run of it saw a double in the number of [localisable strings](http://docs.google.com/a/ppy.sh/spreadsheet/ccc?key=0AlsSAL_F7-xDdHhUUjNSa19QendtcTdYUjE2S2hnVHc&usp=drive_web). Expect this to keep increasing as I get the impulse to make more available. Note that these updated localisations are not currently in the public release due to some show-stopper bugs in other places.

* I've been working quietly on a new version of pp (ppv2) which will make the ranking system a lot more understandable, real-time, and applicable to lower level players. It also shouldn't jump around as much. I hope to make it completely open so critics can suggest improvements, and they will be applied as necessary. ppv2 has its own processor which is quite a beast, and can handle recalculations of users in real-time without almost no overhead. Getting this live will mark the end of daily pp processing which currently eats a hell of a lot of processing power.

* I've been working on a new beatmap modding infrastructure and generally rethinking the whole process. You can read more [here](https://docs.google.com/a/ppy.sh/document/d/1dGiI-lfIFBZHw2AHx9s1ku3HUrh-lKnZmYu8QwE1yxw/edit) and see a portion of the system in action [here](https://osu.ppy.sh/p/mod_map?s=85124). I haven't had the time to push this out for real-world use yet, but I really want to this month.

* I have a branch that finally compiles without XNA, and runs under .NET4.5 (or anything in between). The eventual plan is to move forward from .NET2.0, as there are **huge** performance improvements with the newer releases – many of which will see less "lag spikes" that some people experience. This will mark the death of DirectX support, but don't worry; OpenGl support will be vastly improved and tested before this happens.

* Experimental replay scrubbing is available on the test build, but was broken recently with the above audio framework changes. I'll fix that soon, so jump on test build and give it a whirl if you are curious. This won't be available on public in the next release, but maybe sometime soon after. When it works ;).

* The osu!api has [gone live](http://github.com/peppy/osu-api/wiki), giving developers access to some of the data osu! has built up over the years. It is currently quite minimal, but this is intended as I plan on only adding new API calls which people will find useful to create interesting services and apps. If you want to request any additions to the API, file an [issue](https://github.com/peppy/osu-api/issues) on GitHub.

* Disqus is now available on all beatmap pages, allowing for discussion outside the forum (which in the case of ranked maps is not so active). It makes use of SSO (Single Sign-On), meaning you can post using your existing osu! account. Feels very integrated and nice to use. And it's threaded!

* A [mapping contest](https://osu.ppy.sh/forum/t/134515) has run and ended, currently in the judging stage. While it didn't go as smoothly as hoped, we to plan on having more in the near future to make up for it.

A few milestones:

* 10,000 consecutive users peak (5th May).
* 500,000 active users (10th June).
* 100,000 likes on [facebook](http://facebook.com/osugame) (1st July).
* 1,500,000,000 plays (3rd July).
* Approaching 3 million registered accounts!

I know I've still missed many things from the above lists. Apologies for that; I will strive to get more regular updates up so you get a more granular look at what is going on. osu! is growing at a pretty crazy speed and I'm doing my best to keep up. Hopefully you guys can agree :).

*If you'd like me to write about any of the above dot points in more detail, leave a comment! I have a lot of detail I can add, but don't want to bore you all with technical blabber that no one cares about.*