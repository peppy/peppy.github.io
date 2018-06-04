---
title: June 2018 Development Update
date: 2018-05-04
---

Hello everyone!

We've been making steady progress in all areas over the last month. Yes, I guess these posts have become a monthly thing, but I am going to take this opportunity to embrace the monthly schedule and align it to development schedule.

Since earlier this year, we have been assigning tasks to a monthly "milestone" and then trying out best to complete them all by the time the month ends. After a bit of trial and error, we are gradually accustoming ourselves to this process and meeting higher rates of completion month on month.

We also have the new [changelog system](https://osu.ppy.sh/home/changelog) that is approaching completion, which will replace much of the content (ie. per-change explanations) I usually cover in my blog once complete, so I will be shifting my focus here to focusing on a more macro scale of "how we did last month" and "what we have planned for this month".

I'd just like to mention that much of the process we're following is heavily borrowing from the [vscode project](https://github.com/microsoft/vscode), so huge props to them for their amazing open development efforts and solid [development process](https://github.com/Microsoft/vscode/wiki/Development-Process). They obviously have a much larger team and dedicated project management so we are taking some shortcuts, but I'm pushing for more process as it feels feasible and productive.

# June 2018 Goals

In an interest of establishing a schedule we can adhere to, I'm going to keep the goals slim this month. Not mentioned in this list is the huge backlog of issues that require fixing, which can be found assigned to the [respective](https://github.com/ppy/osu/milestone/36) [monthly](https://github.com/ppy/osu-framework/milestone/13) [milestones](https://github.com/ppy/osu-web/milestone/13).

### Move both osu and osu-framework to target netcore2.1

I hope we can fix remaining netcore issues (mouse hiding and other native functionality) in order to make .NET core our primary target framework by the end of this month. The 2.1 release fixes the remaining issues we had with debugging the solution on macOS and brings performance on a level that surpasses both mono and .NET desktop (471).

### Add automatic error reporting on hard crash

Many people are reporting hard crash issues on github without knowledge of how to report correctly or fix. I hope to make this reporting automated (via Sentry) and remove this manual overhead.

### Add automatic nuget package builds of osu and osu-framework

As the number of projects dependent on these increases, referencing them via submodule is getting quite cumbersome. By deploying nuget packages we can more easily keep individual projects segregated and maintainable.

### Begin work on multiplayer lobby system

With more of the UI designs nearing completion, it feels about time that we get the infrastructure in place for osu!lazer multiplayer. This is a stretch goal and will likely not reach the point of gameplay being possible, but the lobby and room system should at least have some client-server structure in place.

### Basic structural implementation of osu!mania editor

As we move the editor forward, we want to allow for arbitrary rulesets to be easily added with first-class editing facilities. In order to make sure everything is structured correctly, we will be focusing on getting the osu!mania setup in a usable yet modular way.

### Complete the new changelog page

As mentioned in my previous post, this will be the new hub for keeping track of the ongoing development efforts invested in osu!. Having the new design completely deployed will reduce the strain on me to manually produce changelogs in a blog format and hopefully make tracking development more accessible for the wider audience.

### Move `osu-web` score lookups to elasticsearch

I have been performing ongoing migration of MySQL servers to new hardware and software (5.6/5.7 to 8.0). In order to complete the last stages, I would first like to reduce load (and reliance) on the servers. Moving score lookups to elasticsearch will do this, but also allow for arbitrary lookups which have not been possible until now due to lack of indices.

### New private messaging system

We've been working on the framework required to get a private messaging system deployed to replace the ageing (and disconnected) forum-based system that is only accessible on the old site. While a bit of a stretch goal, we hope to have this deployed by the end of the month.

# New Projects

As we push forward with open sourcing each component of the osu! ecosystem, a few new git repositories have popped up which you may wish to follow:

### [osu-tools](https://github.com/ppy/osu-tools)

This will contain any command line tools (.NET core) which consume lazer. Currently you will find a difficulty calculator tool which will be the go-to method of testing new Star Rating changes.

### [osu-server](https://github.com/ppy/osu-tools)

This will contain server-side components that don't fit in the current laravel system. This repository is still undergoing some structural consideration as we decide how many git repos we want, but for now will house the [.NET core version](https://github.com/ppy/osu-server/pull/2) of [osu-performance](https://github.com/ppy/osu-performance) (Performance Point calculations) and a new [Elasticsearch score indexer](https://github.com/ppy/osu-server/pull/1) – part of an ongoing effort to alleviate MySQL of the heavy load of score/leaderboard lookups.

# May 2018 Review

## Milestone completion

### osu

![](https://puu.sh/AyG14/3f429ef860.png)

### osu-framework

![](https://puu.sh/AyG1N/187266c4cc.png)

### osu-web

![](https://puu.sh/AyG1X/11a9fd9c49.png)

Pretty good progress and relatively high completion rates, no? Let's delve into detail in each respective project. This might be the last time I do this if the new changelog page goes as planned (I won't miss it!).

## [osu](https://github.com/ppy/osu) *The osu!lazer project. The future of the osu! client. Download preview releases from [here](https://github.com/ppy/osu/releases) and follow along!*

### Fix catch sizing [\#2632](https://github.com/ppy/osu/pull/2632) ([peppy](https://github.com/peppy))

After many months of Yuzu being completely oversized (big-boned; not fat), osu!catch gameplay scale has been refactored to mostly match stable.

![](https://puu.sh/AyIvl/a2b20901f0.png)

### Fix beatmap importing entering a bad state [\#2665](https://github.com/ppy/osu/pull/2665) ([peppy](https://github.com/peppy))

- Also: fix conflicting Hash and Online IDs on beatmap import [\#2673](https://github.com/ppy/osu/pull/2673) ([peppy](https://github.com/peppy))

A lot of users were reporting that beatmap imports were getting stuck. It turns out that a single failed import would hold up the import process indefinitely and cause all subsequent imports to fail. There were quite a few reasons for this happening, but most should now be resolved.

Do note that we are still tracking [one remaining case](https://github.com/ppy/osu/issues/2718) where imports can fail.

### Add hold-to-quit button for gameplay/replays [\#2430](https://github.com/ppy/osu/pull/2430) ([UselessToucan](https://github.com/UselessToucan))

No-keyboard players rejoice! You can now pause or exit gameplay without a keyboard handy. This is a definite requirement for mobile support.

![](https://puu.sh/AyIU0/56fb4e3d3c.gif)

### Implement joystick input [\#2346](https://github.com/ppy/osu/pull/2346) ([smoogipoo](https://github.com/smoogipoo))

You can now bind joystick buttons, hats and axes to anything that was bindable in-game! This allows for a huge amount of new control customisation which was never before available - even on stable!

### Multiplayer lounge [\#2603](https://github.com/ppy/osu/pull/2603) ([DrabWeb](https://github.com/DrabWeb))

While not yet functional, the designs for multiplayer are now more complete than ever. Don't you just want to see this list populated with real games?

![](https://puu.sh/AyJY9/9f91f7cfb2.png)

### All Changes
- Change Room.Participants to an IEnumerable [\#2703](https://github.com/ppy/osu/pull/2703) ([DrabWeb](https://github.com/DrabWeb))
- Match beatmap overlay author styling with web [\#2700](https://github.com/ppy/osu/pull/2700) ([Joehuu](https://github.com/Joehuu))
- Add storyboard icon and fix preview button overlap on direct panels [\#2695](https://github.com/ppy/osu/pull/2695) ([Joehuu](https://github.com/Joehuu))
- Fix importing long filenames from stable [\#2678](https://github.com/ppy/osu/pull/2678) ([peppy](https://github.com/peppy))
- Multiplayer shared logic encapsulation [\#2669](https://github.com/ppy/osu/pull/2669) ([DrabWeb](https://github.com/DrabWeb))
- Centralise beatmap set cover update logic [\#2667](https://github.com/ppy/osu/pull/2667) ([DrabWeb](https://github.com/DrabWeb))
- Fix logo animation discrepancies [\#2682](https://github.com/ppy/osu/pull/2682) ([peppy](https://github.com/peppy))
- Offload database query to task [\#2680](https://github.com/ppy/osu/pull/2680) ([peppy](https://github.com/peppy))
- Fix player life management [\#2679](https://github.com/ppy/osu/pull/2679) ([peppy](https://github.com/peppy))
- Fix Debug mode instead of Release mode for mono debug target [\#2677](https://github.com/ppy/osu/pull/2677) ([Tom94](https://github.com/Tom94))
- Add Type property to MultiplayerScreen [\#2672](https://github.com/ppy/osu/pull/2672) ([DrabWeb](https://github.com/DrabWeb))
- Add build tasks for visual tests and fix broken launch tasks [\#2671](https://github.com/ppy/osu/pull/2671) ([Tom94](https://github.com/Tom94))
- Fix results screen parallax being cut off [\#2663](https://github.com/ppy/osu/pull/2663) ([smoogipoo](https://github.com/smoogipoo))
- Fix mania hold notes displaying judgements [\#2660](https://github.com/ppy/osu/pull/2660) ([smoogipoo](https://github.com/smoogipoo))
- Ensure autoplay tests actually increase score above zero [\#2644](https://github.com/ppy/osu/pull/2644) ([peppy](https://github.com/peppy))
- Split score multiplier and unranked label colours [\#2314](https://github.com/ppy/osu/pull/2314) ([Joehuu](https://github.com/Joehuu))
- Rename CursorOverrideContainer to MenuCursorContainer [\#2637](https://github.com/ppy/osu/pull/2637) ([HoutarouOreki](https://github.com/HoutarouOreki))
- Bring pp calculations more in-line with osu!stable [\#2636](https://github.com/ppy/osu/pull/2636) ([smoogipoo](https://github.com/smoogipoo))
- Fix quit button test occasionally failing [\#2633](https://github.com/ppy/osu/pull/2633) ([peppy](https://github.com/peppy))
- Fix incorrect default values keeping overlays in wrong state [\#2624](https://github.com/ppy/osu/pull/2624) ([Aergwyn](https://github.com/Aergwyn))
- Fix selecting song in playlist not starting the audio [\#2622](https://github.com/ppy/osu/pull/2622) ([smoogipoo](https://github.com/smoogipoo))
- Fix possible MusicController nullref [\#2618](https://github.com/ppy/osu/pull/2618) ([smoogipoo](https://github.com/smoogipoo))
- Fix disclaimer allowing notifications [\#2613](https://github.com/ppy/osu/pull/2613) ([Aergwyn](https://github.com/Aergwyn))
- Add icon next to beatmap title/username to open in browser [\#2612](https://github.com/ppy/osu/pull/2612) ([jorolf](https://github.com/jorolf))
- Fixed banana generation on catch specific maps [\#2611](https://github.com/ppy/osu/pull/2611) ([frankhjwx](https://github.com/frankhjwx))
- Fix double-HR application in OsuDifficultyCalculator [\#2587](https://github.com/ppy/osu/pull/2587) ([smoogipoo](https://github.com/smoogipoo))
- Add input toggles to the PlayerLoader screen [\#2504](https://github.com/ppy/osu/pull/2504) ([UselessToucan](https://github.com/UselessToucan))
- Prevent user from scrolling outside the timeline in the editor [\#2499](https://github.com/ppy/osu/pull/2499) ([AlFasGD](https://github.com/AlFasGD))
- Fix overlays from not hiding when returning to initial main menu state [\#2601](https://github.com/ppy/osu/pull/2601) ([Aergwyn](https://github.com/Aergwyn))
- Fix escape not working to go backwards in menus before finally exiting the game [\#2600](https://github.com/ppy/osu/pull/2600) ([peppy](https://github.com/peppy))
- Allow drag clicking footer and filter on song select [\#2594](https://github.com/ppy/osu/pull/2594) ([Joehuu](https://github.com/Joehuu))
- RoomInspector improvements [\#2588](https://github.com/ppy/osu/pull/2588) ([DrabWeb](https://github.com/DrabWeb))
- Prevent overlays from showing in intro/outro sequences [\#2577](https://github.com/ppy/osu/pull/2577) ([Aergwyn](https://github.com/Aergwyn))
- Add global key bindings for changing current ruleset [\#2532](https://github.com/ppy/osu/pull/2532) ([ocboogie](https://github.com/ocboogie))
- DrawableRoom improvements [\#2522](https://github.com/ppy/osu/pull/2522) ([DrabWeb](https://github.com/DrabWeb))
- Fix HR mod affecting original beatmap difficulty [\#2582](https://github.com/ppy/osu/pull/2582) ([smoogipoo](https://github.com/smoogipoo))
- Implement taiko performance calculation [\#2572](https://github.com/ppy/osu/pull/2572) ([smoogipoo](https://github.com/smoogipoo))
- Fix taiko slider multiplier being applied twice [\#2568](https://github.com/ppy/osu/pull/2568) ([smoogipoo](https://github.com/smoogipoo))
- Fix converted beatmap hitwindows not working correctly [\#2567](https://github.com/ppy/osu/pull/2567) ([smoogipoo](https://github.com/smoogipoo))
- Multiplayer base screen [\#2560](https://github.com/ppy/osu/pull/2560) ([DrabWeb](https://github.com/DrabWeb))
- Implement osu!mania performance calculator [\#2557](https://github.com/ppy/osu/pull/2557) ([smoogipoo](https://github.com/smoogipoo))
- Add ability to bind "back" action; add default mouse binding [\#2472](https://github.com/ppy/osu/pull/2472) ([UselessToucan](https://github.com/UselessToucan))
- Fix incorrect namespace of OsuPerformanceCalculator [\#2570](https://github.com/ppy/osu/pull/2570) ([smoogipoo](https://github.com/smoogipoo))
- Speed up beatmap parsing and conversion [\#2566](https://github.com/ppy/osu/pull/2566) ([smoogipoo](https://github.com/smoogipoo))
- Fix hold notes never expiring [\#2564](https://github.com/ppy/osu/pull/2564) ([smoogipoo](https://github.com/smoogipoo))
- Use a stable sort for hitobjects [\#2563](https://github.com/ppy/osu/pull/2563) ([smoogipoo](https://github.com/smoogipoo))
- Fix conversion tests for ruleset-specific beatmaps not working [\#2562](https://github.com/ppy/osu/pull/2562) ([smoogipoo](https://github.com/smoogipoo))
- Make OsuPerformanceCalculator use the new hitresult namings [\#2561](https://github.com/ppy/osu/pull/2561) ([smoogipoo](https://github.com/smoogipoo))
- Bring osu! difficulty calculation on par with osu!stable [\#2556](https://github.com/ppy/osu/pull/2556) ([smoogipoo](https://github.com/smoogipoo))
- Re-namespace performance/difficulty calculators [\#2555](https://github.com/ppy/osu/pull/2555) ([smoogipoo](https://github.com/smoogipoo))
- Port osu-performance HD AR fix [\#2552](https://github.com/ppy/osu/pull/2552) ([smoogipoo](https://github.com/smoogipoo))
- Allow subclasses of LegacyScoreParser to specify beatmap/ruleset retrieval [\#2551](https://github.com/ppy/osu/pull/2551) ([smoogipoo](https://github.com/smoogipoo))
- Fix deleted beatmaps still being accessible in MusicController [\#2543](https://github.com/ppy/osu/pull/2543) ([smoogipoo](https://github.com/smoogipoo))
- Re-enable slider curve lengthening [\#2540](https://github.com/ppy/osu/pull/2540) ([smoogipoo](https://github.com/smoogipoo))
- Fix drumroll completions always giving GREAT judgements [\#2539](https://github.com/ppy/osu/pull/2539) ([smoogipoo](https://github.com/smoogipoo))
- Use osu!stable hitwindows for converted hitobjects [\#2524](https://github.com/ppy/osu/pull/2524) ([smoogipoo](https://github.com/smoogipoo))
- Add breadcrumb control that follows focus in a screen stack [\#2521](https://github.com/ppy/osu/pull/2521) ([DrabWeb](https://github.com/DrabWeb))
- Add keybind to disable mouse buttons [\#2483](https://github.com/ppy/osu/pull/2483) ([smoogipoo](https://github.com/smoogipoo))
- Fix possibility of test rulesets being discovered from assemblies [\#2544](https://github.com/ppy/osu/pull/2544) ([smoogipoo](https://github.com/smoogipoo))
- Stop focused overlays from handling DragStart [\#2542](https://github.com/ppy/osu/pull/2542) ([peppy](https://github.com/peppy))
- Reduce elements hidden by letterboxing break overlays [\#2541](https://github.com/ppy/osu/pull/2541) ([smoogipoo](https://github.com/smoogipoo))
- Fix performance calculation not considering time-adjustment mods [\#2538](https://github.com/ppy/osu/pull/2538) ([smoogipoo](https://github.com/smoogipoo))
- Fix nullref when changing ruleset at main menu [\#2533](https://github.com/ppy/osu/pull/2533) ([peppy](https://github.com/peppy))
- Apply HD as speed adjustment [\#2531](https://github.com/ppy/osu/pull/2531) ([smoogipoo](https://github.com/smoogipoo))
- Fix crash on startup when adjusting volume before volume control loaded [\#2527](https://github.com/ppy/osu/pull/2527) ([peppy](https://github.com/peppy))
- Fix song progress time counters wrapping after an hour [\#2526](https://github.com/ppy/osu/pull/2526) ([peppy](https://github.com/peppy))
- Fix osu! difficulty/performance calculation failing or giving wrong values [\#2525](https://github.com/ppy/osu/pull/2525) ([smoogipoo](https://github.com/smoogipoo))
- Implement a hold-to-confirm screen when exiting game using escape key [\#2514](https://github.com/ppy/osu/pull/2514) ([peppy](https://github.com/peppy))
- Change mapping delete key to shift+delete to allow binding delete key [\#2375](https://github.com/ppy/osu/pull/2375) ([aQaTL](https://github.com/aQaTL))
- Update framework with upstream fixes [\#2530](https://github.com/ppy/osu/pull/2530) ([peppy](https://github.com/peppy))
- Multiplayer folder restructure [\#2519](https://github.com/ppy/osu/pull/2519) ([DrabWeb](https://github.com/DrabWeb))
- BreadcrumbControl design adjustments [\#2518](https://github.com/ppy/osu/pull/2518) ([DrabWeb](https://github.com/DrabWeb))
- Update framework [\#2516](https://github.com/ppy/osu/pull/2516) ([peppy](https://github.com/peppy))
- Remove explicit clock in TestCaseBreakOverlay [\#2501](https://github.com/ppy/osu/pull/2501) ([smoogipoo](https://github.com/smoogipoo))
- Update CodeFileSanity [\#2498](https://github.com/ppy/osu/pull/2498) ([peppy](https://github.com/peppy))
- Fix beatmap/ruleset being changeable while in the editor [\#2495](https://github.com/ppy/osu/pull/2495) ([smoogipoo](https://github.com/smoogipoo))
- Add mode-specific beatmap statistics [\#2492](https://github.com/ppy/osu/pull/2492) ([smoogipoo](https://github.com/smoogipoo))
- Rework beatmap conversion process to use IBeatmap [\#2491](https://github.com/ppy/osu/pull/2491) ([smoogipoo](https://github.com/smoogipoo))
- Migrate the game to use an IBeatmap interface [\#2490](https://github.com/ppy/osu/pull/2490) ([smoogipoo](https://github.com/smoogipoo))
- Selecting a mod triggers on release [\#2485](https://github.com/ppy/osu/pull/2485) ([santerinogelainen](https://github.com/santerinogelainen))
- Use bindable transforms [\#2482](https://github.com/ppy/osu/pull/2482) ([smoogipoo](https://github.com/smoogipoo))
- Add squirrel dependency on net471 [\#2479](https://github.com/ppy/osu/pull/2479) ([peppy](https://github.com/peppy))
- Decouple FilterControl.Ruleset from the game-wide ruleset bindable [\#2471](https://github.com/ppy/osu/pull/2471) ([UselessToucan](https://github.com/UselessToucan))
- Revert breaking UserProfileOverlay change [\#2481](https://github.com/ppy/osu/pull/2481) ([smoogipoo](https://github.com/smoogipoo))
- Apply offset to end times on legacy converter [\#2473](https://github.com/ppy/osu/pull/2473) ([NeoAdonis](https://github.com/NeoAdonis))
- Stop audio playing from UserProfileOverlay when hiding \(REVERTED\) [\#2470](https://github.com/ppy/osu/pull/2470) ([UselessToucan](https://github.com/UselessToucan))
- Use more inheritance for UserStatus [\#2458](https://github.com/ppy/osu/pull/2458) ([4ppleCracker](https://github.com/4ppleCracker))
- Fix replays being played in the selected ruleset [\#2450](https://github.com/ppy/osu/pull/2450) ([tgi74](https://github.com/tgi74))
- Add toggles for beatmap skins and hitsounds [\#2432](https://github.com/ppy/osu/pull/2432) ([UselessToucan](https://github.com/UselessToucan))

## [osu-framework](https://github.com/ppy/osu-framework) *The game framework behind osu!lazer. Written from scratch with osu! in mind, but very extensible.*

### Fix broken TransformSequence.Loop [\#1580](https://github.com/ppy/osu-framework/pull/1580) ([Tom94](https://github.com/Tom94))

Loading spinners will finally spin again!

### Fix mouse input state inconsistencies and add unit tests [\#1565](https://github.com/ppy/osu-framework/pull/1565) ([peppy](https://github.com/peppy))

Heavy testing added for input states. We're still not done refactoring the input framework, but this is a step in the right direction towards not regressing when we do so.

![](https://puu.sh/AyKkS/672ab55364.gif)

### Implement joystick input [\#1494](https://github.com/ppy/osu-framework/pull/1494) ([smoogipoo](https://github.com/smoogipoo))

See above.

### All Changes
- Fix LastMousePosition not always being present when expected [\#1581](https://github.com/ppy/osu-framework/pull/1581) ([peppy](https://github.com/peppy))
- Fix wheel values not being aggregated in raw mouse handler [\#1579](https://github.com/ppy/osu-framework/pull/1579) ([peppy](https://github.com/peppy))
- Add support for long paths on windows [\#1574](https://github.com/ppy/osu-framework/pull/1574) ([peppy](https://github.com/peppy))
- Fix WindowsClipboard.SetText being broken [\#1573](https://github.com/ppy/osu-framework/pull/1573) ([ekrctb](https://github.com/ekrctb))
- Fix infinite queuing of expensive operations in GLWrapper [\#1570](https://github.com/ppy/osu-framework/pull/1570) ([smoogipoo](https://github.com/smoogipoo))
- Always yield the new state when creating distinct states [\#1568](https://github.com/ppy/osu-framework/pull/1568) ([peppy](https://github.com/peppy))
- Improvement to project files using Directory.Build.props [\#1566](https://github.com/ppy/osu-framework/pull/1566) ([huoyaoyuan](https://github.com/huoyaoyuan))
- Explicitly dispose previous TestCase when switching to a new one [\#1564](https://github.com/ppy/osu-framework/pull/1564) ([smoogipoo](https://github.com/smoogipoo))
- Make IBindable and IBindable\<T\> share some common interfaces [\#1563](https://github.com/ppy/osu-framework/pull/1563) ([smoogipoo](https://github.com/smoogipoo))
- Add a way to override the ScrollContainer's scroll bar [\#1561](https://github.com/ppy/osu-framework/pull/1561) ([smoogipoo](https://github.com/smoogipoo))
- Add ability to ButtonDown and ButtonUp in ManualInputManager [\#1560](https://github.com/ppy/osu-framework/pull/1560) ([peppy](https://github.com/peppy))
- Added padding to the checkbox for running all steps. [\#1558](https://github.com/ppy/osu-framework/pull/1558) ([DudeMartin](https://github.com/DudeMartin))
- Update OpenTK version [\#1557](https://github.com/ppy/osu-framework/pull/1557) ([peppy](https://github.com/peppy))
- Expose scroll wheel and key methods from ManualInputManager [\#1556](https://github.com/ppy/osu-framework/pull/1556) ([smoogipoo](https://github.com/smoogipoo))
- Move custom AppearDelay into its own interface [\#1555](https://github.com/ppy/osu-framework/pull/1555) ([peppy](https://github.com/peppy))
- Fix autosize invalidations occurring with BypassAutoSizeAxes [\#1554](https://github.com/ppy/osu-framework/pull/1554) ([smoogipoo](https://github.com/smoogipoo))
- Allow custom AppearDelay per tooltip [\#1553](https://github.com/ppy/osu-framework/pull/1553) ([default0](https://github.com/default0))
- Fix textbox not always blocking all handled key presses [\#1550](https://github.com/ppy/osu-framework/pull/1550) ([peppy](https://github.com/peppy))
- Clear all trace listeners to avoid MessageBox popups on windows [\#1551](https://github.com/ppy/osu-framework/pull/1551) ([peppy](https://github.com/peppy))
- Fix wrong signature on FillTo [\#1549](https://github.com/ppy/osu-framework/pull/1549) ([smoogipoo](https://github.com/smoogipoo))
- Fix SpriteText size not being computer when set to empty [\#1548](https://github.com/ppy/osu-framework/pull/1548) ([smoogipoo](https://github.com/smoogipoo))
- Commit missed change from \#1545 [\#1547](https://github.com/ppy/osu-framework/pull/1547) ([peppy](https://github.com/peppy))
- Clean up BufferedContainer and fix alignment issues [\#1546](https://github.com/ppy/osu-framework/pull/1546) ([smoogipoo](https://github.com/smoogipoo))
- Change order of lines to properly raise events [\#1545](https://github.com/ppy/osu-framework/pull/1545) ([AlFasGD](https://github.com/AlFasGD))
- Throw an \(unhandled\) exception on assert failure [\#1544](https://github.com/ppy/osu-framework/pull/1544) ([peppy](https://github.com/peppy))
- Make children life update in BDL-load [\#1542](https://github.com/ppy/osu-framework/pull/1542) ([smoogipoo](https://github.com/smoogipoo))
- Update CodeFileSanity [\#1541](https://github.com/ppy/osu-framework/pull/1541) ([peppy](https://github.com/peppy))
- Add a way to transform bindables [\#1539](https://github.com/ppy/osu-framework/pull/1539) ([smoogipoo](https://github.com/smoogipoo))
- Add CircularProgress.FillTo method [\#1538](https://github.com/ppy/osu-framework/pull/1538) ([UselessToucan](https://github.com/UselessToucan))
- Add an option to exact-match keybindings [\#1493](https://github.com/ppy/osu-framework/pull/1493) ([smoogipoo](https://github.com/smoogipoo))
- Use pattern matching [\#1537](https://github.com/ppy/osu-framework/pull/1537) ([UselessToucan](https://github.com/UselessToucan))
- Replace PrimitiveType.Quads with PrimitiveType.TriangleStrip in CircularProgressDrawNode [\#1532](https://github.com/ppy/osu-framework/pull/1532) ([jorolf](https://github.com/jorolf))

## [osu-web](https://github.com/ppy/osu-web) *The new web front-end. [Already live](https://osu.ppy.sh/home) but hasn't yet replaced the old site, pending feature parity.*

### Add webhook for GitHub pull request merges [\#3286](https://github.com/ppy/osu-web/pull/3286) ([nanaya](https://github.com/nanaya))

### Spinner updates [\#3264](https://github.com/ppy/osu-web/pull/3264) ([nanaya](https://github.com/nanaya))

One of my pet peeves, finally fixed. Loading spinners are now perfectly centred.

![](https://puu.sh/AyKzn/0865561836.gif)

### Add social buttons menu bar [\#3235](https://github.com/ppy/osu-web/pull/3235) ([nanaya](https://github.com/nanaya))

Welcome back twitter, facebook. Follow us if you care.

![](https://puu.sh/AyKBu/cc0edaefb0.png)

### Add loved beatmaps to user profile [\#3226](https://github.com/ppy/osu-web/pull/3226) ([notbakaneko](https://github.com/notbakaneko))

Self explanatory. Not sure how they got missed until now!

### Add toggle to block private messages from non-friends [\#3225](https://github.com/ppy/osu-web/pull/3225) ([nekodex](https://github.com/nekodex))

Added as a prerequisite for the upcoming private messaging system. Change the setting from your settings page.

![](https://puu.sh/AyKCn/15a43ef468.png)

### Show past tournaments on the tournament listing [\#3209](https://github.com/ppy/osu-web/pull/3209) ([nekodex](https://github.com/nekodex))

You can now view all previous official tournaments from the [tournaments page](https://osu.ppy.sh/community/tournaments). Easy way to get information about tournaments even after they have ended!

![](https://puu.sh/AyKFh/0297c58a30.png)

### Delete scores on qualification [\#3207](https://github.com/ppy/osu-web/pull/3207) ([nanaya](https://github.com/nanaya))

This was missing since implementation of the modding discussion system. While not a breaking issue, it was indeed a bit weird seeing scores remain on the leaderboards until the point of ranking.

### New Crowdin translations [\#3192](https://github.com/ppy/osu-web/pull/3192) ([peppy](https://github.com/peppy))

We have moved our translations to the hosted Crowdin service, making it a lot easier for the community to jump in and localise the site (and everntually the game, too) to their local tongue. Go [check it out](http://crowdin.com/project/osu-web) and chuck in some help if you can, but either reviewing and voting for existing translations or filling in the gaps!

### All Changes
- Remove overlapping `last` function [\#3300](https://github.com/ppy/osu-web/pull/3300) ([nanaya](https://github.com/nanaya))
- Allow empty changelog entries and fix converter [\#3295](https://github.com/ppy/osu-web/pull/3295) ([nanaya](https://github.com/nanaya))
- Shorter column for indexing [\#3293](https://github.com/ppy/osu-web/pull/3293) ([nanaya](https://github.com/nanaya))
- Style beatmapset discussion search form [\#3289](https://github.com/ppy/osu-web/pull/3289) ([nanaya](https://github.com/nanaya))
- Fix discussion timestamp check [\#3288](https://github.com/ppy/osu-web/pull/3288) ([nanaya](https://github.com/nanaya))
- Return json on error for a json request [\#3285](https://github.com/ppy/osu-web/pull/3285) ([nanaya](https://github.com/nanaya))
- Medal assets for Mappers' Guild Pack II and Cranky [\#3280](https://github.com/ppy/osu-web/pull/3280) ([Ephemeralis](https://github.com/Ephemeralis))
- Match C\# Math.Round for calculating convert keys [\#3276](https://github.com/ppy/osu-web/pull/3276) ([nanaya](https://github.com/nanaya))
- Unbreak lodash [\#3269](https://github.com/ppy/osu-web/pull/3269) ([nanaya](https://github.com/nanaya))
- Fix incorrect closing tag [\#3268](https://github.com/ppy/osu-web/pull/3268) ([nanaya](https://github.com/nanaya))
- Add April Spotlights medal assets [\#3267](https://github.com/ppy/osu-web/pull/3267) ([Ephemeralis](https://github.com/Ephemeralis))
- Limit locale menu height [\#3266](https://github.com/ppy/osu-web/pull/3266) ([nanaya](https://github.com/nanaya))
- Update footer links in line with new legal links [\#3265](https://github.com/ppy/osu-web/pull/3265) ([peppy](https://github.com/peppy))
- Move elasticsearch schemas to json [\#3263](https://github.com/ppy/osu-web/pull/3263) ([notbakaneko](https://github.com/notbakaneko))
- Shipping address updates for paypal checkout [\#3262](https://github.com/ppy/osu-web/pull/3262) ([notbakaneko](https://github.com/notbakaneko))
- Add more date tooltips [\#3261](https://github.com/ppy/osu-web/pull/3261) ([notbakaneko](https://github.com/notbakaneko))
- Update account settings labels [\#3260](https://github.com/ppy/osu-web/pull/3260) ([nanaya](https://github.com/nanaya))
- Synchronize account saving behavior [\#3259](https://github.com/ppy/osu-web/pull/3259) ([nanaya](https://github.com/nanaya))
- Fix beatmap modding pages not working for guests [\#3257](https://github.com/ppy/osu-web/pull/3257) ([nekodex](https://github.com/nekodex))
- Fix mapper link in beatmapset page [\#3254](https://github.com/ppy/osu-web/pull/3254) ([nanaya](https://github.com/nanaya))
- Add artist name in beatmapset qualification event [\#3252](https://github.com/ppy/osu-web/pull/3252) ([nanaya](https://github.com/nanaya))
- Fix overlay on navigation from beatmap discussion page [\#3251](https://github.com/ppy/osu-web/pull/3251) ([nanaya](https://github.com/nanaya))
- Preserve discussion timestamps on restore [\#3250](https://github.com/ppy/osu-web/pull/3250) ([nanaya](https://github.com/nanaya))
- Less padding on floating page extra tabs [\#3249](https://github.com/ppy/osu-web/pull/3249) ([nanaya](https://github.com/nanaya))
- Add pagination above of ranking table [\#3248](https://github.com/ppy/osu-web/pull/3248) ([nanaya](https://github.com/nanaya))
- Fix one missed translation key update [\#3247](https://github.com/ppy/osu-web/pull/3247) ([nanaya](https://github.com/nanaya))
- Remove unused view [\#3246](https://github.com/ppy/osu-web/pull/3246) ([nanaya](https://github.com/nanaya))
- Show unranked update date in card [\#3245](https://github.com/ppy/osu-web/pull/3245) ([nanaya](https://github.com/nanaya))
- Conditionally activate nav button javascript [\#3243](https://github.com/ppy/osu-web/pull/3243) ([nanaya](https://github.com/nanaya))
- Add github link to legal/status footer [\#3242](https://github.com/ppy/osu-web/pull/3242) ([nanaya](https://github.com/nanaya))
- Remove supporter icon background color [\#3241](https://github.com/ppy/osu-web/pull/3241) ([nanaya](https://github.com/nanaya))
- Buttons instead of links for language switcher [\#3240](https://github.com/ppy/osu-web/pull/3240) ([nanaya](https://github.com/nanaya))
- Switch mode if needed for new discussion buttons [\#3239](https://github.com/ppy/osu-web/pull/3239) ([nanaya](https://github.com/nanaya))
- Link cover in beatmapset watchlist to discussion page [\#3238](https://github.com/ppy/osu-web/pull/3238) ([nanaya](https://github.com/nanaya))
- Add missing l10n strings in beatmap listing [\#3237](https://github.com/ppy/osu-web/pull/3237) ([LiquidPL](https://github.com/LiquidPL))
- Fix avatar background in beatmap favorite popup [\#3236](https://github.com/ppy/osu-web/pull/3236) ([nanaya](https://github.com/nanaya))
- Never display iframe borders [\#3234](https://github.com/ppy/osu-web/pull/3234) ([peppy](https://github.com/peppy))
- Change new approved beatmaps to new ranked beatmaps [\#3230](https://github.com/ppy/osu-web/pull/3230) ([VenixOSU](https://github.com/VenixOSU))
- Don't add to error array if empty [\#3228](https://github.com/ppy/osu-web/pull/3228) ([notbakaneko](https://github.com/notbakaneko))
- Order checkout validation does not support null carts [\#3227](https://github.com/ppy/osu-web/pull/3227) ([notbakaneko](https://github.com/notbakaneko))
- Add user events for supporter and username changes [\#3222](https://github.com/ppy/osu-web/pull/3222) ([notbakaneko](https://github.com/notbakaneko))
- Better wording on mapper info [\#3220](https://github.com/ppy/osu-web/pull/3220) ([nanaya](https://github.com/nanaya))
- Cleanup trans and trans\_choice [\#3216](https://github.com/ppy/osu-web/pull/3216) ([nanaya](https://github.com/nanaya))
- beatmappacks.php source string update [\#3214](https://github.com/ppy/osu-web/pull/3214) ([notbakaneko](https://github.com/notbakaneko))
- Store checkout and validation updates [\#3213](https://github.com/ppy/osu-web/pull/3213) ([notbakaneko](https://github.com/notbakaneko))
- Don't release stock if at 0 [\#3212](https://github.com/ppy/osu-web/pull/3212) ([notbakaneko](https://github.com/notbakaneko))
- fallback keys should still be translated in case they are supposed to be empty. [\#3210](https://github.com/ppy/osu-web/pull/3210) ([notbakaneko](https://github.com/notbakaneko))
- No nomination by mapper [\#3206](https://github.com/ppy/osu-web/pull/3206) ([nanaya](https://github.com/nanaya))
- Fix ranking page titles [\#3204](https://github.com/ppy/osu-web/pull/3204) ([nanaya](https://github.com/nanaya))
- Pre-check topic create auth [\#3203](https://github.com/ppy/osu-web/pull/3203) ([nanaya](https://github.com/nanaya))
- Fix mode switching in discussion [\#3202](https://github.com/ppy/osu-web/pull/3202) ([nanaya](https://github.com/nanaya))
- Don't escape trans where markup is passed by param [\#3199](https://github.com/ppy/osu-web/pull/3199) ([notbakaneko](https://github.com/notbakaneko))
- Override trans to ignore empty strings [\#3194](https://github.com/ppy/osu-web/pull/3194) ([nanaya](https://github.com/nanaya))
- Disable styleci for non-english locales [\#3190](https://github.com/ppy/osu-web/pull/3190) ([nanaya](https://github.com/nanaya))
- Update copyright year in lang files licenses [\#3189](https://github.com/ppy/osu-web/pull/3189) ([nanaya](https://github.com/nanaya))
- \[zh\] Chinese patch-11 [\#3181](https://github.com/ppy/osu-web/pull/3181) ([kj415j45](https://github.com/kj415j45))
- Bahasa Indonesia Localisation Update [\#3178](https://github.com/ppy/osu-web/pull/3178) ([fajar13k](https://github.com/fajar13k))
- Fix discussionLinkify [\#3177](https://github.com/ppy/osu-web/pull/3177) ([nanaya](https://github.com/nanaya))
- Fix editing user page [\#3172](https://github.com/ppy/osu-web/pull/3172) ([nanaya](https://github.com/nanaya))
- Replace the old default avatar [\#3171](https://github.com/ppy/osu-web/pull/3171) ([nekodex](https://github.com/nekodex))
- Filter blank discussions and change to case-insensitive username sort [\#3170](https://github.com/ppy/osu-web/pull/3170) ([notbakaneko](https://github.com/notbakaneko))
- Retina-ify beatmapset-panel [\#3166](https://github.com/ppy/osu-web/pull/3166) ([nekodex](https://github.com/nekodex))
- Allow larger button in beatmapset header [\#3164](https://github.com/ppy/osu-web/pull/3164) ([nanaya](https://github.com/nanaya))
- Only show pm icon if user exists [\#3163](https://github.com/ppy/osu-web/pull/3163) ([nanaya](https://github.com/nanaya))
- Check if cancelled Order already has a cancelled Payment [\#3162](https://github.com/ppy/osu-web/pull/3162) ([notbakaneko](https://github.com/notbakaneko))
- Fix recent plays listing on user page [\#3161](https://github.com/ppy/osu-web/pull/3161) ([nanaya](https://github.com/nanaya))
- Fix tournament banner scaling [\#3160](https://github.com/ppy/osu-web/pull/3160) ([nanaya](https://github.com/nanaya))
- Set a background colour for the avatar in usercard [\#3158](https://github.com/ppy/osu-web/pull/3158) ([MegaApplePi](https://github.com/MegaApplePi))
- Add more info to tournament page [\#3157](https://github.com/ppy/osu-web/pull/3157) ([nanaya](https://github.com/nanaya))
- Fix discussion counts wrapping under chart on mobile [\#3156](https://github.com/ppy/osu-web/pull/3156) ([notbakaneko](https://github.com/notbakaneko))
- Skip releasing of reserved stock on cancelled payments [\#3155](https://github.com/ppy/osu-web/pull/3155) ([notbakaneko](https://github.com/notbakaneko))
- Sort qualified beatmap listing according to qualified queue date [\#3154](https://github.com/ppy/osu-web/pull/3154) ([notbakaneko](https://github.com/notbakaneko))
- Only show discussion starters in user filter [\#3152](https://github.com/ppy/osu-web/pull/3152) ([notbakaneko](https://github.com/notbakaneko))
- Update spoilerbox design [\#3151](https://github.com/ppy/osu-web/pull/3151) ([MegaApplePi](https://github.com/MegaApplePi))
- Fix modding history not applying user filter [\#3146](https://github.com/ppy/osu-web/pull/3146) ([notbakaneko](https://github.com/notbakaneko))
- Redirect user modding history to path using the user id [\#3144](https://github.com/ppy/osu-web/pull/3144) ([notbakaneko](https://github.com/notbakaneko))
- Sort discussion by timestamp [\#3142](https://github.com/ppy/osu-web/pull/3142) ([nanaya](https://github.com/nanaya))
- Add tooltip to modding history link & hide on bots [\#3141](https://github.com/ppy/osu-web/pull/3141) ([nanaya](https://github.com/nanaya))
- Update flag for SH [\#3140](https://github.com/ppy/osu-web/pull/3140) ([nanaya](https://github.com/nanaya))
- Various fixes [\#3139](https://github.com/ppy/osu-web/pull/3139) ([nanaya](https://github.com/nanaya))
- Korean translation [\#3138](https://github.com/ppy/osu-web/pull/3138) ([ghost](https://github.com/ghost))
- Log unknown exceptions for Xsolla to Sentry [\#3137](https://github.com/ppy/osu-web/pull/3137) ([notbakaneko](https://github.com/notbakaneko))
- Add March Spotlight web medal assets [\#3136](https://github.com/ppy/osu-web/pull/3136) ([Ephemeralis](https://github.com/Ephemeralis))
- Bahasa Indonesia Localisation [\#3130](https://github.com/ppy/osu-web/pull/3130) ([fajar13k](https://github.com/fajar13k))
- Change Charts to Spotlights [\#3129](https://github.com/ppy/osu-web/pull/3129) ([TPGPL](https://github.com/TPGPL))
- Right align the news preview post date if it happens to wrap [\#3126](https://github.com/ppy/osu-web/pull/3126) ([MegaApplePi](https://github.com/MegaApplePi))
- \[ES\] Changes on User page  [\#3125](https://github.com/ppy/osu-web/pull/3125) ([KaiMinCL](https://github.com/KaiMinCL))
- Allow redirecting wiki paths more than one level deep [\#3123](https://github.com/ppy/osu-web/pull/3123) ([notbakaneko](https://github.com/notbakaneko))
- Keep Docker MySQL container version at 5.7 [\#3113](https://github.com/ppy/osu-web/pull/3113) ([LiquidPL](https://github.com/LiquidPL))
- Thai translation [\#3106](https://github.com/ppy/osu-web/pull/3106) ([rayriffy](https://github.com/rayriffy))
- Improved\(?\) 404 for users\#show [\#3099](https://github.com/ppy/osu-web/pull/3099) ([nanaya](https://github.com/nanaya))
- Less verbose error message [\#3097](https://github.com/ppy/osu-web/pull/3097) ([nanaya](https://github.com/nanaya))
- fix modding history events page if beatmapset was deleted [\#3096](https://github.com/ppy/osu-web/pull/3096) ([notbakaneko](https://github.com/notbakaneko))
- Show tournament supporter banner in profile page [\#3091](https://github.com/ppy/osu-web/pull/3091) ([nanaya](https://github.com/nanaya))
- Add user filter for beatmap discussions [\#3090](https://github.com/ppy/osu-web/pull/3090) ([notbakaneko](https://github.com/notbakaneko))
- Fix bbcode url editing [\#3089](https://github.com/ppy/osu-web/pull/3089) ([nanaya](https://github.com/nanaya))
- Revise the Polish translation [\#3087](https://github.com/ppy/osu-web/pull/3087) ([TPGPL](https://github.com/TPGPL))
- Make user modding history public [\#3080](https://github.com/ppy/osu-web/pull/3080) ([notbakaneko](https://github.com/notbakaneko))
- Remove spaces after quotes [\#3078](https://github.com/ppy/osu-web/pull/3078) ([nanaya](https://github.com/nanaya))
- Ignore yarn error log file and remove irrelevant npm ignore [\#3077](https://github.com/ppy/osu-web/pull/3077) ([nanaya](https://github.com/nanaya))
- completed localisation for japanese [\#3071](https://github.com/ppy/osu-web/pull/3071) ([Soukyuen](https://github.com/Soukyuen))
- Add check on new player for posting on forum [\#3036](https://github.com/ppy/osu-web/pull/3036) ([nanaya](https://github.com/nanaya))

Holy crap, did you actually make it this far? Thanks for reading. A lot of effort goes into these posts so I hope it was of some use.