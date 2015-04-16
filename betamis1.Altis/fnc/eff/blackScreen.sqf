/****************************************************************
Cavallers del Cel Mission Framework
Script: Efecto de pantalla en negro / Effect, screen black.
Author: OMSmolina, TBlack
Script version: 1.0
Game type: n/a
File: blackScreen.sqf
****************************************************************/


// Effect, screen black.

private[ "_i"];
_i = 0;

while {true} do
{
	hintSilent parseText format ["<t>CARREGANT MISSIÓ - %1s</t><br/><img size=10 image='dat\img\wait.paa'/>", _i];
	cutText ["", "BLACK FADED"];
	Sleep 5;
	_i = _i + 5;
};