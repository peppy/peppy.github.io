---
title: August 2018 Development Update
date: 2018-08-14
published: true
---

Welcome to the August development update. A bit late but you are probably used to that by now. Been focused on keeping things running as usual.

# July 2018 Review

## [osu](https://github.com/ppy/osu) *The osu!lazer project. The future of the osu! client. Download preview releases from [here](https://github.com/ppy/osu/releases) and follow along!*

July was a bit of a slow month, and we didn't really cover the scope we planned on. 

You can view a full digest of the changes from July using our [new changelog system](https://osu.ppy.sh/home/changelog/?stream=lazer&from=2018.701.0&to=2018.801.0).

![](https://puu.sh/B8x5k/dc5a6db5e9.png)

### Basic structural implementation of osu!mania editor *COMPLETE*

Work on the basic structure for the osu!mania editor has been completed. It is now at a point in development roughly equal to the osu! mode editor. While it's not yet in a usable state, the goal was to get a framework in place for structuring the different editor overlays for each ruleset, which was definitely achieved by this work.

<video width="50%" controls autoplay loop src="https://puu.sh/BdOeb/8dd164f81a.mp4"></video>

I'm not sure if we'll continue adding the editors for the remaining two rulesets or expand functionality for osu!/mania to begin with, but you can expect further improvements coming to the editor over the coming months.

### Add automatic error reporting on hard crash *PENDING REVIEW*

Sentry support has been implemented, along with allowing singular errors to result in a non-crash result (similar to how osu-stable avoids many unnecessary crashes). Not yet merged, as we found quite a few cases where exceptions were not being handled correctly along the way.

Should be in soon!

### Full-blown custom sample support *COMPLETE*

All hitsounds should now correctly be played back during gameplay. This includes per-object samples (commonly used in mania) as well as unlimited custom sample sets associated with timing sections.

### Selectable full-screen resolutions *PENDING REVIEW*

While framework support has been added for this, the UI is not yet merged. Should happen this month.

### More skinnable elements *COMPLETE*

Skin support was added for slider ticks, reverse arrows, follow circles, slider balls and follow points (in addition to existing support for hit circles, approach circles and judgements). If you already have a skin loaded, you should see the new elements displaying. If you haven't yet imported a skin, it's as simple as dragging an .osk file into the lazer window.

### Gameplay visual fixes *COMPLETE*

Slider repeats were being shown too late, causing visual uneasiness when trying to read sliders with one of more repeat points. This has been resolved and should now match stable.

The slider follow circle was visually (and logically) far too large, making sliders much easier than they should be. This has now been resolved and should match stable.

Sliders which use a linear curve style felt a bit ugly when snaking in due to the reserve arrow changing its rotation in a single frame. Interpolation has been added to make these corners smoother.

## [osu-framework](https://github.com/ppy/osu-framework) *The game framework behind osu!lazer. Written from scratch with osu! in mind, but very extensible.*

![](https://puu.sh/B8x90/25671ca3ba.png)

### Move both osu and osu-framework to target netcore2.1 *COMPLETE*

All framework and osu! deployments are not 100% netcore2.1! This is a huge step forward and allows us to focus on making the net core experience as good as possible. It also means that release builds are running on the same runtime as we are using to debug, which makes it easier to locate issues before they are deployed to a production environment.

To make this happen, I ended up forking and publishing out own [squirrel.windows](https://www.nuget.org/packages/ppy.squirrel.windows/) packages to keep automatic update support working on windows builds.

The performance issue I mentioned in the last blog post (macOS debugging) has not yet been resolved, but I have [filed an issue](https://github.com/dotnet/coreclr/issues/18705) to track this. Hopefully it will get some attention soon.

### Fix remaining autosize / update order issues *PENDING REVIEW*

A pull request is open which fixes the majority of these issues. It still needs to be reviewed and tested for any performance regressions, but should be arriving soon.

### Ongoing input subsystem improvements

Huge improvements have been made to the input handling. There is still some further changes we are looking to make which will likely be completely over the next month.

## [osu-web](https://github.com/ppy/osu-web) *The new web front-end. [Already live](https://osu.ppy.sh/home) but hasn't yet replaced the old site, pending feature parity.*

![](https://puu.sh/B8xm7/3efcc0e1d5.png)

You can view a full digest of the changes from July using our [new changelog system](https://osu.ppy.sh/home/changelog/?stream=web&from=2018.701.0&to=2018.801.0).

Almost half the milestone tasks were unachieved. Pretty slow progress. Not really much to say here...

### Move osu-web score lookups to elasticsearch *COMPLETE*

This has now been deployed. You may notice that profile pages are now quite a lot faster to load (especially for players with a lot of scores). Eventually we will update other pieces of the infrastructure to benefit from this performance improvement, such as in-game song select lookups.

### New private messaging system *WIP*

Work on this was slow this month, as attention was diverted to code review instead.

### Add ability to report users from profile *PENDING REVIEW*

We're finally on track for adding back one of the few missing features from the new profile pages. You will soon be able to report users again.

### Test and deploy new registration process

Did not happen.

# August 2018 Goals

## [osu](https://github.com/ppy/osu/milestone/38)

## [osu-framework](https://github.com/ppy/osu-framework/milestone/15)

## [osu-web](https://github.com/ppy/osu-web/milestone/15)

Leaving our August goals blank for the time being. Already halfway through the month, we're playing catch-up on missed goals and outstanding bug fixes. You can still click in to the headings above to see what is remaining to catch up on missed milestone tasks, though!

Thanks for following along.
