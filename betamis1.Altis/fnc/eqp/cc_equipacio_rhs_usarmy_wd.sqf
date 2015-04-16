//=======================================================================================================//
// Arxiu: cc_equipacio_rhs_usarmy_wd.sqf                                                                 //
// Autor: CC_Magnetar                                                                                    //
// Versió: 0.1                                                                                           //
// Creació del Document: 02/04/2015                                                                      //
// Descripció: Aquest document serveix per equipar els jugadors amb l'equipació dissenyada per la missió //
//             sense fer servir els perfils estàndard del grup dels Cavallers del Cel. Requereix que el  //
//             jugador formi part de la facció RHS: United States Army "rhs_faction_usarmy_wd"           //
//             (http://doc.rhsmods.org/index.php/United_States_Army). Cal afegir la següent línia al     //
//             INIT de la unitat en l'editor:                                                            //
//                                                                                                       //
//                  ["ROL_JUGADOR",this] call cc_fnc_configEquipacio;                                    //
//                                                                                                       //
//             on "ROL_JUGADOR" és una de les següents entrades:                                         //
//                                                                                                       //
//                  ROL_JUGADOR         Rol assignat                                                     //
//                  lideresquadra       Líder d'esquadra                                                 //
//                  liderequip          Líder d'equip                                                    //
//                  fuseller            Fuseller                                                         //
//                  granader            Granader                                                         //
//                  fusellerautomatic   Fuseller automàtic                                               //
//                  metrallador         Metrallador                                                      //
//                  antitanc            Antitanc                                                         //
//                  tirador             Tirador                                                          //
//                  metge               Metge                                                            //
//                  explosius           Explosius                                                        //
//                  franctirador        Franctirador                                                     //
//=======================================================================================================//

_tipusUnitat = _this select 0;
_unitat = _this select 1;
_esInfanteria = _unitat isKindOf "CAManBase"; 

// Elements comuns
_uniforme = "rhs_uniform_cu_ocp_patchless";
_uniformeSN = "U_B_GhillieSuit";

_armillaSQ = "rhsusf_iotv_ocp_squadleader";
_armillaTL = "rhsusf_iotv_ocp_teamleader";
_armillaRFL = "rhsusf_iotv_ocp_rifleman";
_armillaGR = "rhsusf_iotv_ocp_grenadier";
_armillaME = "rhsusf_iotv_ocp_medic";
_armillaSAW = "rhsusf_iotv_ocp_SAW";

_casc = "rhsusf_ach_helmet_headset_ocp";

_ulleres = "G_Tactical_Clear";

_motxilla = "rhsusf_assault_eagleaiii_ocp";

_arma = "rhs_weap_m4a1";
_arma320 = "rhs_weap_m4a1_m320";
_armaAR = "rhs_weap_m249_pip";
_armaMG = "rhs_weap_m240B";
_armaDM = "rhs_weap_m14ebrri";

_armaSilenciador = "rhsusf_acc_rotex5_grey";
_armaSurefire = "rhsusf_acc_SF3P556";

_armaLaserLlanterna = "rhsusf_acc_anpeq15";
_armaLaserLlanternaAR = "rhsusf_acc_anpeq15A";
_armaLaserLlanternaSN = "rhsusf_acc_anpeq15side";

_armaMira = "rhsusf_acc_ACOG";
_armaMiraAR = "rhsusf_acc_ELCAN";
_armaMiraDM = "rhsusf_acc_LEUPOLDMK4";
_armaMiraSN = "rhsusf_acc_LEUPOLDMK4_2";

_armaLlencadorRF = "rhs_weap_M136_hedp";
_armaLlencadorAT = "rhs_weap_fgm148";
_armaLlencadorAA = "rhs_weap_fim92";

_pistola = "hgun_P07_F";

_gps = "ItemGPS";
_rellotge = "ItemWatch";
_mapa = "ItemMap";
_brujola = "ItemCompass";
_radio = "ItemRadio";
_terminalUAV = "B_UavTerminal";

// Treure tota l'equipació que porta la unitat en el cas que sigui infanteria
if (_esInfanteria) then {
	removeAllWeapons _unitat;
	removeAllAssignedItems _unitat;
	clearAllItemsFromBackpack _unitat;
	removeAllContainers _unitat;
	removeHeadgear _unitat;
	
	_unitat forceaddUniform _uniforme;
	_unitat addHeadgear _casc;
	_unitat addGoggles _ulleres;
	
	// Arma secundària
	_unitat addWeapon _pistola;
	
	// Afegir objectes comuns
	_unitat linkItem _mapa;
	_unitat linkItem _rellotge;
	_unitat linkItem _brujola;
	//_unitat linkItem _gps;
	_unitat linkItem _radio;
};

// Configurar l'equip per cada unitat
switch (_tipusUnitat) do
{
	// Cap de secció (Platoon leader)
	case "pl":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaSQ;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma320;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;

		// Objectes
		_unitat linkItem _gps;
		
		// Objectes a l'uniforme
		
		// Objectes a l'armilla
		(vestContainer _unitat) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
		(vestContainer _unitat) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
		
		// Objectes a la motxilla
	};
	
	// Sergent (Platoon Sergeant)
	case "psg":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaSQ;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma320;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Radio Operador (Platoon Radiotelephone Operator)
	case "rto":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Observador avançat (Forward Observer)
	case "fo":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
		
		// Objectes
		_unitat linkItem _terminalUAV;
	};
	
	// Metge (Platoon Medic)
	case "me":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaME;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};

	// Líder d'Esquadra (Squad Leader)
	case "sl":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaSQ;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma320;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Líder d'Equip (Team leader)
	case "tl":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaTL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma320;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Fuseller (Rifleman)
	case "rfl":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;	
	};
	
	case "rflat":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
		
		// Llençador AT4
		_unitat addWeapon _armaLlencadorAT4;	
	};
	
	// Granader (Grenadier)
	case "gr":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaGR;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma320;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Fuseller automàtic (Automatic Rifleman)
	case "ar":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaSAW;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _armaAR;
		_unitat addPrimaryWeaponItem _armaLaserLlanternaAR;
		_unitat addPrimaryWeaponItem _armaMiraAR;
	};
	
	// Tirador designat (Designated Marksman)
	case "dm":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		// Missing muzzle attachment
		_unitat addWeapon _armaDM;
		_unitat addPrimaryWeaponItem _armaLaserLlanternaSN;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	
	// Metrallador (Machine Gunner)
	case "mg":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaSAW;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _armaMG;
		_unitat addPrimaryWeaponItem _armaMiraAR;
	};
	
	// Assitent de metrallador (Assitant Machine Gunner)
	case "amg":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Antitanc (Antitank)
	case "at":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
		
		// Javelin
		_unitat addWeapon _armaLlencadorAT;
	};
	
	// Assistent d'antitanc (Ammo handler)
	case "aat":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Anti aèri (Anti Air gunner)
	case "aa":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
		
		// Stinger
		_unitat addWeapon _armaLlencadorAA;
	};
	
	// Assistent d'anti aèri (Anti Air Assitant)
	case "aaa":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Enginyer (Engineer)
	case "en":
	{
		// Uniforme, casc, armilla i motxila
		_unitat addVest _armillaRFL;
		_unitat addBackpack _motxilla;
		
		// Arma principal
		_unitat addWeapon _arma;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
	};
	
	// Franctirador (Sniper)
	case "sn":
	{
		// Uniforme i armilla
		removeUniform _unitat;
		_unitat forceAddUniform _uniformeSN;
		_unitat addVest _armillaRFL;
		
		// Arma principal
		_unitat addWeapon _armaSN;
		_unitat addPrimaryWeaponItem _armaLaserLlanternaSN;
		_unitat addPrimaryWeaponItem _armaMiraSN;

	};
	
	// Observador (Spotter)
	case "sp":
	{
		// Uniforme i armilla
		removeUniform _unitat;
		_unitat forceAddUniform _uniformeSN;
		_unitat addVest _armillaRFL;
		
		_unitat addWeapon _arma320;
		_unitat addPrimaryWeaponItem _armaSurefire;
		_unitat addPrimaryWeaponItem _armaLaserLlanterna;
		_unitat addPrimaryWeaponItem _armaMira;
		
		// Vector IV
		
		// Objectes
		_unitat linkItem _gps;
	};
};

// Insiginia de la unitat
[_unitat,"PATCH_CC_CC"] call bis_fnc_setUnitInsignia;