# Movement Bash
Canary build of Movement Bash, which is a port of Movement Batch for bash shells. For more stable versions, see "releases".

## How to play
For instructions, please refer to files available in the help directory or using the built-in help function of the game.

## How to get and test latest canary build
* Run `git clone https://github.com/MarkusMaal/MovementBash.git` on a terminal
* `cd MovementBash` (to navigate to the directory where you cloned the files)
* `bash Start_game.sh` or `./Movement_bash.sh`
* If the previous command didn't work, run `chmod +x Start_game.sh`

## Tested operating systems
* Windows 11 using Windows Subsystem for Linux 2 - works with flying colours
* Windows 11 using Git bash - too slow, usable for making new maps but not playing existing ones
* GNU/Linux with Konsole terminal emulator - a little bit slow, usable for making new maps or playing smaller maps
* GNU/Linux over SSH - a little bit slow, usable for making new maps and playing smaller maps
* GNU/Linux with native shell in systemd - works
* Haiku - requires enabling ASCII mode and manually setting controls
* Gobo Linux - requires custom shabang, added by me to Start_game.sh
* TinyCore - requires custom shabang, added by me to Start_game.sh
