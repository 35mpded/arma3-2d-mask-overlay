// This array will hold the player object
private ["_unit"];

// The array will store the first passed argument (in our case player object). The argument is passed from the unit init field via [this] execVM "unit_init.sqf";
_unit = _this select 0;

// Store the gasmask.sqf script file into memory as a function
gasmaskov = compile preprocessFileLineNumbers "overlay\gasmask.sqf";

// Function used to invoke gasmkask.sqf
gasmaskovInit =
{
private ["_unit"];

_unit = _this select 0;

[_unit] spawn gasmaskov;
};

// Event handler which will call the gasmakovInit function when a player is respawned
_unit addEventHandler ["Respawn",
{
[_this select 0] call gasmaskovInit;
}];