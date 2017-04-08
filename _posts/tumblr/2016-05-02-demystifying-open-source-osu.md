---
layout: post
title: demystifying open source osu!
date: '2016-05-02T14:22:01+09:00'
tags: []
tumblr_url: http://pppy.tumblr.com/post/143727030323/demystifying-open-source-osu
---
There’s been a bit of talk about the future of osu!, specifically in relation to my plans to open source the client going forward. There have also been a few misconceptions so I thought it was time to take a moment to explain my intentions and reasoning behind this goal.



Transparency

I want to provide as close to 100% transparency as possible with everything we do. No real reason for this, just how it should be done, in my opinion.

While I think we’ve done pretty well over the years in not screwing users over, there are those occasions we can all recall where some disgruntled guy starts a protest against something we are doing in an internal process (the team) or in our code (osu! client) which people were not aware was a thing.

Contribution

We run osu! with a pretty small team. The only full-time developer on the game client itself still remains just me. Others regular contributors are students so they have limited time, and I myself have many other things to attend to than just the game client.

All in all the progress we are making is slower than I’d like. Open sourcing allows us to grow the “team” without the overheads that come with expanding a company. I have no interest in employing more people, but by rewarding contributors for only what they commit, this can remove those overheads while still reaping a fair amount of reward.

We’ve been trying this with the new osu-web project and while the number of contributors is still lower than I’d hope, it has helped speed up development. We’ve already paid out a total of US$2,120 to open source contributors at the time of writing this.

Code Quality

By making said processes and code open for criticism, at worst you are able to see how we are doing things and just be annoyed; at best you can see how we are doing things and then give constructive criticism (or offer your helping hands) to improve for the better.

Indestructability

If I was to disappear against my own will, I would like osu! to live on. Releasing the source increases the chances of this happening by not only providing a public awareness of how things work, but increasing the number of people familiar with the project. Optimally I’d like to have a clause in the licence which removes any restrictions in such a case (that the official servers are no longer usable).

Now, to address some concerns and common questions I’ve heard.



Will osu! be released under a free licence (such as GPL or BSD) or will you have your own terms?

At this point dual-licencing is looking like a good way forward. To be honest I would love to just release the code as public domain but am not yet decided on a final licence. This may by far be the hardest decision when making the final move open-source.

Won’t people just rip osu! off and make clones? Can I make a clone?

The way I see it, if we all do things right there shouldn’t be a need for clones. We will accept features and fixes into the main branch to cater to the largest majority of the community possible. While we haven’t yet finalised a licence choice, it will likely NOT be legal to re-release osu! as your own game, but you could potentially use portions of the code to make your own unique game.

Basically there’s nothing stopping people in certain countries from ripping osu! off, but I don’t see this as a threat. Unlike other companies trying to protect their revenue streams, I couldn’t give a fuck.

That said, my final opinion on the matter is that I personally do not condone making osu! clones or private servers as long as the official server implementation is up and running smoothly. If at any point I can no longer provide what the community wants for whatever reason (and no one is able to keep things running) I fully condone using the code however you want. As I mentioned above, hopefully this can be reflected in the licence we decide on.

In summary, yes making osu! open source is a “risk”, but people have already reverse-engineered the source and made clones. if you want my approval, you’re not going to get it, but I probably* won’t take legal action as long as you don’t use any of the osu! graphic resources or names (which are copyright and trademarked).

Can I contribute? Will you include my changes?

Yes you can contribute whatever you want! Keep in mind that your code will have to be up-to-standard to have your pull requests merged. Make sure before you attempt that you have an understanding of our coding styles and the git and github ecosystem.

We will do our best to pull in any changes that are for the best. If you want to know whether a specific feature will be approved by us, feel free to ask on public slack or open a github issue before you start working on it so we can discuss further.

Can we use small portions of the code for our own projects?

Yes! We have a pretty nice framework set up to create games. The licence will definitely allow use of our code in your own projects (just make sure to understand the licence chosen before doing so).

Can we “port” osu! to x platform?

You can help us get osu! running on a particular platform. As has been mentioned elsewhere in this post, you can’t just release osu! on a given platform (this falls in the “make your own game” clause) but you can invest efforts into making osu! run better on a particular platform. This is one of the core areas I’m hoping to get contributions from open sourcing (linux, OS X, mobile compatibility).

Once osu! works on a specific platform, we will consider releasing it in an alpha/beta form based on the merged changes.

Will there be a bounty system like osu-web?

Yes. I plan on rewarding any contributions.

Will you still hire people?

I have no real intentions on expanding the team, but if any regular contributors from the open source move show promise, I will definitely consider expanding the team, should they be willing!

If someone forks osu! and makes a new game mode that becomes popular, are you open to the idea of making it “official”?

Of course! Do keep in mind that making a new game mode requires more changes than just the client, so if you are looking to do this, be very patient and offer your help on server-side changes too. Also keep in mind that we probably won’t add game modes which are already technically covered by other modes (ie. we don’t need a DDR mode because osu!mania 4k with a skin already plays the same).

Will a part of the client code be censored? As in, connection to bancho and anti-cheat measures?

Yes, some code will be abstracted out of the open source implementation in order to continue to provide a fun and clean online gaming experience. It will be done in a way that will still allow debugging to be done with a client and server, but not the live server.

Will bancho be open source?

No, but bancho will not exist going forward as we are replacing it piece by piece with a better solution. The better solution is open source.

Will I be able to connect to the live osu! servers with a modified client?

No.

Do you personally condone of private servers?

No. If you have an issue with the official server let us know before taking matters in to your own hands.

Do you personally condone osu! clones?

Let me clarify that it depends on what you mean by a clone. If you’re going to use the osu! code and make a new game called “gosu!” then no. This will infringe our trademark and also be an ass move.

If you want to make a music game with similar gameplay rules to osu!, then by all means go ahead! I “borrowed” the rules for each game mode from already existing games and to be honest I don’t believe there should ever be copyright/patent placed on any kind of basic gameplay elements. Fuck that noise.

In short, if you want to make your own game, make your own game from scratch. I guarantee it will be a more satisfying experience for everybody!

When will it be ready?

We’re very actively working towards this. In fact, lazer will likely be open source (to some degree) at the time of its availability as a release stream.
