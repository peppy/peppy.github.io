---
layout: post
title: a long-overdue update
date: '2016-06-30T11:53:33+09:00'
tags: []
tumblr_url: http://pppy.tumblr.com/post/146687255823/a-long-overdue-update
---
It’s been a while since I’ve posted, but trust me that it is for the best! The progress we’ve been making recently has been amazing, and I am very excited for the future! Let me bring you all up-to-date with what has been going on behind the scenes.

osu!lazer

The lazer build has been my number one focus over the last few weeks, diverting my attention from everyday operations to actually writing code. I’ve been changing upwards of 2,000 lines of code a day (consider that the whole osu! project is only 72,000 LoC) in order to bring osu! into a state which prepares it for the future.



We’ve made some huge advances in technology and infrastructure of the client which are absolutely necessary as a solid base for the features we plan to implement going forward. Just to give you an idea of the things I’ve been working on:

Until now we used some XNA code for input handling and low-level structs. These dependencies are almost compeletely removed from the project now, with OpenTK or similar open-source frameworks replacing them. All that’s left is Vector2, Vector3 and Matrix. These last few are a bit more complicated to remove than the rest, but should be gone soon.



The audio subsystem is now in a better state than ever before. What was previously a mess of co-dependent classes and statics is not a lean Clock hierarchy. Each clock performs a specific task, allowing for very logical control of things like interpolation, frame-based time separation, offsets, rate adjustments and virtual time (intro/outro time).






The input subsystem has been rewritten multiple times in order to create the easiest and most understandable framework for how we plan on handling user input. Hard to show this visually, but definitely a step in the right direction.
What was previously a mess of independent static classes is now a since static OsuGame which acts as the root for things that need regular game-wide access, like Config, Audio and Skin subsystems.
The text input system received a huge overhaul, allowing for proper text selection, keyboard shortcuts like ctrl-a, shift-home, ctrl-shift-rightarrow and mouse shortcuts like double-click or drag selection.






The new draw and transformation hierarchy is capable of doing some pretty cool stuff! Below is a quick demo idea stolen from anime.js stress test that I replicated in about 5 minutes.


osu! can now be resized to virtually any windowed resolution without completely falling apart. Going forward this will probably no longer require a mode reload, which you can see in the current example.


Online support has been added back using the new osu-web client API. This will replace bancho going forward. So far, only basic login and chat (read-only) is available, but you can see already that chat can fetch previous history when connecting, unlike bancho.


The startup sequence has been modified to get an OpenGl context as soon as possible (for me, this is about 300ms for the osu! window to first display). The splash screen is therefore no longer necessary and will be replaced by the game intro sequence, during which other components will be initialised. I really hated the splash screen anyway, so good riddance!


We are targeting .NET 4.5 and are already deploying live with dual-targeting binaries (32 and 64-bit). Check it out, but don’t expect too much. A lot is broken and we are aware of this. note that this installer will install alongside your existing osu! install, and should NOT be used to replace your existing one.
I was hoping to open-source the project last week, but in the process of doing so I came across a lot of very old code which should not be seen by anyone. I’m therefore delaying the open-sourcing until I can first tidy things up a bit more. That said, read on for an opportunity to help out before we go open-source if that’s something you think you are capable of!

As you may have realised, the lazer project has increased in scope since I set out. What was originally supposed to be a 2-3 month project which would be released to cutting-edge (and subsequently as a stable release) is now turning in to closer to a full rewrite of the game. This is not a bad thing in my eyes, but it will affect the update schedule of osu!. You won’t be seeing any large updates to the stable branch (bug fixes being the exception) because it would mean implementing things twice - which we definitely want to avoid!

That said, osu!next (the design concept) is no longer a dream but a reality that is starting to piece together!







osu!dev discord

In my continuing effort to make osu! as close to 100% transparency as possible, we’ve moved all development efforts out of the private/public slack networks and into a new public discord network. I hope this will eventually lead to more collaboration from outside the team, but for the time being it lets anyone who wishes to oversee our development efforts in real-time.

If you are interested in helping out with the lazer project, make sure to let us know. We are accepting private contributors to the project on request, so come in to #osu-lazer and let us know your qualifications and github username if interested.

If you haven’t yet joined us and this kind of thing interest you, please use this invite! Make sure you hang around until you have been verified or you will automatically leave the network.
