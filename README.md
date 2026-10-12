# Infinibee

A short game experience made with Redot

Idea: The player is rotating at a constant rate, making a circle around some point, you can hold spacebar to cause the player to switch the direction of rotation. By rapidly switching directions one can get better at moving and navigating around

Win condition: There is no win condition, keep scoring

Lose condition: On hittin an asteroid

Play at: https://alimad.itch.io/infinibee

Made by Muhammad Ali

Structure:

```
.
├── addons
│   └── godot_super-wakatime // this is for time tracking, not necessary for the project to run
│       ├── api_key_prompt.tscn
│       ├── counter.tscn
│       ├── decompressor.gd
│       ├── decompressor.gd.uid
│       ├── godot_super-wakatime.gd
│       ├── godot_super-wakatime.gd.uid
│       ├── LICENSE
│       ├── plugin.cfg
│       ├── README.md
│       ├── utils.gd
│       └── utils.gd.uid
├── ARCADECLASSIC.TTF // font used
├── ARCADECLASSIC.TTF.import
├── enem.png // asteroid
├── enem.png.import
├── enemy.gd // script for asteroid moveents
├── enemy.gd.uid
├── enemy.tscn // scene containing the asteroid
├── export_presets.cfg
├── icon.svg
├── icon.svg.import
├── label.gd // label that auto fades after game start
├── label.gd.uid
├── LICENSE
├── main.gd // counts, lerps and updates score label
├── main.gd.uid
├── main.tscn // main scene
├── player.gd // player movement
├── player.gd.uid
├── player.png // player sprite
├── player.png.import
├── project.godot // Redot project
├── README.md
├── spawners.gd // spawner, spawns stuff randomly at rotating points around the map
├── spawners.gd.uid
├── stars.jpg // background
├── stars.jpg.import
├── star.webp // ehhh
├── star.webp.import
├── trail.gd // player trail!
└── trail.gd.uid

3 directories, 42 files
```
