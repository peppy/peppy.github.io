---
layout: post
title: This Week in osu! #3
permalink: /post/36937408374/this-week-in-osu-3
date: 2012-12-01 06:53:49 +0000
tumblr_url: http://pppy.tumblr.com/post/36937408374/this-week-in-osu-3
categories: osu! dev weekinosu!
---
With the OWC tournament ongoing, I have been helping out in that area and further improving broadcasting tools. As a result, not much visible progress was made this week.

*	Multiplayer history pages on the osu! website now update in real-time! I really wanted to provide an up-to-date version of scores without forcing people to mash the refresh key, and am happy with the result. Updates propagate within 5 minutes of in-game events. I also re-designed these pages to be more readable, and use the new beatmap info panes.

	![multiplayer history](http://puu.sh/1wfvS)

*	I have made further improvements to the tourney spectator client, removing file access conflicts when downloading new beatmaps and/or processing the beatmap database. Each of the clients now communicates with each other to schedule updates, with the first client being the only one to perform the grunt of the work. Country labels were also added, so streaming plugins are no longer required for these details.

*	When making some web changes, I found some code which was used for user rating of maps that had not yet been updated to using the latest database API, so I spent some time fixing this up. In the process I removed a good 0.5gb of redundant data and improved the efficiency of beatmap ratings by a whole lot!

*	A lot of new localisable fields were added including newer options screen text (by woc) and main menu tips (by me). I made further improvements to the usability of the [localisation spreadsheet](https://docs.google.com/a/ppy.sh/spreadsheet/ccc?key=0AlsSAL_F7-xDdHhUUjNSa19QendtcTdYUjE2S2hnVHc#gid=0), as well. There are at least three new languages this week which went from non-existent to 100% completion. Let's say I am very impressed with this outcome – although I'm not as impressed that the Japanese translation is completely stagnant at lower completion than the existing v1 translation (any takers?!).

*	I have started automatically reporting beatmap corruption to the server so I can figure any remaining causes of this and iron things out.

*	I have begun micro-optimisations on the bancho network stack to reduce the size of user presence packets and hopefully speed up the initial osu! server connection – which can be seen struggling when there are 8,000 users. It is currently sending about 250kb of data, and so far I have reduced this by 35%, and hope to gain further reductions before making this live.

*	I received my t-shirts and hoodie order from the osu!market, and am thoroughly [pleased with the quality](http://osu.ppy.sh/forum/p/1943762)! We have also recently added some mugs to the store with the same designs, so go check them out if that is your kind of thing :).

	![linkosu!](http://puu.sh/1wfLu)


As a reminder, we have been streaming the osu! World Cup via twitch, and hitting around 3.5k viewers at peak, so make sure to [check out some of the matches](http://twitch.tv/osuworldcup) (the schedule is listed below the stream, and you can also access recording as well in the "Videos" tab).