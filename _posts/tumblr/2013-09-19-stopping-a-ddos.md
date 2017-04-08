---
layout: post
title: Stopping a DDoS
date: '2013-09-19T10:18:00+09:00'
tags:
- osu!
- ddos
- prevention
- networking
- bancho
tumblr_url: http://pppy.tumblr.com/post/61639194302/stopping-a-ddos
---
Anyone who is a regular osu! player will be well aware of the troubles I have been experiencing over the last few months keeping the servers online. Daily DDoS attacks have meant constant interruptions across the board, but with the majority focused on Bancho – the server-side component of osu! responsible for multiplayer, chat, user presence and providing osu! with up-to-date player stats and ranking details. I thought it would be interesting (and hopefully beneficial to someone in the future) to write up my experience of combatting such an attack to the best of my ability.

First, let’s go into the knowns of the attack.

If you are not familiar with what a DDoS attack is, I highly suggest reading up on them before continuing to read this post. I am expecting a lot of questions asking why I can’t just “block the IPs” of the attacker or similar, and while I will try and answer that, you will probably get better answers reading wikipedia due to the sheer scope of what can be involved in such an attack.

The attacker

DDoS attacks are regularly used as a way of bringing attention to a specific issue, group, or single user’s demands. They force a service to become aware of whatever the attackers want, holding it at random to an extent. For this reason, it is often the case that the user or group committing the attack will publicly take responsibility for it, and provide proof that it is indeed them performing it, in order to gain recognition.

In this case, even while going out of my way to find out who was responsible for the attacks, it was very unclear until late into the picture. Via relayed IM logs, I was eventually able to get an idea of who was responsible, and what they wanted from us. As I expected, a user had been banned for cheating – in this case over a period of many years – and wanted all of their accounts unbanned. This is obviously a demand which I would never agree on.

The power source

A single user is usually not capable of launching an attack that would take down a service like osu! without another party managing the botnet and/or servers responsible for providing the bandwidth to launch the attack. In this case, the attacker was making use of multiple publicly available “stresser” or “booter” services, which provide a web interface in front of the infrastructure required to launch attacks. This allows an attack to be launched by simply entering a target IP address, port, attack type, length and hitting the “GO” button.



These services usually charge between $3-20 an hour depending on their reliability and strength. They sit under the legal veil of being “stress testers” which are made to be used on servers you own to test how they will stand against an attack. They usually contain no contact information and are very clearly geared towards users with different intentions.



It is safe to say from periods of analysis (where a small subset of the data is logged and parsed during an attack) that there were both large spanning botnets and a few high-powered servers involved. Whether these were compromised servers, or servers rented by the “stresser” services themselves, they were capable of reaching attack velocities up to – and in a few cases exceeding – 10Gbit/s. This is a sizeable force to deal with.



The target (osu!)

osu! is run from a number of diverse locations around the world, with database slaves and download mirrors distributed for performance and redundancy. The core servers are all rented at Softlayer’s SJC datacentre. After years of searching for a datacentre which manages to just do-it-right, I ended up with Softlayer, and I have been impressed with their reliability and support 95% of the time. The pricing is above what you would pay elsewhere, but they offer benefits such as private networking, portable IP addresses and free PPTP VPN access which others do not provide.

The osu! website has been sitting behind CloudFlare for over six months now. I was initially skeptic about using a service like CloudFlare, as it is adding an extra unknown between your service and the internet which you have very little control over – if something was to go wrong at their end, I have no power to fix it. While in the last six months this has happened occasionally, the overall result of switching CloudFlare on has been very, VERY positive. I would love to go into the specifics of this in another article.

CloudFlare can handle DDoS attacks. They can handle, mitigate and cut off the source at a level datacentres may not be able to do. They have a knowledge of how attacks happen and how they can be stopped with minimal consequence and downtime. During the period of attacks on osu!, the website did not flinch once. The attackers either knew they had no chance of messing with CloudFlare, or tried and failed to cause any harm. Unfortunately for us, Bancho is a completely TCP-based protocol, running over port 13381 with a custom protocol I engineered specifically for osu!. As CloudFlare only handle HTTP traffic, putting Bancho behind CloudFlare was simply not an option.

Bancho, sitting in Softlayer’s datacentre, is guaranteed a certain level of protection that is offered with all servers, in the form of a Cisco Guard firewall. While renting these devices permanently is outside of my limited budget, Softlayer are kind enough to dynamically reroute all traffic through one should they detect an incoming attack. Once this occurs, the firewall will intercept and filter traffic, delivering a clean stream of data to the end server for 24 hours, after which the conditions are re-assessed and the device is usually removed. Should attacks keep up, Softlayer also reserve the right to null route you server’s IP, deeming it useless for 24 hours (with no traffic ever reaching it). Cisco Guard and null routing is done on a per-IP basis, which allows a bit of flexibility should multiple IPs be assigned to a single server. This turned out to be very useful during the initial stages of the attack.

Other osu! services – such as download mirrors – were not heavily targeted by these attacks. Even if they were, it is minimum-impact and easy to re-route to another location. There are also several mirror run by other kind people which provide downloads should the official mirror go down.

Testing the waters

Long before the recent wave of attacks even started, there were occasional DDoS attacks detected against osu!. At the time, I assumed these to be random – sometimes people can be looking to test their botnet out, or hitting an IP which used to belong to another service. It is easy to see the these were no mistake, and in hindsight were the prologue to the main period of attack. The first of such attacks was on May 19th.

The force to deal with

Starting around July 5th, I began noticing an increase in the number of incoming attacks.  This is most easily seen on a graph of incoming traffic to the server running bancho:



Note that each of these spikes was usually a series of independent attacks on that day, and that while the maximum traffic shown on this graph is 1Gbit, they regularly exceeded this, but Cisco Guard kicks in at this point so it is not visible here.

Course of action

Most datacentres are not fit for dealing with DDoS attacks. 99% of them will resort to null routes as a solution to clients under attack. Softlayer offers firewalls which have DDoS protection, but due to the size of the attacks, even with such protection added the IP endpoints would likely be null-routed to protect the larger network, and reduce the effect on other clients sharing the same routing infrastructure.

There are services which offer DDoS mitigation, by placing a “proxy” between your server and the internet and eating the DDoS traffic. The price of these range from $50 to upwards of $10,000 a month. For the level of cover required by osu!, we are looking at the expensive end of the scale. For what it’s worth, I did try – and am still using for bancho’s IRC gateway – Staminus, which offers cheaper options that null-route on a very fine scale, making recovery fast after the attacks stop, for a relatively affordable price.

It was time for thinking outside the box. We need a solution which will not only stop these attacks, but prevent them from happening again in the future.

I have long wanted to add UDP support to bancho, allowing for faster round-trip times and lower overheads when establishing connections, but in this case UDP would not help. Instead, let’s consider adding HTTP support. Why HTTP? Because CloudFlare!

Firstly, if you are following closely you are thinking one of two things right now:

So you’re completely re-hauling osu! to use a REST approach?
What? But bancho is a streaming protocol! You’re crazy! You’re doing it wrong!
While I would love to try the first option – and who knows, maybe eventually this will happen – I was looking for a quick solution, which could be implemented in a few days maximum. Rewriting from scratch with a fresh protocol and architecture in this amount of time is just not feasible. So let’s move to the crazy option. Piping a streaming protocol over HTTP.

It may not be as crazy as it sounds. These days HTTP widely supports keep-alive, which means a single TCP connection can be used to transport multiple requests. This reduces the connection establishment time drastically. All that remains is the overhead that comes with HTTP headers, which can be reduced by not including any headers which would not be used by bancho. Including the bare minimum headers is still necessary, such as the HTTP protocol version and transfer type.

Even so, in order to establish the responsiveness of a streaming connection over a non-streaming protocol would require quite frequent sends – hopefully at least once a second. We can consider two cases here: one where the client requests something of the server and expects a response, and a second where the server has a waiting command/request of the client. The majority of osu! requests are initiated from the client-side, so we can optimise with the first case in mind.

Case 1: client has a request of the server

In this case, we can treat the request basically as a REST request. Assuming there is no existing request to the server, we can instantly send a new HTTP request, and wait for on the response. As we are encapsulating a stream here, we don’t want to send a request if there’s an outstanding request, as this could cause weirdness to all ends.

Case 2: server has a response waiting for the client

If the response is already being waited on by the client, there is likely already an open HTTP connection. If not, we resort to polling from the client. Depending on the current state of the client, polling will occur every 1-20 seconds. If the user hasn’t moved their mouse in a while, or the osu! window is inactive, the polling interval will scale back over time, resulting in less unnecessary traffic. When active, the perceivable latency added by polling is next to zero, as the previous poll is kept waiting on a response to the extent of the polling interval (within reasonable limitations). This means we always have one HTTP request open waiting on a response.

Before starting on this approach, I contacted CloudFlare stating what I wanted to do, and their thoughts on the matter. I was particularly concerned about the number of requests this would cause, and also whether they permitted this kind of usage of their service. Their response was to make sure that connections were not kept open for long periods, and to upgrade my plan to a higher tier (Business / Enterprise) to account for the load. I was already aware of their policies on long-standing connections, so planned for this from the start. Upgrading my account was the least of my concerns, and still cheaper than any other DDoS mitigation option of this scale. We are good to go!

Path to recovery

Launching was fairly painless and went without any hitches. I was thoroughly impressed with the deployment, and how smoothly everything went.



CloudFlare handled the new load like a boss, and the attacks stopped. After some quick iterations optimising the poll timings, bandwidth usage was lower than TCP connections used to be, which surprised me, but was strangely comforting at the same time.

The resolution of this issue was so sudden that there really isn’t much more to say. CloudFlare are a power to be reckoned with, and are doing a great part in protecting the internet1.

Final thoughts

It is now a month after deploying this solution. Things are still running smoothly, and we haven’t “seen” an attack since. Note that this doesn’t mean there haven’t been attacks. One downside of being behind CloudFlare is unless they report a fault on their twitter/status page, you are totally unaware of what is going on on the other side. There have been very short periods of reduced traffic, and debugging these cases is quite frustrating when you are unable to see exactly what is or is not being blocked from hitting your servers. Based on the infrequency of this happening, I choose to have some faith for now.

As I said previously, adding a service like CloudFlare in front of web servers is adding another unknown. It is therefore important to know that routing is reliable and support is there. CloudFlare have not disappointed on either of these, offering support turn-around times of <30 minutes in most every case, with a knowledgeable engineer rather than some outsourced level 1 tech guy (more than I can say for most datacentres out there). Their routing is amazing, nothing more to say there.

While I’ve tried to go through everything in great detail, there is a whole lot more to this story, my implementation of the new bancho protocol, and what I have learnt over the last couple of months. If you want to know more about any specific facet, please leave a comment!



Some of the services used to launch these DDoS attacks from are sitting behind CloudFlare, protecting themselves. I reported these to CloudFlare but it seems as though they will not act against a service unless they match very specific criteria. You’d think they would be against sites used to attack CloudFlare itself, but hey, who am I to decide that ^^; ↩


