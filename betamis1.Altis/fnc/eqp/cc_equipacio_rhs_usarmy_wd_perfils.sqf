//=======================================================================================================//
// Arxiu: cc_equipacio_rhs_usarmy_wd_perfils.sqf                                                         //
// Autor: CC_Magnetar                                                                                    //
// Versió: 0.1                                                                                           //
// Creació del Document: 02/04/2015                                                                      //
// Descripció: Aquest document serveix per equipar els jugadors amb els perfils estàndard del grup dels  //
//             Cavallers del Cel. Requereix que el jugador formi part de la facció RHS: United States    //
//             Army "rhs_faction_usarmy_wd" (http://doc.rhsmods.org/index.php/United_States_Army)        //
//             Cal afegir la següent línia al INIT de la unitat en l'editor:                             //
//                                                                                                       //
//                  ["ROL_JUGADOR",this] call cc_fnc_configEquipacio;                                    //
//                                                                                                       //
//             on "ROL_JUGADOR" és una de les següents entrades:                                         //
//                                                                                                       //
//                  ROL_JUGADOR         PERFIL associat                                                  //
//                  lideresquadra       CC - Lider d'esquadra M4A1+M320 OCP                              //
//                  liderequip          CC - Lider d'equip M4A1+M320 OCP                                 //
//                  fuseller            CC - Fuseller M4A1 OCP                                           //
//                  granader            CC - Granader M4A1+M320 OCP                                      //
//                  fusellerautomatic   CC - FA M249 OCP                                                 //
//                  metrallador         CC - Metrallador M240B OCP                                       //
//                  antitanc            CC - AT M4A1+AT4 OCP                                             //
//                  tirador             CC - Tirador SR-25EC OCP                                         //
//                  metge               CC - Metge M4A1 OCP                                              //
//                  explosius           CC - Explosius M4A1 OCP                                          //
//                  franctirador        CC - Franctirador M2010ESR OCP                                   //
//=======================================================================================================//

_tipusUnitat = _this select 0;
_unitat = _this select 1;

// Configurar l'equip per cada unitat
switch (_tipusUnitat) do
{
	// Líder d'Esquadra
	case "lideresquadra":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Lider d'esquadra M4A1+M320 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Líder d'Equip
	case "liderequip":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Lider d'equip M4A1+M320 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Fuseller
	case "fuseller":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Fuseller M4A1 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Granader
	case "granader":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Granader M4A1+M320 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Fuseller automàtic
	case "fusellerautomatic":
	{
		_loadout = [_unitat,[profileNamespace,"CC - FA M249 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Metrallador
	case "metrallador":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Metrallador M240B OC"]] call BIS_fnc_loadInventory;
	};
	
	// Antitanc
	case "antitanc":
	{
		_loadout = [_unitat,[profileNamespace,"CC - AT M4A1+AT4 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Tirador
	case "tirador":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Tirador SR-25EC OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Metge
	case "metge":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Metge M4A1 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Explosius
	case "explosius":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Explosius M4A1 OCP"]] call BIS_fnc_loadInventory;
	};
	
	// Franctirador
	case "franctirador":
	{
		_loadout = [_unitat,[profileNamespace,"CC - Franctirador M2010ESR OCP"]] call BIS_fnc_loadInventory;
	};
};

//============================================ FI DEL FITXER ============================================//