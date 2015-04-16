/*
 * File: "int.sqf"
 * Author: CC_Moska
 */
 
 
//CLIENT//
 [-1,{
	enableSaving [false, false];
	enableSentences false;
	cutText ["", "BLACK FADED"];
	Sleep 0.1;
	disableUserInput true;
	playSound "wait";
	BlackScreen = []execVM "fnc\eff\blackScreen.sqf";
}] call CBA_fnc_globalExecute;
 
//SERVER//
[0, {
	[1000,-1,true,100,1000,1000]call compile preprocessFile "fnc\ext\zbe_cache\main.sqf";
	call compile preprocessFile "dat\paths.sqf";
	call compile preprocessFile "fnc\tem\template1.sqf";
	nul = []execVM "RydHQInit.sqf";
	
	//init//////
	//CLIENT//
	[-1,{
		heli2 addAction["Fuseller","fnc\eqp\fn_configEquipacio.sqf",["fuseller",player]];
	}] call CBA_fnc_globalExecute;
	//SERVER//
	Sleep 48;
	{_x allowDamage false} forEach Units a1;
	{_x allowDamage false} forEach Units a2;
	{_x allowDamage false} forEach Units a3;
	[heli1, heli1path, [] ,true, true] spawn BIS_fnc_UnitPlay;
	[heli2, heli2path, [] ,true, true] spawn BIS_fnc_UnitPlay;
	Sleep 10;
	{_x moveInCargo heli2} forEach Units a1;
	{_x moveInCargo heli2} forEach Units a2;
	{_x moveInCargo heli2} forEach Units a3;
	//fin init//
	//CLIENT//
	[-1,{
		terminate BlackScreen;
		Sleep 0.1;
		disableUserInput false;
		cutText ["","BLACK IN",10];
		hint "PARTIDA INICIADA SATISFACTORIAMENT";
	}] call CBA_fnc_globalExecute;
	teacall compile preprocessFile "fnc\missionlogic.sqf";	
}] call CBA_fnc_globalExecute;

 

/*[heli1, heli1path, [] ,true, true] spawn BIS_fnc_UnitPlay;
[heli2, heli2path, [] ,true, true] spawn BIS_fnc_UnitPlay;
[plane1, plane1path, [] ,true, true] spawn BIS_fnc_UnitPlay;*/