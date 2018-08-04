---
title: August 2018 Development Update
date: 2018-08-04
published: false
---

Welcome to the August development update.

# July 2018 Review

## [osu](https://github.com/ppy/osu) *The osu!lazer project. The future of the osu! client. Download preview releases from [here](https://github.com/ppy/osu/releases) and follow along!*

As you will see below, we failed a few of the milestone goals, but I think we can all agree that amazing progress was made. You can view full changelogs by checking out each build from the month of June (I hope we can present this on a single page next month!):

You can view a full digest of the changes from July using our [new changelog system](https://osu.ppy.sh/home/changelog/?stream=lazer&from=2018.701.0&to=2018.801.0).

![](https://puu.sh/B8x5k/dc5a6db5e9.png)

### Basic structural implementation of osu!mania editor *PENDING REVIEW*

Work on the basic structure for the osu!mania editor has been completed, pending review before it makes it into a release build.

### Add automatic error reporting on hard crash *PENDING REVIEW*

Sentry support has been implemented, along with allowing singular errors to result in a non-crash result (similar to how osu-stable avoids many unnecessary crashes). Should be in soon!

### Full-blown custom sample support *COMPLETE*

All hitsounds should now correctly be played back during gameplay.

### Selectable full-screen resolutions *WIP, PENDING REVIEW*

Not yet ready.

## [osu-framework](https://github.com/ppy/osu-framework) *The game framework behind osu!lazer. Written from scratch with osu! in mind, but very extensible.*

![](https://puu.sh/B8x90/25671ca3ba.png)

### Move both osu and osu-framework to target netcore2.1 *COMPLETE*

All framework and osu! deployments are not 100% netcore2.1! This is a huge step forward and allows us to focus on making the net core experience as good as possible. It also means that release builds are running on the same runtime as we are using to debug, which makes it easier to locate issues before they are deployed tto a production environment.

To make this happen, I ended up forking and publishing out own [squirrel.windows](https://www.nuget.org/packages/ppy.squirrel.windows/) packages to keep automatic update support working on windows builds.

The performance issue I mentioned in the last blog post (macOS debugging) has not yet been resolved, but I have [filed an issue](https://github.com/dotnet/coreclr/issues/18705) to track this. Hopefully it will get some attention soon.

### Fix remaining autosize / update order issues

Still unresolved.

### Ongoing input subsystem improvements

Huge improvements have been made to the input handling. There is still some further changes we are looking to make which will likely be completely over the next month.

## [osu-web](https://github.com/ppy/osu-web) *The new web front-end. [Already live](https://osu.ppy.sh/home) but hasn't yet replaced the old site, pending feature parity.*

![](https://puu.sh/B8xm7/3efcc0e1d5.png)

You can view a full digest of the changes from July using our [new changelog system](https://osu.ppy.sh/home/changelog/?stream=web&from=2018.701.0&to=2018.801.0).

Almost half the milestone tasks were unachieved. Pretty slow progress. Not really much to say here...

### Move osu-web score lookups to elasticsearch *COMPLETE*

This has now been deployed. You may notice that profile pages are now quite a lot faster to load (especially for players with a lot of scores). Eventually we will update other pieces of the infrastructure to benefit from this performance improvement, such as in-game song select lookups.

### New private messaging system *WIP ?%*

Work on this was slow this month, as attention was diverted to code review instead. ETA currently unknown.

### Add ability to report users from profile

Not even started. Not sure what happened here; this was supposed to be #1 priority but never got touched.

### Test and deploy new registration process

Not even started. Not sure what happened here, but nothing got done.

# July 2018 Goals

## [osu](https://github.com/ppy/osu/milestone/37)

## [osu-framework](https://github.com/ppy/osu-framework/milestone/14)

## [osu-web](https://github.com/ppy/osu-web/milestone/14)

Thanks for following along. Lazer progress has been great; web has been slow and a bit disappointing but there's not much I can do as that is out of my power. Will report back in a month!