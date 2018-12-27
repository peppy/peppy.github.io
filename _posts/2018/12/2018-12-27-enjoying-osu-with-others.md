---
title: Enjoying osu! with others
---

As 2018 draws to a close, I want to touch on something which I’ve felt strongly about for a while now. While I’ve described my thoughts and intentions in private to people I’ve met up with, this will be the first time discussing this publicly.

The reasoning behind not covering this topic until now is that I don’t like to dream about a future and all the cool things it could be, making big promises without being able to deliver soon enough for people in the present to enjoy.

osu! is a heavily community focused online game. Some players lean towards the competitive side while others play more casually, but I think everyone finds motivation from being around others striving hard to perform their best.

On any given day there are up to 800 concurrent multiplayer games, creating localised competition and enjoyment for their participants. Even so, I think we can all agree that the ecosystem created around Performance Points (or PP) and the global rankings are the focus for most.

Through all the complaints and criticisms of the system and its method of calculation, people of all skill levels are still striving for the highest pp they can achieve (quite often focusing on beatmaps which specifically reward more pp for less effort, known as “farm” maps).

This is one area which is quite unique in osu! – we don’t have the concept of seasons where leaderboards are reset. Scores remain for years and history is retained forever. It really lets users feel like they have achieved something solid, in my opinion – set a record and it’s there in stone (unless you beat it yourself!). But it also does lead to unavoidable stagnation.

I’m not about to go into the topic of PP calculation. The performance point (v2) system was made with the aim of objectively calculating difficulty and it did a pretty good job of that. Over the last month we have seen a huge increase in activity over at the dev discord aiming to improve the calculations while maintaining this overall goal. Things are in good hands and you will likely see changes applied over the next month.

The leaderboards and pp will always have their place in this community, but I don’t think it is healthy to focus exclusively on them. Let me introduce my plans for expanding osu! horizons via multiplayer.

From today, a new multiplayer system is live in lazer. I have been working on the logistics of this for several months on paper, and the team has spent the month of December focusing on this internally in relative secrecy.

As lazer is a very open development project, we don’t want to develop the whole system behind a curtain. Therefore we have developed a MVP (minimum viable product) that you can enjoy from today, but will continue to build on it going forward.

# Introducing “Timeshift” multiplayer

*“Timeshift”* brings multiplayer rooms that can run over a longer period of time and involve large numbers of players. The room owner will be able to set the specifications for the room, along with a duration. During this specified time range, players will be able to join the room and compete in a localised leaderboard instance.

Think of it as synchronous multiplayer.

![](https://puu.sh/CnJOf/36eb861a4e.png)

Each room gains an overall leaderboard and a chat room which persist even after the room has expired. History of rooms will be kept indefinitely, and chat will be available for discussion after the results are finalised. I’m sure many of you are already imagining the possibilities of how this can be used. Let me touch on the concepts (and my personal goals) behind this system and how things will be developed going forward.

![total attempts](https://puu.sh/CnJTB/584dfa8144.png)

## Creating more ways for people to enjoy osu!

This will allow for leaderboards to be made by *users*. We plan on adding the tools to limit the scope of who can participate (private, friends only, limiting by rank, by country etc.)

<video src="https://puu.sh/CnJGJ/95e08286f1.mp4" controls preload="metadata" loop autoplay></video>

## Making tournaments easier to run

This should allow for a new generation of tournaments (well, competitions) which don’t need to be run in real-time. It can also provide a way for seeding players into groups before the main portion of a tournament starts, for instance. We will continue to flesh the system out with tournaments being one of the focuses, so if it's missing features you may need, expect them to come in the future.

## Giving players new areas to focus on competitively

As a player participates in multiplayer rooms, they will be visible in their “Participated” listing and (soon) show on their profile. It should hopefully add an extra dimension in where players place focus on when playing online.

![room ranking](https://puu.sh/CnJAk/e7644ccb03.png)

##  Increasing the creativity of gameplay

Rooms can be created with a variety of conditions. Currently quite limited, you can choose:

* The beatmap to play
* Which mods to play with
* The duration the room is active for

Going forward, here are a few of the coming options (the system has been designed with these in mind from ground-up):

* A playlist of beatmaps to play
* A progression mode (marathon, or beatmap-by-beatmap)
* A selection of required mods, plus a selection of allowed (options) mods. Like FreeMod but more choice. Mods apply per beatmap in the playlist.
* A maximum number of attempts per player
* A maximum number of players participating
* A choice of leaderboard metric (currently locked to total score, but will include accuracy, pp and max combo)
* A start time, for scheduled matches in the future.

We have more ideas, but these are the base ones we will be working on in the coming weeks and months. Also, important to note that lazer already has four or five unique mods not found in stable, and this number is only set to increase! User contributed mods are being openly accepted and each new mod increases the number of creative possibilities when it comes to designing a fun multiplayer room!

![](https://puu.sh/CnJW9/19ce2cb536.png)

And that’s as far as I’m willing to go when it comes to explaining the progression of this system. From here on it will depend on how the community uses the new rooms and the feedback we get as to how we mould this into a permanent and (hopefully) well enjoyed aspect of the osu! ecosystem.

![Blinds mod, a new lazer-only hardcore mod selection](https://puu.sh/CnJfL/37b3a22f3e.png)

## Let me preempt some questions

### When is it available?

Now. [Go get lazer](https://github.com/ppy/osu/releases/) if you haven’t already and install it alongside your stable install! It’s more stable than you may think.

Global leaderboard submission is of course not in lazer yet, so enjoy a different and possibly more chill experience than you’re used to.

### What about pp ranking in lazer?

For the time being this is not a focus. We have everything in place to make that eventually happen, but for now I want to make a new unique experience in lazer that differs from what one can play on stable.

### So I guess that means I can’t join “timeshift” rooms from stable?

No, this is and will always be lazer exclusive.

### What about real-time multiplayer? This feels like the wrong direction!

I can understand this concern, but I have already planned a logical progression from this system into a fully real-time system. All the features that will be made for timeshift will be 100% available in real-time rooms once we get to that point. Thing of this implementation as a prerequisite to adding real-time play modes in the extensible way we want to do it.

 Of course, realtime/non-realtime will be a user choice when creating a room in the future!

### What about coop play?

Once we flesh out the timeshift system and get to the point we can add cooperative modes, it *will* happen. Mark my words.

### Will room history be maintained from the outset?

We’ll do our best to maintain all history, but as this is a new system do understand if we need to delete data for one reason or another. Possibly multiple times.

### I don’t play multiplayer / I don’t like this concept.

That’s perfectly fine! In fact, if you enjoy solo play for leaderboards you **may** actually like this concept more than the multiplayer available on stable.

If you don’t, nothing is forcing you to play it. Global leaderboards are not going anywhere.

## This is our final surprise for 2018

I hope we can all agree it’s been an amazing year and we’ve ended it with some amazing notes!

Between Featured Artist releases, this announcement, completely operational iOS lazer builds (alongside windows/macOS/linux), web design renewals and some long-awaited features being added to stable, we’ve made some phenomenal progress.

A huge pat on the back to the whole osu! team (devs, community managers, BNs, QATs, moderators and anyone I missed).

I was planning on doing a blog catching up on Q4 2018, but due to time constraints it will likely happen sometime in January. Hopefully this makes up for it :).

Wishing you all a great new year period. **We’ll be in touch soon**.


