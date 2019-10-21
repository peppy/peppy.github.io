---
title: A definitive osu!lazer FAQ
date: 2019-10-21T00:00:00.000Z
published: true
---


## Development and Release Schedule

### Is osu!lazer a new game or an update?

"lazer" is just a codename for the development project. When we're done, lazer will become "osu!" and be released as an update for the existing client. It will migrate all existing user content and work on (basically) any system which osu-stable could run on.

### Why isn't lazer out yet?

Technically, it is already out (and has been since February 2017!). You can find the latest release available for Windows, macOS, iOS and android [here](https://github.com/ppy/osu#releases). For now, it is released as a preview which will run alongside your existing osu! install.

Do note that as everything is stored in a new format, it will take up more disk space if you import your existing beatmap collection.

### But I can't submit scores! Until I can earn pp it's not "out"

Fair call. We're holding off adding this final step until everything else is ready, because we want to ensure the game experience is where we expect it to be first.

There is also a lot of final checking of compatibility which will need to happen before we can add score submission, to ensure the vast library of beatmaps, skins and otherwise are compatible and on fair grounds with historic scores.

Until then, you can enjoy the new multiplayer system which is exclusive to lazer, allowing local leaderboards to be created by anyone.

### The release date was supposed to be 2015! I saw it in a teaser video!

The 2015 had a "?" and was meant to be a very optimistic outlook on development. The video description mentioned 2016 as being the goal.

Along the way, we ran into some serious blocking issues which resulted in the decision to rewrite osu!lazer as a new project from scratch, rather than building on top of the existing osu! codebase. This happened in the early months of 2016.

Since then we have been working extra-hard to build both a [game framework](https://github.com/ppy/osu-framework) and rebuild all the intricacies of osu!, while also fixing all the issues that existed in the old codebase to allow for implementing new features and extending on the game more than ever before.

We hope you can understand how excited we are to have this opportunity. The decision could only be made because we already have such a stable game client which (in general) satisfies the community's needs quite well.

### Why is it taking so long?

We are aiming for perfection. That has meant, on several occasions, writing and rewriting systems until we are content that they will last well into the future. What we are working on is not a temporary solution, rather something to carry the osu! community through the rest of its (hopefully long) life.

We are also taking the time to involve the community via open source, allowing anyone to contribute code.

There are a few benefits of taking this time and diligence:

- More people getting involved means there are less points of failure
- High quality code and documentation makes it easier for new developers to jump in and help out.
- We will hopefully not ever reach a similar fate as the old codebase, requiring a rewrite.

### Why open source?

I have always wanted osu! to be open source. It is part of my belief that game development and operation should be very transparent to the end user. It may take a bit longer to do development in the open, but we are already seeing appreciation from other devs (and users) for making this move.

It also ensures that osu! can live on beyond me. If something were to happen to me, it is very feasible that members of the community can take over development into the foreseeable future.

### Will there be a transition period where I can use stable?

In a similar way to stable and the stable-fallback release stream, the existing client will be available until it no longer has a function. For those of you with the mentality of "I want to use the current client forever, I don't like lazer!" please bear with us. Our end goal is to make lazer better than the old client in every way, to the point there will be no reason _not_ to use it.

## New Features

### What's new in lazer?

While our primary goal is feature parity with stable, there are already some features that are exclusively available in lazer:

- Many new mods
- A new "timeshift" multiplayer mode (read more about this [here](https://blog.ppy.sh/enjoying-osu-with-others/))
- The ability to change settings anywhere and have them immediately take effect
- A more streamlined UI and a fresh design
- Access to most of the web-only content from within the game (news, changelogs, user profiles, rankings, beatmap info)
- A song density graph in gameplay
- The ability to seek in replays
- The ability to hide difficulties
- Soft delete everywhere – you can restore beatmaps after deleting if you made a mistake

### Will xxx feature be implemented in lazer?

We are primarily working on feature parity, but if the feature you've asked for has been something people have been asking for for quite a while, you can be 90% sure that it is one of the reasons we are working so hard to rewrite osu! in the first place!

### Why is xxx feature being implemented in lazer but not stable?

As much as we'd like to bring new features to the stable client, it doesn't make sense in many instances.

Generally, the implementation overhead for adding something in lazer is magnitudes lower than stable. By implementing it on both clients, the time of implementation would be more than double, delaying the release of lazer further.

For the last couple of years we have had a [feature freeze](https://en.wikipedia.org/wiki/Freeze_(software_engineering)) on stable for this reason.

### Will xxx feature be available on mobile?

Yes. Mobile and desktop will have feature parity.

### Will new skin features be added?

Yes. While the existing skin/beatmap formats have been locked, we will be adding new formats (and in-game editors) which allow for huge amounts of flexibility.

Again, we've been planning everything with extensibility in mind. If you can think of it, it will likely be possible at some point in the future. That said, we are looking to make lazer have feature parity with stable before adding new options.

### Will lazer have adjustable beatmap difficulty settings?

Yes, we are actively working on per-mod settings which will open a pathway for this.

## Performance and Compatibility

### Will it run on my PC?

If you can run stable, you will be able to run lazer. Note that users who can't run stable for some reason (and are using stable-fallback) may or may not be able to run lazer. We are aiming for _better compatibility than stable_ if anything.

Likewise, we also predict the system requirements will be _equal or lower_ than stable. We are already seeing better performance, less frame drops and lower latency than stable in many scenarios (but not all, yet).

### I've tried lazer but it runs worse than stable!

While lazer (usually) runs better than stable on most systems, there are always edge cases! We're still got plenty of work to do on optimisations (and already know all the remaining optimisations which will provide the largest benefits).

Make sure to check back regularly.

### Will vulkan be supported?

While we are currently targetting OpenGL 4.0 and GLES (for mobile), we have been developing with graphics API portability in mind. We will be supporting vulkan and metal in the future.

### Will my skin work?

Yes. We will be 100% supporting skins in gameplay, along with some menu-level interface elements (like the back button). We're currently at about 90-95% implementation of skins for osu! and osu!catch, while osu!mania and osu!taiko need further work.

### Will the new interface be skinnable?

We will be adding more skin support after we're happy with the existing gameplay and support for legacy skins, including the ability to customise more of the menu screens.

### Will there be touch controls to allow playing fast streams etc. on mobile?

Yes, these are in development. For now, you can connect a hardware keyboard.

### Will circles be larger on mobile?

Gameplay will likely get larger, yes.

We still have a lot of work to provide a good experience on mobile. We are primarily developing for PC first, and will address mobile UX issues over time.

### I don't like the new gameplay UI layout

Don't worry, we are adding support for customisation of the UI layout, to the point you'll be able to make it look like it used to (or potentially completely different!).

For example, a setting for the density graph is currently in development, which will allow it to either be hidden or less tall. Likewise, moving elements around the screen will eventually be present.

## Leaderboards and Scoring

### Will leaderboards / multiplayer be shared between PC and mobile platforms?

We haven't made final decisions about the future of the global leaderboards. Personally I strongly believe in cross-platform play and hope to make this feasible.

### Will lazer only use "score v2"?

We have implemented a new scoring algorithm which takes elements from v2 but is not the same. It is made with backwards compatibility in mind.

There is already an option in lazer to switch the display mode of scoring between quadratic (classic) and 1mil cap (standardised), and eventually this will be supported game-wide to cater to user preference.

### Will the global leaderboards potentially get reset?

We will never reset the leaderboards. No final decisions are made yet, but the closest to a reset would be to freeze them in some accessible way. We value the rich and long history of osu! as much as you do.

### Will scoring changes (like slider judgements) be applied to existing beatmaps?

We haven't made a decision about this one yet. It may be applied only in places it doesn't affect the playability of the map (using predetermined rules) or may only be applied to new beatmaps.

### Where do I get lazer?

You can find the latest release available for Windows, macOS, iOS and android [here](https://github.com/ppy/osu#releases).

Thanks for reading until the end. I hope this covered a lot of your concerns. If you happen to have questions which haven't been answered here, feel free to reach out on [twitter](https://twitter.com/ppy) or in the comments below!
