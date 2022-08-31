# Arma 3 - [MP Compatbile] Gas Mask/Helmet Overlay
The script is intended for use in multiplayer missions, but with minor modification it will work just as well in singleplayer.

Example mission in which this script is used:</br>
https://steamcommunity.com/sharedfiles/filedetails/?id=2781568799</br>
https://forums.bohemia.net/forums/topic/237970-mp-hazardzone-compete-with-other-players-in-an-area-with-great-biological-threat/

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
* The custom breathing sound was removed, but it is implemented in the old version (v1) of the script. The logic used for the old script had a costy performance impact, thus I had to rewrite it. Unfortunetly, the new logic does not work well with the breathing sound and I'm not sure how to implement it properly. Futhermore, the breathing sound is overlayed on top of the original breathing sound. I'm not sure how to suppress this sound (or if it's even possible) and it may be something I'll never implement again. If you happen to know how to solve this and want to help, just raise an issue and comment on it.

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

## Credits:
Credits to **Chuc** for his original Radiation script - Amazing radiation script, I just modified it a bit to require multiple of items for the player to be protected in the zones.</br>
https://forums.bohemia.net/forums/topic/217071-radiation-script/</br>
The project is heavily inspired by **ALIAS'** script.</br>
https://steamcommunity.com/sharedfiles/filedetails/?id=909790601
