# Pokémon Red, Green, and Blue JP: Masaru2 Edition

**pokejp** serves as a dissassembly base, based on the Japanese releases of the Generation 1 Pokémon games.
Improves the romhacks made by the user MoriyaFaith, restores various things that weren't in his romhack

It builds the following ROMs:

* Pokemon Red.gb 
* Pokemon Red Debug.gb 
* Pokemon Green.gb 
* Pokemon Green Debug.gb 
* Pokemon Blue.gb 
* Pokemon Blue Debug.gb 

## Downloading and playing
In the case of simply wanting to play generation 1 as it was released in Japan, download the .ips patch files from the [patches](patches) folder, and use a tool like [Lunar IPS](http://fusoya.eludevisibility.org/lips/) (for Windows), [MultiPatch](http://projects.sappharad.com/tools/multipatch.html) (for OS X), or [UniPatcher](https://play.google.com/store/apps/details?id=org.emunix.unipatcher&hl=en) (for Android) to apply the patch to the correct ROM.

These are the roms you should use for each version:

**Red**
- Pokemon Red (UE) [S][!].gb `sha1: ea9bcae617fdf159b045185467ae58b2e4a48b9a`

**Green and Blue**
- Pokemon Blue (UE) [S][!].gb `sha1: d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`

They're based off of the ones made by the [pokered](https://github.com/pret/pokered) project.

## Setting up your own

To set up the repository for your own editing purposes, see [**INSTALL.md**](INSTALL.md).

## Why make this?

In 1995, The original Pocket Monsters Red and Green were released. Later that Year, Pocket Monsters Blue was released as well. In the west, 2 years later, Pokémon Red and Blue werre released, using the updated Pocket Monsters Blue as the base engine. A Pokémon game with Pocket Monsters Blue's wild data was never released in Japan. This caused a multitude of changes in the International releases of Red and Blue. This ROM hack serves to create English Versions of those Japanese releases, the closest as possible.

## What's changed?

* Any bugs present in the original Red and Green that are not in the International Red and Blue are not present.
* The title screen of Pokemon Red and Green has been changed to the original Japanese release.
* Pokémon Blue's wild Pokémon data has been edited to the Japanese release. Pokémon Green uses US Blue's wild data.
* Pokémon Red and Green now use the original Cerulean Cave layout.
* Pokémon Red and Green use their Overworld and Pokémon graphics from their original release.
* Pokémon Green loads its unique Super Game Boy Palette.
* Each game's Super Game Boy Border now has text saying "POKEMON!" where "POCKET MONSTERS!" normally is in the Japanese games.
* Fixed Glitch where Haunters from in-game trades wouldn't evolve.
* Fix the Game Freak Presents Bug where it dosen't appears where it's supposed.
* Restores the original flashing lights for the moves "Thunderbolt" and "Hyper Beam".
* Original Japanese map border layout restored.

## Screenshots

**Pokémon Red**

![red-overworld](screenshots/red-overworld.bmp)
![red-wild](screenshots/red-wild.bmp)
![red-trade](screenshots/red-trade.bmp)
![red-map](screenshots/red-map.bmp)

**Pokémon Green**

![green-title](screenshots/green-title.bmp)
![green-slots](screenshots/green-slots.bmp)
![green-ceruleancave](screenshots/green-ceruleancave.bmp)

**Pokémon Blue**

![blue-title](screenshots/blue-title.bmp)
![blue-prizes](screenshots/blue-prizes.bmp)
![blue-wild](screenshots/blue-wild.bmp)

## To-do

* Add translated Red and Green Pokédex entries, Most likely edited from the ones in FireRed(?)
* Fix MissingNo. not having the correct graphics, if possible. This could potentially also fix MissingNo. corrupting Hall of Fame data.

## Credits

* MoriyaFaith for his original project
* The [pokered](https://github.com/pret/pokered) for serving as a base dissassembly
* Alchav's fork of pokered, which allowed usage of the RG sprites
* Rangi42 for creating Tilemap Studio and Polished Map, allowing for editing of tilemaps and Cerulean Cave and for the Japanese Map Border Layout
