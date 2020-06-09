---
title: osu!stream 2020 release
date: 2020-02-26T08:00:00.000Z
published: true
---

[osu!stream](https://apps.apple.com/us/app/osu-stream/id436952197) was a project devised by me in 2012 to experiment with the idea of an osu! game on mobile platforms. The focus was on trying new things, so not only did I want to experiment with mobile game development, but also add elements using multi-touch. In addition, unlike the desktop release I wanted to have a go at curating all game content, including both licensing music and putting together a team of awesome mappers to create the beatmaps.

![](https://puu.sh/6km6g/8090daaf59.jpg)

Before I delve into some history and tidbits on the project, if you're just interested in giving it a shot, [click here](https://apps.apple.com/us/app/osu-stream/id436952197) to visit the app store and grab yourself a copy!


# History

osu!stream began development on [May 8 2010](https://github.com/peppy/osu-stream/commit/4ce2b8480c3b4b1eb94080cb1ea8e478a376882e) and was released on [August 1 2011](https://twitter.com/osustream/status/98025411409219585). During this time, I was concurrently working on the PC version of osu!, so osu!stream was somewhat a "side" project. Updates were released in the form of new features (such as the ability to preview maps before downloading) and song packs over the next 2 years or so.

It gained [some](http://www.pocketgamer.co.uk/r/Multiformat/Five+Stars/feature.asp?c=32092) [attention](http://doripake.blog84.fc2.com/blog-entry-121.html) [over the internet](http://www.bemani-france.com/forum/viewtopic.php?f=8&t=319&sid=3be950c6e39670d73eec9c3ae0a5bebc), and was featured by Xamarin as a game made completely on the Xamarin.iOS framework (link now defunct, unfortunately).

The game did quite well from a sales perspective, but was hindered by the complexity of the beatmap creation process and limited song choice for mappers. Many of the mappers either lost interest or didn't have enough spare time to keep a constant.. _stream_ of beatmaps coming in.

At the same time, osu! on PC was constantly growing in size. It's very hard to keep track of multiple projects, so I eventually made the decision to move my focus back completely to PC and let osu!stream sit without real updates for years. I don't regret this decision; the game was left in a good state and has enough beatmaps to be a very fun and unique "osu!" experience. I still see it as the most polished osu! release to date – although this is soon to be surpassed.

Interestingly, a lot of the concepts we are using in osu!framework have some history of being present in osu!stream. The concept of hierarchical drawables/sprites began to appear, and while quite raw, was used to apply game-wide scale and rotation effects which would otherwise not have worked on limited mobile hardware.

# Some statistics

There were a total of **3,839,438 scores** submitted over osu!stream's lifetime. This doesn't include fails, unlike osu!, and only considers those that logged in via twitter (241,540 total). For a better idea of total audience, there were a total of **over 1.5 million installations** as of 2016\. It's safe to say a lot of people enjoyed the game!

2.6 million free beatmap packs were downloaded over this period. As for sales, there were a total of 24,943 beatmap pack sales (averaging US$1.99 a piece) by 13,635 users. After taking out apple's cut and artist's cut, this worked out to around $24,000 in revenue over the lifetime of the product. This was distributed between myself, the mappers, other devs who contributed time and the graphics design work.

The mapping team consisted of around 15 people, hand-picked based on their mapping style (I wanted to emulate the amazing feel of iNiS maps – the stuff that was in the Osu! Tatakae! Ouendan! / Elite Beat Agents series). We released a total of 37 beatmaps for it by the end. Beyond this though, there were over 100 beatmaps in some stage of creation.

# A final release

Today marks the first update since September 2015\. I was actually planning on making this update over a year ago, but ran into some serious issues with newer Xamarin versions where the game would freeze at random due to a native memory issue. I came back to this muiltiple times over the last year and while I have still not tracked down the underlying cause for it (likely a mono bug), I found a hacky workaround which allowed this release to happen.

A few things have changed in this release:

- The game soundtrack has received a **complete refresh** thanks to superstar osu! composer [nekodex](https://nekodex.net/)! Experience a new take on the original osu!stream soundtrack in the game (pay attention to the main menu visualiser which is synced up to the new track). If you want to listen outside the game, you can also buy or stream the album (including the old version of each track) from [your favourite store/streaming service](https://nekodex.net/2020/album/osu-stream-themes/)
.
- Support has been added for new device aspect ratios and notch things (iPhone 10 / 11). The implementation of this was a bit hacky, but oh well.
- All beatmap packs are **now free**. They are still available via the "store" screen as I wanted to retain the original game experience.
- A few extra **unreleased packs are also available** as a bonus. These never made it out due to licensing or quality control issues, but I feel like there's not much reason to hold back now.
- Online ranking and login has been disabled. This used to be provided via a twitter login, but the API has changed and I don't really feel like updating that or maintaining the scoreboard. Existing scores are still visible, as I want people to be able to experience as much of the game experience as it was when fully activated.

I will not be working on this project further due to time constraints. While this may disappoint many, please be rest assured that the [osu!lazer](h) project has mobile in its sights, including bringing back elements of osu!stream (like multitouch)! For those unaware, you can already join the [testflight beta program](https://github.com/ppy/osu#running-osu) and jump straight in to give that a try.

Of course, there's one little thing I failed to mention: I am also [releasing the source code](https://github.com/ppy/osu-stream) to osu!stream, including all the beatmap creation tools and local multiplayer server (see the `network` branch).

While this is by no means a pristine codebase (try [osu!lazer](https://github.com/ppy/osu) / [osu!framework](https://github.com/ppy/osu-framework) for that!), my hope is that some curious developers can see what goes in to making a game from scratch with a focus on releasing it rather than making the code perfect. You have to cut corners sometimes (and oh so many were cut) to get things released.

As for the future of this repository, I _may_ provide code review and potential app updates if there are user contributions, although the criteria for these is quite specific so please make sure to read the README before diving in too deep.

While released under the all-permissive MIT license, please note that the osu! name is still covered by trademark law and you shouldn't go distributing binaries of this app unless you first rebrand it. And I'd still rather you ask before doing so in such cases, out of courtesy.

# Fun facts

A lot of cool things came from this project. Here's some things you may now know about it:

- The codename for this project was "osum", as in "osumobile". You might still see this term used around in the source code.
- osu!stream was written almost completely from scratch, including rewrites of file parsing, hitobject display etc.
- osu!stream was written with performance in mind. it could achieve a consistent 60fps on the iPhone 3G and original iPad, where most games were struggling to hit 30fps.
- An Android release was planned. Test builds were sent out to many users and while it ran perfectly on a few devices, the number of issues and number of different devices to support, coupled with the fact that Android touch screens at that point in time has shocking response times meant I never released it.
- All mappers were compensated for their time (between $100-200 per beatmap).
- All music for osu!stream was licensed ahead of time of the game's release. As I didn't have huge up-front money to spend, artist were offered a percentage of game sales (30-50%).
- I approached record labels to try and obtain correct licensing for larger artists, but was met with confusion over how to handle video game licensing. This situation has definitely improved over the last 8 years, as seen with featured artists.
- Over halfway through development, and after finishing some amazing doujin music based beatmaps, licensing terms were changed beneath us and we were unable to release a whole heap of maps. They've finally been released with this release (I hope this doesn't step on any toes, but it's completely free so hopefully it's fine).
- Mapping for osu!stream is quite a challenge due to the stream-switches requiring alignment checks, consideration for hands hiding hitobjects and general multitouch playability concerns.
- While some of the more arty UI components were provided by a community member (Koko Ban), the in-game skin is by me! and one of my favourite to-date.
- We had some [quite serious legal issues](https://blog.ppy.sh/post/73201847608/apple-ip-infringement-policy-woes-aka-where-is) which caused the app to actually get removed from the app store after some douche made fraudulent claims that he owned copyright over the _spinner_ texture.
- osu!stream was used in the osu!arcade cabinets. This was a limited run prototype arcade setup constructed by my dad and I. osu!stream would run on a mini ITX board with lighting controlled over serial to an arduino. A LAN multiplayer server could allow two instances of osu!stream to [compete in real-time](https://www.youtube.com/watch?v=0idZe5I_YjI) [head-to-head gameplay](https://www.youtube.com/watch?v=CJb5glKtJJM). One cool thing about this was you could see the other player's touches on your screen due to the magic of no latency networking!
- To increase the beatmaps available to osu!arcade, the beatmap tools were modified to do a best-attempt conversion of PC beatmaps. It doesn't always work well and due to the tools being a completely different codebase, can be thrown off by all the zany things osu! maps do which are not supported. You can see a good assortment of beatmaps [played here](https://www.youtube.com/watch?v=3RZ0e5QxUj8).
- The game got pirated (of course) on jailbreak stores. They bought the packs using a specific UDID then hardcoded that into the app to continue to download the beatmaps from my server. Unfortunately for the poor souls that used this version, I quickly changed the server-side code to return 1gb of random data to these users, instead of the beatmaps they requested. This would waste their download quota and eventually crash their device.
