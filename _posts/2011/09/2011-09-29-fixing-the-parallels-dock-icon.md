---
layout: post
title: Fixing the Parallels Dock Icon
permalink: /post/10801848404/fixing-the-parallels-dock-icon
date: 2011-09-29 09:31:00 +0000
tumblr_url: http://pppy.tumblr.com/post/10801848404/fixing-the-parallels-dock-icon
categories: parallels dock icon ugly
---
<p>So I have been using parallels for a while now, and it is turning out to be a very good experience. I would like to write a longer post on the ups and downs of the application itself, but this post is a solution to a long-standing gripe I've had with the product line -- the dock icon.</p>&#13;
<blockquote>&#13;
<p><img height="97" src="http://puu.sh/6gtV" width="102" /></p>&#13;
<p>"Paused? No, that's our logo. You can't remove it, either."</p>&#13;
</blockquote>&#13;
<p>I'm sure you can agree that not only are the Parallels bars ugly, but they also communicate a state which is actually incorrect. The resemblance of a pause symbol is undeniable. Having this icon in my dock is an eyesore and a distraction due to the fire-truck red colour.</p>&#13;
<p>Fixing it is unfortunately not so straight-forward, and while <a href="http://forum.parallels.com/showthread.php?t=31396">many people have attempted to cry for help</a>, those behind parallels have refused to listen. For three years.</p>&#13;
<p>I offer a slightly hacky solution that should work for all versions 4.0+ and into the forseeable future. If you use this solution and your PC blows up, I am totally not responsible.</p>&#13;
<p>Open Terminal (Applications &gt; Utilities &gt; Terminal.app).</p>&#13;
<p>Type the following command (as a single line):</p>&#13;
<blockquote>&#13;
<p>LANG=C sudo sed -i.bak s/Parallels_Desktop_Overlay_128/Parallels_Desktop_Overlay_000/g /Applications/Parallels\ Desktop.app/Contents/MacOS/prl_client_app</p>&#13;
</blockquote>&#13;
<p>Enter your root/administrator password and wait for the command to complete running.</p>&#13;
<p><img src="http://puu.sh/6gum" /></p>&#13;
<p>Congratulations; your Parallels icon should be a touch less ugly now. The above command creates a backup of the file that was changed, so if you would ever like to undo the changes, simply run (as a single line):</p>&#13;
<blockquote>&#13;
<p>sudo mv /Applications/Parallels\ Desktop.app/Contents/MacOS/prl_client_app.bak /Applications/Parallels\ Desktop.app/Contents/MacOS/prl_client_app</p>&#13;
</blockquote>&#13;
<p>I am still looking into whether a completely custom icon can be used (so parallels doesn't switch to the windows-desktop-monitor icon), but haven't been able to find the source of that one yet.</p> 