---
title: July 2018 Development Update
date: 2018-07-03
published: true
---

Hello everyone! Back again one month later with a review of how the last month went, along with a report on our direction for this coming month.

# June 2018 Review

## [osu](https://github.com/ppy/osu) *The osu!lazer project. The future of the osu! client. Download preview releases from [here](https://github.com/ppy/osu/releases) and follow along!*

As you will see below, we failed a few of the milestone goals, but I think we can all agree that amazing progress was made. You can view full changelogs by checking out each build from the month of June (I hope we can present this on a single page next month!):

Changes for the month: [2018.629.0](https://osu.ppy.sh/home/changelog/lazer/2018.629.0), 
[2018.628.0](https://osu.ppy.sh/home/changelog/lazer/2018.628.0), 
[2018.627.0](https://osu.ppy.sh/home/changelog/lazer/2018.627.0), 
[2018.626.0](https://osu.ppy.sh/home/changelog/lazer/2018.626.0), 
[2018.622.0](https://osu.ppy.sh/home/changelog/lazer/2018.622.0), 
[2018.621.0](https://osu.ppy.sh/home/changelog/lazer/2018.621.0), 
[2018.618.0](https://osu.ppy.sh/home/changelog/lazer/2018.618.0), 
[2018.616.0](https://osu.ppy.sh/home/changelog/lazer/2018.616.0), 
[2018.614.0](https://osu.ppy.sh/home/changelog/lazer/2018.614.0), 
[2018.612.0](https://osu.ppy.sh/home/changelog/lazer/2018.612.0), 
[2018.611.0](https://osu.ppy.sh/home/changelog/lazer/2018.611.0), 
[2018.608.0](https://osu.ppy.sh/home/changelog/lazer/2018.608.0), 
[2018.607.0](https://osu.ppy.sh/home/changelog/lazer/2018.607.0), 
[2018.606.0](https://osu.ppy.sh/home/changelog/lazer/2018.606.0).

That's a *lot of builds*!

![](https://puu.sh/AP8On/28fda5d5c6.png)

### Basic structural implementation of osu!mania editor *WIP*

Some structural changes were made to get things ready for implementation of the mania editor, but actual editor work was slower than expected. Further work on this will continue into July.

### Add automatic error reporting on hard crash *SKIPPED*

This was not completed. That said, we were able to fix most of the startup crashes that were reported. I hope to complete this in July as it will help us act quickly on reports, with less back-and-forth to figure out what went wrong.

### Begin work on multiplayer lobby system *SKIPPED*

Still don't feel like we are in a state where I want to start adding multiplayer. I'll know when it's ready. There's just too many other issues I want to fix first.

## [osu-framework](https://github.com/ppy/osu-framework) *The game framework behind osu!lazer. Written from scratch with osu! in mind, but very extensible.*

![](https://puu.sh/AP8OC/ad3335747a.png)

While we haven't been adding much new functionality to the framework, bug-fixes are ongoing. We still have a lot of outstanding issues surrounding platform compatibility and single-frame drawable glitches due to incorrect invalidation scenarios.

### Move both osu and osu-framework to target netcore2.1 *WIP 80%*

We were successful in migrating all the development configurations to be netcore2.1 only. This means that all development going forward will be done under the netcore runtime. Windows releases are still targeting net471 for the time being to ensure we don't hastily break auto-updates. We also need to still ensure that all tests still perform correctly under netcore when run on our CI infrastructure. These remaining tasks should be completed over the month of July.

That said, we did run into a performance degradation during debug sessions on macOS that we are [currently tracking in hope of a fix](https://github.com/ppy/osu-framework/issues/1664).

### Add automatic nuget package builds of osu and osu-framework *LIVE*

We completely made the switch to nuget dependencies for the framework. This turned out to be a really positive move forward, further isolating development of the two projects and allowing for better testing at each end. We are now pushing out regular builds to nuget.org

For the time being, we're holding off the osu-side nuget packages until there's a demand for them. If you're working on a custom ruleset and are interested in seeing this happen then please let us know and we'll expedite it!

## [osu-web](https://github.com/ppy/osu-web) *The new web front-end. [Already live](https://osu.ppy.sh/home) but hasn't yet replaced the old site, pending feature parity.*

![](https://puu.sh/AP8OO/47edec9cb1.png)

Changes for this month:

[2018.702.0](https://osu.ppy.sh/home/changelog/web/2018.702.0), 
[2018.701.0](https://osu.ppy.sh/home/changelog/web/2018.701.0), 
[2018.629.0](https://osu.ppy.sh/home/changelog/web/2018.629.0), 
[2018.628.0](https://osu.ppy.sh/home/changelog/web/2018.628.0), 
[2018.627.0](https://osu.ppy.sh/home/changelog/web/2018.627.0), 
[2018.626.0](https://osu.ppy.sh/home/changelog/web/2018.626.0), 
[2018.625.0](https://osu.ppy.sh/home/changelog/web/2018.625.0), 
[2018.622.0](https://osu.ppy.sh/home/changelog/web/2018.622.0), 
[2018.621.0](https://osu.ppy.sh/home/changelog/web/2018.621.0), 
[2018.620.0](https://osu.ppy.sh/home/changelog/web/2018.620.0).

### Complete the new changelog page *LIVE*

The new changelog page is now live! It has already been a great help in visualisation the status of our various projects. I hope you guys are enjoying viewing and commenting on individual releases as we are making the regular releases! Click any of the change links in this post to check it out for yourself, if you haven't already.

### Move osu-web score lookups to elasticsearch *WIP 80%*

The back-end component for this was written and is deployed. The front-end changes are also ready to be deployed; we're just making a few final touches and quality checks before deploying this. It should be the start of a lot more flexibility in score lookups, though. Exiting stuff!

### New private messaging system *WIP ~50%*

The new PM system is coming along nicely. Due to the fact this is part of an experimental push for changing the architecture of our more interactive web-based components, it will be taking a bit longer than a month to get in place. This was expected; hopefully we'll see some results live this month, though!

# July 2018 Goals

## [osu](https://github.com/ppy/osu/milestone/37)

Check out the milestone for a full list of tasks. We're keeping actual listed tasks below to a minimum to ensure we can hit goals this month. We also still have some lingering issues from June that need to be completed.

### Full-blown custom sample support

While lazer has had the basic level of custom hitsounds for quite a while, it has not supported infinite custom banks or per-hitobject hitsounds (commonly used in mania). This will be [added this month](https://github.com/ppy/osu/issues/2907).

### Selectable full-screen resolutions

All the building blocks for this are coming together, so this should be feasible to have implemented during this milestone.

## [osu-framework](https://github.com/ppy/osu-framework/milestone/14)

### Fix remaining autosize / update order issues

There are a lot of remaining cases where incorrect update orders between various low-level framework components means that layouts or styles are incorrect for single frames. Here's a couple of examples (notice the single-frame flicker of an incorrect state):

![](https://puu.sh/AQ3fC/e63d04af89.gif)

![](https://puu.sh/AQ4ap/8373705673.gif)

This is turning up in many places and requires some dedicated attention to fix. Likely not going to be an easy task, but something that needs to be addressed sooner rather than later.

### Ongoing input subsystem improvements

We have begun moving away from passing around full input states between input sources (handlers) and the drawable hierarchy, but there are some regressions and WIP elements which still require attention. The completed result should give us a much more stable and manageable input framework. Extensive unit tests are being added as we go to avoid regressing int he future.

## [osu-web](https://github.com/ppy/osu-web/milestone/14)

### Add ability to report users from profile

This has been missing for the longest time and remains one of the few features we need to truly turn off the old site.

### Test and deploy new registration process

While the API already contains the logic to handle user registrations, they are still currently occurring through the old site. This is a really immersion-breaking experience which new users should not be exposed to.

![](https://puu.sh/AQ4of/d908f5e860.gif)

I hope to move registration to inside the client (with an implementation in `osu-stable`) to address this.

Thanks for following along. Will report back in a month!