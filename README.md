# Join control

Allows you to control the player's team and class

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later
* [dod-hooks](https://github.com/dronelektron/dod-hooks)

### Installation

* Download latest [release](https://github.com/dronelektron/join-control/releases)
* Extract `plugins` folder to `addons/sourcemod` folder of your server

### Console Variables

* sm_joincontrol_mode_team_full - Team full mode [default: "0"]
* sm_joincontrol_mode_team_stacked - Team stacked mode [default: "0"]
* sm_joincontrol_mode_class - Class mode [default: "0"]
* sm_joincontrol_flags_team_full - Team full flags [default: ""]
* sm_joincontrol_flags_team_stacked - Team stacked flags [default: ""]
* sm_joincontrol_flags_class - Class flags [default: ""]

### Mode

* 0 - Default game logic
* 1 - Flag-only access
* 2 - Access to all

### Notes

* `Team full` - Spawn point limit reached
* `Team stacked` - Team disbalance
* `Class` - Class limit reached
