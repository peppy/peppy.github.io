---
layout: post
title: visual studio with multiple projects
date: '2011-08-29T23:49:00+09:00'
tags:
- vs2010
- dev
tumblr_url: http://pppy.tumblr.com/post/9549285969/visual-studio-with-multiple-projects
---
When working with more than one project in a single solution, your working environment can get quite cluttered as you follow references between projects, sometimes with conflicting filenames (think generic things like Program.cs). This can lead to confusion as to where exactly the file you are working on is coming from.
I’d like to introduce anyone who is not yet aware of their existence to the Visual Studio Productivity Power Tools (released by Microsoft). These “Power Tools” are basically previews of new features and improvements which will likely be present in the next version of Visual Studio (vNext!), but Microsoft decided to release early to preview and get feedback.
I’d like to focus on one particular feature offered by this pack, which solves the project differentiation problem I mentioned above:

By enabling the Document Well 2010 option, you allow the PPTs to take over your document tabs and display them using a new (improved) format. The killer new feature here being per-project colour choices for tabs!

The defaults are a bit plain, but changing them only needs to be done once in order to get a really nice looking tab setup.

In this screenshot you can see I have files open from three different projects, grouped by project with clearly distinguishable colours. Also note that I have one tab which is pinned to the left – another useful feature of the PPTs – allowing it to always remain visible when many tabs are open.
The Document Well part of the PPTs has far more options to explore than the ones I have mentioned, including custom ordering, allowing multi-line display and scrolling and plenty more tick boxes for the control freak. I actually like the default behaviour of the VS2010 tabs for the most part, so only use the two particular features I have covered in this article.
Definitely worth checking out if you haven’t already, along with all the other goodies that come with the PPTs extensions.
