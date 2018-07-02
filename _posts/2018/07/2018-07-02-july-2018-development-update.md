---
title: July 2018 Development Update
date: 2018-07-02
published: false
---

Hello everyone!

# June 2018 Review

## osu

As you will see below, we failed a few of the milestone goals, but I think we can all agree that amazing progress was made. You can view full changeslogs by checking out each build from the month of June (I hope we can present this on a single page next month!):

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

### Basic structural implementation of osu!mania editor **WIP**

Some structural changes were made to get things ready for implementation of the mania editor, but actual editor work was slower than expected. Further work on this will continue into July.

### Add automatic error reporting on hard crash **SKIPPED**

This was not completed. That said, we were able to fix most of the startup crashes that were reported.

### Begin work on multiplayer lobby system **SKIPPED**

Still don't feel like we are in a state where I want to start adding multiplayer. I'll know when it's ready. There's just too many other issues I want to fix first.

## osu-framework

![](https://puu.sh/AP8OC/ad3335747a.png)

While we haven't been adding much new functionality to the framework, bug-fixes are ongoing. We still have a lot of outstanding issues surrounding platform compatibility and single-frame drawable glitches due to incorrect invalidation scenarios.

### Move both osu and osu-framework to target netcore2.1 **WIP 80%**

We were successful in migrating all the development configurations to be netcore2.1 only. This means that all development going forward will be done under the netcore runtime. Windows releases are still targeting net471 for the time being to ensure we don't hastily break auto-updates. We also need to still ensure that all tests still perform correctly under netcore when run on our CI infrastructure. These remaining tasks should be completed over the month of July.

That said, we did run into a performance degradation during debug sessions on macOS that we are [currently tracking in hope of a fix](https://github.com/ppy/osu-framework/issues/1664).

### Add automatic nuget package builds of osu and osu-framework **LIVE**

We completely made the switch to nuget dependencies for the farmework. This turned out to be a really positive move forward, further isolating development of the two projects and allowing for better testing at each end. We are now pushing out regular builds to nuget.org

For the time being, we're holding off the osu-side nuget packages until there's a demand for them. If you're working on a custom ruleset aren are interested in seeing this happen then please let us know and we'll expedite it!


## osu-web

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

### Complete the new changelog page **LIVE**

The new changelog page is now live! It has already been a great help in visualisation the status of our various projects. I hope you guys are enjoying viewing and commenting on individual releases as we are making the regular releases!

### Move osu-web score lookups to elasticsearch **WIP 80%**

The back-end component for this was written and is deployed. The front-end changes are also ready to be deployed; we're just making a few final touches and quality checks before deploying this. It should be the start of a lot more flexibility in score lookups, though. Exiting stuff!

### New private messaging system **WIP ~50%**

The new PM system is coming along nicely. Due to the fact this is part of an experimental push for changing the architecture of our more interactive web-based components, it will be taking a bit longer than a month to get in place. This was expected; hopefully we'll see some results live this month, though!

# July 2018 Goals

## osu



## osu-framework



## osu-web



