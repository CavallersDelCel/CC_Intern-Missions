_tipusUnitat = toLower (_this select 0);
_unitat = _this select 1;

removeAllWeapons _unitat;
removeAllItemsWithMagazines _unitat;
removeAllAssignedItems _unitat;
removeBackpack _unitat;
removeAllContainers _unitat;

switch (_tipusUnitat) do
{

// ====================================================================================

// LOADOUT: COMMANDER
	case "co":
	{
		_unitat addweapon _glrifle;					//_COrifle
	};
};