---
layout: post
title: decommissioning a wordpress blog
permalink: /post/9378235312/decommissioning-a-wordpress-blog
date: 2011-08-25 16:38:00 +0000
tumblr_url: http://pppy.tumblr.com/post/9378235312/decommissioning-a-wordpress-blog
categories: wordpress static blog server
---
<p>One of my long-term goals has been to cut down on the number of servers under my control that require frequent maintenance and attention. For over a decade I have hosted personal content (including my blog) on a PC in my house, which has served many purposes over the year including streaming media, storage, web hosting and just as a general shell box for IRC and other persistent connections.</p>&#13;
<p>While hosting things locally can be great in some ways (full control, minimal latency), there comes a point when you realise you just don't want to have the hassle of dealing with power and network failures that come with the household environment. Things also change over time, and most of the services provided by a local server -- to myself as well as my family -- are no longer being used; in fact the only remaining uses I have for it is hosting my personal sites and as a shell for IRC.</p>&#13;
<p>In moving my blog over to a hosted solution (tumblr, as you can see), I decided to use this as an opportunity to consolidate my hosting and make a step forward towards decommissioning my home server (falco).</p>&#13;
<p>The main two sites still being hosted on this server were my blog and splash page for ppy.sh. Today I will cover the wordpress side of things, and leave the other for next time.</p>&#13;
<!-- more -->&#13;
<p>My thoughts were to create an archived copy of my blog, keeping a fully navigable copy of the content without any security risks caused by maintaining a wordpress install or web server. A quick google search led me to a plugin called <a target="_blank" href="http://www.sorben.org/really-static/index.html">Really Static</a>, which allows for static caching of pages. It has a manual option to create a static content of every page in one swoop, which was exactly what I was after.</p>&#13;
<p>After adding a "deprecated" header to the top of every page, I went ahead and ran the plugin (which took a good two hours due to my crippled apache2 configuration).</p>&#13;
<p><img alt="&quot;Really Static&quot; Wordpress plugin" src="http://puu.sh/4LV9" width="633" height="384" /></p>&#13;
<p>Apart from a few manual corrections for stray images (which could have been avoided with some better configuration choices in the Really Static settings), everything seemed to work perfectly. The static copy ended up being around 68mb of HTML and images.</p>&#13;
<p>I had been meaning to give <a target="_blank" href="https://www.nearlyfreespeech.net/">NearlyFreeSpeech</a> a chance for web hosting once I found a project small enough to do so, and this was the perfect opportunity. They offer hosting with a unique payment system where you deposit money and only pay for the storage and bandwidth you use. Kind of like cloud hosting without the running costs. A few calculations showed that with my expected traffic and storage requirements the costs would be <strong>well under a dollar a month</strong>. Couldn't hope for any more than this!</p>&#13;
<p>So my old blog is already up and running on the new hosting in a completely static form. Go <a target="_blank" href="pe.ppy.sh">take a look</a> if you are that way inclined (but don't try to leave a comment on it; it won't work :p).</p>&#13;
<p><img src="http://puu.sh/4LX5" /></p> 