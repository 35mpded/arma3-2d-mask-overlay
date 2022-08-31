// Initializes CBRN Hose for the units. I don't remember why I did this, but I'm sure there was a good reason for it. Remove at your own risk!
[player] call BIN_fnc_CBRNHoseInit;

// Clear the Hazard effects if a player died in a hazard zone. Otherwise after respawn the player will carry over the hazard zone effects.
player setVariable ['noradiat', ppEffectCreate ['ChromAberration', 200]];
(player getVariable 'noradiat') ppEffectEnable true;
(player getVariable 'noradiat') ppEffectAdjust [0.0, 0.0, true];
(player getVariable 'noradiat') ppEffectCommit 10;
player setVariable ['noradiat2', ppEffectCreate ['ColorInversion', 500]];
(player getVariable 'noradiat2') ppEffectEnable true;
(player getVariable 'noradiat2') ppEffectAdjust [0, 0, 0];
(player getVariable 'noradiat2') ppEffectCommit 10;

