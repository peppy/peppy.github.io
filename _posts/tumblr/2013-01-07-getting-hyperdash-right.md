---
layout: post
title: Getting Hyperdash Right
date: '2013-01-07T16:21:00+09:00'
tags:
- dev
- osu!
tumblr_url: http://pppy.tumblr.com/post/39917651337/getting-hyperdash-right
---
Over the last week, I have been working on fixing long-standing issues with the “Hyperdash” algorithm in Catch the Beat mode. Hyperdash is a gameplay tweak that was added to CtB in order to ensure that all patterns are catchable – no matter how far apart they are. It does this by makring certain fruit (objects) which would previously be impossible to catch as “Hyper” fruit. On catching these fruit, your catcher speeds up to the precise speed required to reach the next fruit in time.



This has always worked in roughly 99% of cases. Today I will detail the two main issues which caused the flaws in the remaining cases. For brevity, I have left out some other more obvious cases which were fixed earlier on last month.

Same Direction Chain

The catcher needs to catch three (or more) fruit in a line, where all but the last are hyperfruit. In the initial algorithm, the current X position of the catcher was always considered to be centered on the destination fruit by the time required, but because hyperdash would disengage earlier than this, catching all fruit were not possible.



The first fruit is caught as expected.



The second fruit is caught, but the catcher is dashing in overtime to get there. The green silhouette is where the algorithm expected the catcher to be.



Because the algorithm expected the catcher to be further than it actually was, the third fruit is not catchable. Hyperdash was required earlier on in this pattern.

Fixing this issues involves keeping track of:

The current direction of the catcher
The excess time after reaching the destination.
If the catcher has been moving in the same direction over more than two fruit, the excess required movement (if any) is added to the required distance, allowing hyperfruit spawning where required.

Hyperdash disengage times were also made more precise to ensure reaching the perfect position to catch the fruit.

Sub-frame Movement

The most edge case meant that some fruit may be possible or impossible to catch only by luck and frame limiter settings. Internal calculations where done on a sub-frame level, meaning:

possible_movement_distance = (object2.startTime - object1.endTime) * velocity;
require_movement_distance = abs(object2.x - object1.x);

if (possible_movement_distance < required_movement_distance)
    hyperdash(object1);


The problem here is that the possible_movement_distance was calculated based on the number of milliseconds separating the two objects. As osu! internally runs at 60fps in the worst-case scenario, possible_movement_distance may have been less or more than the actually available movement, due to where calculation frames end up falling (which is completely uncontrollable and random).

Correcting this is a matter of rounding available time downwards to the nearest frame + 0.5, which ensures that in worse-case scenario the time calculation will be 0.5 frames more lenient than required (ie. the objects will still be catchable):

frame_time = 1000/60; //60fps (16.66667ms)
actual_frames_available = floor((object2.startTime - object1.endTime) / frame_time) + 0.5;
possible_movement_distance =  actual_frames_avilable * frame_time * velocity;




When the game’s frame limiter was set to 60fps, frames were guaranteed to be a full 16.6ms, rounding calculations upwards and allowing slightly more movement. They would therefore match the old algorithm and be catchable without hyperdash.



When the game’s frame limiter was set to 120fps or unlimited, frames could be any length, causing higher precision in calculations, and introducing the possibility of sub-frame errors as seen above. While the fruit should technically still be catchable, rounding errors meant that they were not catchable around 50% of the time.
