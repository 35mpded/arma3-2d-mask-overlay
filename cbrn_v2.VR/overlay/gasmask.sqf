// Define the parameter "_unit" for the player object which will be passed to this script from unit_init.sqf
params ["_unit"];
// Store the overlay state, i.e gas mask equipped/unequipped. This is a control mechanism used by the while loop below
publicVariable "effectApplied";
// Define the items which will trigger the overlay
protection = "G_AirPurifyingRespirator_01_nofilter_F";
protection2 = "G_AirPurifyingRespirator_01_F";
// G_AirPurifyingRespirator_01_F

// To hide the overlay when viewing the map, change "true" to "false" in the below line.
// RscCBRN_APR_02 is provided by Arma 3 contact. For other Contact overlays reffer to the CBRN wiki here: https://community.bistudio.com/wiki/Arma_3:_CBRN
// Arma's overlay_texture
fnc_overlay = { 0 cutRsc ["RscCBRN_APR_02","PLAIN", 1, true]; effectApplied = true; sleep 0.1;};

// To use custom texture uncomment the below line and comment the above "fnc_overlay" line
//fnc_overlay = { 0 cutRsc ["overlay_texture","PLAIN", 1, true]; sleep 0.1;};


// This is the terminate function which will play the respective sound when the mask is unequipped and remove any overlay effects.
fnc_overlayTerminate = {
params ["_handle"];
effectApplied = false;
onEachFrame {0 cutText ["","PLAIN"]};
playsound "maskTakeOff";
terminate _handle;
0 fadeSound 1;
};

// Suspends execution of scheduled script until the given condition satisfied. i.e it will wait for the player to be alive before the script executes
waitUntil {alive _unit};

// While the player is alive, loop and check if the overlay is applied
// if the overlay is not applied and the respective item is equipped, it will apply the overlay, if the overlay is applied, but the respective item is not equipped, it will teminate the overlay effects. 
// If there is any other condition, it will set the control variable to false.
while {alive _unit} do 
{
	if (!isNil "effectApplied") then {
			if ((goggles _unit isEqualTo protection or goggles _unit isEqualTo protection2) && !(effectApplied)) then {
				playsound "maskPutOn";	
				sleep 2.5;
				onEachFrame {overlayeffects = 0 spawn fnc_overlay};
				sleep 0.1; 
				0 fadeSound (soundVolume/6);
			};
			if (!(goggles _unit isEqualTo protection or goggles _unit isEqualTo protection2) && (effectApplied)) then {
				[overlayeffects] call fnc_overlayTerminate;
			};
		} else {
			effectApplied = false;
		};
};