---
layout: post
title: Surface Book Battery Life
date: '2016-01-25T11:32:52+09:00'
tags: []
tumblr_url: http://pppy.tumblr.com/post/137995137953/surface-book-battery-life
---
I recently switched from a MacBook Air 11" (2013) to the new Surface Book (base specs). My reasoning was to extend my battery life while on the move, as the air was only netting me around 6 hours on Windows. The air did of course fare better on OS X (7-8 hours) but I would find myself in Remote Desktop all day long as I generally use windows exclusively these days for development.



The hardware is quite nice overall. I have some issues with quality control, but I’ll save that for another more general post. I’m making this entry specifically to touch on battery life, as I have put in a fair amount of time and research in to getting my setup perfect and thought it would be a waste not to summarise and share it. There seems to be a bit of false information out there on how good/bad the Surface Book battery life is - especially due to early reviews using different hardware from the final specs. Time to try and help clear things up.



I get between 9 and 14 hours on battery, depending on what I’m doing. If I was to leave the PC idle (wifi connected, 50% brightness) I can get 18 hours. I use connected standby and the Surface Book consumes around 0.9-1% per hour sleeping. These numbers are well within my expectations. That said, in order to achieve such battery life, you do need to be aware of a few basic points:

Connected Standby Low Power States

Update: As of the release of the February 17th Firmware updates, Hyper-V is no longer required for Connected Standby!

As of January 2016, in order to make connected standby actually enter low power states, you have to install the optional Hyper-V components. The reasoning behind this is yet unknown, but it’s the difference between 2800mW/h and 680mW/h usage when sleeping. Note that having wifi on or off does not seem to affect drain rate significantly.

In order to check that your system is correctly entering Connected Standby low power states, you can use the powercfg command.

First make sure your battery is already at 96% or less - the SB hides battery drain from 100 to 97% from the system, which will cause completely inaccurate results if included.
Make your system sleep for at least 30 minutes (less than 10 won’t display at all, less than 30 will be inaccurate).
Open an administrative command prompt (Win+X then A) and type powercfg /sleepstudy.
Open the generated html page in your browser of choice and compare to the following example:


For those wondering what it looks like when CS isn’t working correctly, here’s an example.

Inhibit Turbo Boost while on battery

I recommend disabling turbo boost while on battery by setting the maximum processor state to 99% in your power profile. While this will reduce the performance of some burst tasks, it will also limit the degree that run-away processes using high CPU for their lifetime can affect battery life, which can be a huge gain.

In order to change the processor state, you will need to alter your registry as it is hidden by default. Here’s a reg file that will do it for you (open it in a text editor if you’d rather make the change manually).

Hit the windows key and type “power plan” then open the “Edit Power Plan” settings panel. Click “Change advanced power settings” and alter your maximum processor state while on battery to 99%.



As a note, it is possible that for some workflows this will not be beneficial. Turbo Boost is implemented to be quite efficient, so you may want to consider not adjusting these settings if you are getting already getting ample battery life without overriding the defaults.

CPU Babysitting

Windows 10 has some issues which can result in high CPU usage. Make sure you keep a watch on CPU usage to make sure you don’t get any background tasks saturating your CPU. Here are some examples I have experienced which can result in high background usage:

Search indexing. If you have a lot of small files that change regularly in your user folder (node.js projects, cygwin installs, large git repositories), consider exluding them from indexing.
System and Compressed Memory. If this is high, you likely have a driver or software conflict. I experienced this after a bit too much experimentation with SB drivers; a fresh install of windows has since fixed it.
Service Host: Remote Procedure Call. I’ve found that some windows store apps can trigger a high CPU state that you can only recover from by closing the problematic apps. Let’s hope Microsoft addresses this one.
If you’re worried about background processes, power saver can help alleviate the load, but it is limited to certain services such as Windows Update. No harm in leaving it permanently on, though.

I use Rainmeter to watch over my CPU, as it gives me a quick glance of the processes using the most CPU time.

Display Brightness

Keep display brightness at 50% or less. Anything higher increases battery usage quite exponentially. I’d recommend turning off adaptive brightness and just adjusting yourself as you see fit.

Raw Energy Consumption

On top of this, I highly recommend an app like BatteryBar Pro (the free ‘basic’ version is fine) to watch your actual energy consumption. You don’t need to constantly be watching, but at least spend a few sessions understanding which of your tasks are using more power than others.

Undervolting?

Advanced users may want to consider undervolting using Intel XTU, but I’m not going to go over that here as it requires special care with connected standby else your system will crash. I do run at -82mV and can attest that it reduces heat output significantly, but doesn’t really affect battery life in a meaningful way.

Conclusion

The Surface Book has a 68Wh battery, so if you want 10 hours you need to aim for 6800mW consumption or less. When doing menial tasks like web browsing, I usually hover around 4-5000mW; dev work is closer to 6-7000mW; burst CPU activity can hit as high as 20-30W.

While you can achieve high battery life with the SB, the out-of-box experience is absolutely horrible. Microsoft do still have some work to do:

Connected Standby should just work, even without Hyper-V enabled.
Connected Standby should be using far less power. The specs state devices must drain less than 5% per 16 hours, and they are yet to get anywhere close to that. Who knows if they can?
The Surface Book consumes power while completely off when connected to the keyboard dock. This is completely unacceptable. I’m not sure if it can be fixed with firmware updates, but let’s hope so.
Can I recommend this thing? I’m honestly not sure yet. I have a few other issues I haven’t mentioned here such as paint being scratched off the hinge, fan noise and speaker issues which I’m happy to live with but deserve consideration before making a purchase (these seem like quite common issues, looking around). I’ll write those up another time if I find time :).

