---
layout: post
title: no title
date: '2016-02-09T16:22:51+09:00'
tags: []
tumblr_url: http://pppy.tumblr.com/post/138979369105/for-those-wondering-how-osunext-is-coming
---

    

For those wondering how “osu!next” is coming along, here’s some of the progress we’ve been making. It may look like very basic stuff, but let me give you an idea of what is going on here:

We’ve been working to clean up the osu! codebase so it is easier to follow and contribute to. The existing framework means visual objects inside other objects (for things like scrollable views) have been limited in how they can be transformed. Movement has been easy, but anything beyond that requires quite convoluted code.

This video is an early preview of a drawable class inside another drawable class inside a third drawable class. Each can have transformations applied to them, which affect all of their children (movement, two-dimensional scale, rotation, colour and alpha).

Input is also masked correctly to only propagate downwards to the correct objects. You might notice that the boxes themselves aren’t masked to their parents yet; this is something we are still working on.

I coded up this example in a few minutes just to show what we’re up to behind the scenes. The whole class is under 100 lines for this demo, and about half of that will be unnecessary once we finish correcting the viewport implementation (so children can set their own coordinate system independent of the parent).

Yes, the “osu!next” design is still yet to take shape, but once we get the basics down things will be really really fast to actually implement. We’ve been holding off until the framework is ready to accept lots of new pieces entering it at a rapid pace.

This is the culmination of an effort over the last year, recently brought up-to-date by smoogipooo TVO and myself. It’s been a struggle to keep it merged alongside the constantly changing mainstream branch, but we are currently mending it with the aim of merging it into CE in the coming weeks. Stay tuned!
