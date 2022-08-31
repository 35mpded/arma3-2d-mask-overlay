params ["_unit"];

// Change to the item that you want to trigger the overlay
protection = "G_Balaclava_blk";

// If you want the overlay to be hidden when viewing the map ,change "true" to "false" in the below line.
// RscCBRN_APR_02 is provided by Arma 3 contact. For other Contact overlays reffer to the CBRN wiki here: https://community.bistudio.com/wiki/Arma_3:_CBRN
fnc_overlay = { 0 cutRsc ["RscCBRN_APR_02","PLAIN", 1, true];	sleep 0.1;};

// to use custom texture uncomment below
//fnc_overlay = { 0 cutRsc ["overlay_texture","PLAIN", 1, true];	sleep 0.1;};

fnc_overlayTerminate = {
params ["_handle"];
onEachFrame {0 cutText ["","PLAIN"]};
playsound "maskTakeOff";
terminate _handle;
0 fadeSound 1;
};

waitUntil {!isNil "protection"};

[_unit] spawn 
{
	params ["_unit"];
	while {!isNull _unit} do 
	{
		waitUntil {alive _unit};
		if (goggles _unit isEqualTo protection) then 
		{
		_unit setVariable ["isProtected",true,true]
		} else {
		_unit setVariable ["isProtected",false,true]
		};
		sleep 0.2;
	};
};
sleep 1;
while {!isNull _unit} do 
{
	waitUntil {alive _unit};
	__checkProtection = _unit getVariable "isProtected";
	while {!__checkProtection} do 
	{
	__checkProtection = _unit getVariable "isProtected";
	sleep 0.1
	};
	
	playsound "maskPutOn";	
	sleep 2.5;
	onEachFrame {overlayeffects = 0 spawn fnc_overlay};
	sleep 0.1; 
	0 fadeSound (soundVolume/6);
	[_unit] spawn 
		{
			params ["_unit"];
			__checkProtection = _unit getVariable "isProtected";
			while {__checkProtection} do 
			{
			__checkProtection = _unit getVariable "isProtected";
			_int_b = linearConversion [0, 1,(getFatigue _unit), 8, 1.8, true];
			playsound "maskBreath";
			sleep _int_b;
			};
		};
	while {__checkProtection} do {__checkProtection = _unit getVariable "isProtected";sleep 0.1};

	//terminate overlayeffects;
	[overlayeffects] call fnc_overlayTerminate;
	sleep 0.1;
};
