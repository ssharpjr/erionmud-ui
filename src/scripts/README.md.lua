--[[ README.md
# ErionMud UI

Erion is an immersive medieval fantasy world since 2005 with a fun and friendly playerbase, challenging quests/missions, and an excellent class/skill system.

This [Mudlet](https://www.mudlet.org) UI was created and themed for [Erion Mud](https://www.erionmud.com).  
Based on the original package: ErionUI 1.0 by Caelinus [(github.com/Caelinus)](https://www.github.com/Caelinus)

See [INSTALL.md](INSTALL.md) for installation details.

<img src="src/resources/images/ui-fullscreen.png" alt="ErionMud UI" width="800"/>

This package was built using [Muddler](https://github.com/demonnic/muddler) and [DeMuddler](https://github.com/Edru2/DeMuddler)

This project is completely free and open source. Feel free to clone, copy, and modify as you like.

## Ideas, TODOs, and Known Issues

### Known Issues

- Fix the "City of", "Land of" bug in the quest area regex. It doesn't always grab the whole location name.

### TODOs

- Make sure all chat channels are properly captured (ongoing).
- Capture other events (Hero, Legend, etc.)
- Add global quests details to the top container.
- Add current debuffs to the bottom or right side of the bottom container.
- Work on UI help files.

### Ideas

- Get the Mudlet mapper setup.
- Incorporate Waypoints in custom runtos.
- Track AutoSkill and KillSkill.
- Add weather and moon cycles to the lower right.
- Add a Global Quest alert for your level range.
- Clean up the top container notifications. Maybe split the top with an HBox?
  - This would allow for static notifications on the right and quest, etc. stuff on the left.
- Add a spot to list all mobs in a room.
  - Maybe move Events to the top container and use its left space as a mob list?

]]