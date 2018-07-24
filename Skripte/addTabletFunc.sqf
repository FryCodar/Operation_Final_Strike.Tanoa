If(isMultiplayer)then{If(!hasInterface)exitWith{};};
params ["_obj","_caller","_id","_arguments"];

If(isClass(configfile >> "CfgMods" >> "ace"))then
{
  private _action = ["msot_tactic_tablet","Open Tablet","",{createDialog "MSOT_Tactic_Table"},{true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

hint "Tablet aufgenommen!";
