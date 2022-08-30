# Arma 3 - [MP Compatbile] Gas Mask/Helmet Overlay
The script is intended for use in multiplayer missions, but with minor modification it will work just as well in singleplayer.

The main purpose of this script is to provide the necessary building grounds to create CBRN missions. When a gas mask is equipped, it will add the built-in or custom ARMA 3 gas mask overlay and play the related equip/unequip & breathing sounds. In the example mission further scripted functionality is demonstrated:
* Proper usage & trigger of decontamination showers.
* Hazard zones in which players without appropriate CBRN gear will recieve damage indicated by screen effects.

**How is this implementation better than others?** </br>
When a player respawns the player object is changed and thus the reference to the object is no longer valid, this esentially renderes all of the scripts, I've reviewed, for gas mask overlay useless in mulitplayer.
To overcome this issue, this script uses a Respawn Handler which is created inside the unit_init.sqf, when a player respawns the handler invokes the gasmask.sqf with arguments pointing to the current player object.

## How to use
Edit gasmask.sqf and change variables on line 4 & 5 to the equipment you want to trigger the overlay.<br/>
In the below examples the equipment is set to `G_AirPurifyingRespirator_01_nofilter_F`, you can instead use `G_Balaclava_blk`.<br/>
```
protection = "G_AirPurifyingRespirator_01_nofilter_F"; 
protection2 = "G_RegulatorMask_F";
```
Change the line `(goggles _unit isEqualTo protection)` to `(headgear _unit isEqualTo protection)` (or respective slot name) if the item which you want is located in a different slot, like headgear.

## Notes:
* If you wish to use the Arma 3 Contact DLC cbrn gear, keep in mind that the unit (cbrn_specialist) spawns with "G_AirPurifyingRespirator_01_nofilter_F" and later respawns with "G_AirPurifyingRespirator_01_F".
* If you wish to change the default sounds provided with this script, you can find free samples here https://freesound.org/home/. Audacity can be used to edit the sound according to your needs, custom sounds need to be exported to .ogg format.


## Features:
* gasmask.sqf is compiled to memory and lodaded from there instead of reading from disk each time.
* Custom & built-in overlays for the gasmask
* Custom sounds for equip/uneqip & breathing.
* Multiplayer compatible

## Known issues:
* No known issues at the moment

## To-Do:
* Create a singleplayer version of this script

## Lessons learned:
* gasmask.sqf and unit_init.sqf had a function with the exact same name "fnc_overlay". This essentially froze the script, keep that in mind if you modify this script.

## References:
https://www.youtube.com/watch?v=h_QHDqJ4uJQ

## Credits to Chuc for his Radiation script:
https://forums.bohemia.net/forums/topic/217071-radiation-script/
