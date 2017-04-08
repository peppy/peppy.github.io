---
layout: post
title: This Week in osu! #9
permalink: /post/41003637501/this-week-in-osu-9
date: 2013-01-20 11:38:10 +0000
tumblr_url: http://pppy.tumblr.com/post/41003637501/this-week-in-osu-9
categories: weekinosu! dev osu!
---
The observant will notice that I have been a bit less active over the last couple of weeks. This is partly due to the fact that I have been moving/settling in to a new living and office environment, and catching up with a lot of people I haven't seen in a while. Things are getting back on track though, and I have been busy not only working on my own new features/fixes, but also merging the contributions from Ephemeral and woc2006.

*	Added the ability to reset key bindings to defaults. This is one of those feature requests I see and instantly wonder why it isn't already implemented. I then proceed to drop everything and implement it immediately.

*	Fixed remaining issues with "Loading..." players in multiplayer games. This was being caused due to a constant not being the same on server and client, meaning if a certain number of presence requests were made at once, they would be silently ignored by bancho (causing those players to remain in a loading state forever).

*	Widescreen support in Match Setup thanks to Ephemeral. This means that as far as I can tell, *every* game mode/screen in osu! is now widescreen compatible. Quite a good achievement!

*	A few futher tweaks were required to hyperdash after getting feedback from pro players. This was an interesting one to follow up on, because while a lot of players voiced how much they disliked the new changes, they could not say why. Luckily I did find someone who could pinpoint the issue at hand – specifically the behaviour of the "dash" button during hyperdash – and it will be pushed out as a fix in the next release.

*	I did a lot of internal clean-up on error handling scenarios, to make processing error reports a lot less painful. Also fixed a few scenarios where osu! wouldn't automatically restart after it says it will.

*	"Finally" updated the main menu copyright graphic, which is no longer really that. I removed the (in my opinion) unnecessary copyright text and made it more friendly and compact.

*	I did also start work on a "Free Mod" mode for multiplayer, allowing each player to choose their own mods. There's still quite a bit of implementation and testing to get this working perfectly, but expect it to hit the test build in the next couple of days!

Touching back on the start of this post, I am now in Japan for the near future. Give me a yell if you are in Japan (or planning to be over the next few months) and we may be able to catch up for a coffee, or game of jubeat ;).

*As a side note, I was able to write this entry completely on my iPhone using the newly released Textastic code editor. Pretty awesome stuff.*