---
layout: post
title: Sprites and Containers in osu!
date: '2016-02-27T22:46:14+09:00'
tags: []
tumblr_url: http://pppy.tumblr.com/post/140087699883/sprites-and-containers-in-osu
---
I recently posted a video showing the progress we are making with a huge overhaul of how osu! draws objects on the screen. It probably didn’t mean much to most of you, so I thought I’d take a few minutes to explain what we are trying to achieve (and why it is so important).

Let’s dissect one single component on the osu! main menu!



Firstly, let’s split out all the different components and sprites. The visualiser is omitted for simplicity.



You can see the various components (thicker blue lines) and the sprites/components contained within them (thin blue lines). Next, we need to figure out where they are going to sit on the screen. In order to do this, we need an Origin point set on each drawable object, which becomes the location used within the sprite to assign a position.



The orange dots represent the origins assigned to each drawable object. Hopefully it should make sense why the specific origins are chosen in this example; they should make setting the object’s position as simple as possible. An origin can be set to any of TopLeft, TopRight, CentreLeft, Centre, CentreRight etc., and can also be overridden with a custom value for unique cases.

One piece of the puzzle is still missing, because in many cases we want to give objects a position from a specific corner of their parent. Think of the case of the FPS display, where we want it to be at the bottom-right corner of the screen. Rather than providing the screen’s width and height (which could change at any point!), it is much nicer if we can give it a position of (0,0) from the BottomRight corner. This is done using Anchors. Let’s look at the FPS display in a bit more detail!



The FpsCounter contains three sub-components:

Frame-rate display
Frame delay display
Dropped frames display
You can see in the diagram above how these are arranged in a (hopefully trivial) heirarchy. Now let’s figure out the positions, anchors and origins required to make this happen:



This is a very simple example as we don’t need to worry about assigning a different anchor and origin to a single object; they are always the same. This is actually quite a common scenario, but there are cases where this is not true. I’ll leave it up to your imagination where this would come up, but as a hint, consider that all scale/rotation animations applied are also based on the Origin.

You can click on any of the diagrams above to get a larger view. Please let me know if the explanations provided here are simple enough to follow, and if not, let me know where you got lost so I can improve on further posts.

As we are aiming to open source the client in the near future (this year), I plan on doing more posts like this to help people understand what kind of framework they will be exposed to. Oh, and if you want to know how we did things until this rewrite, think of the above example without the concept of more than one level of heirarchy
