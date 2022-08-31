private ["_unit"];

_unit = _this select 0;

gasmaskov = compile preprocessFileLineNumbers "overlay\gasmask.sqf";

gasmaskovInit =
{
private ["_unit"];

_unit = _this select 0;

[_unit] spawn gasmaskov;
};

_unit addEventHandler ["Respawn",
{
[_this select 0] call gasmaskovInit;
}];