If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_creating_fnc_setDistanceCrew

Description: Creates Crew Members for Vehicles in a defined Distance.

              SERVER/HEADLESS CLIENT

Parameters: [POSITION,VEHICLE,INHOUSEPOS,BEHAVIORMODE,COMBATMODE]

            POSITION  - Position for creating the Vehicle Crew

            VEHICLE   - Name of the Vehicle who the Crew is created for

            (INHOUSEPOS) - Optional: BOOL default is true

            (BEHAVIORMODE) - Optional: default "COMBAT"

            (COMBATMODE)   - Optional : default "RED"

Returns: [ARRAY with Name of created Group]

Examples:
            _isStored = [(getMarkerPos "Tankcrew"),Tank1] spawn MSOT_creating_fnc_setUnits;

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_output","_crew_type","_crew_info","_in_crew","_sel_crew","_grp","_unit"];
params ["_pos","_vec_name",["_inhousepos",true],["_behaviour_idx","COMBAT"],["_combat_idx","RED"]];

_output = [];

If(count _pos > 0 && {(typeName _vec_name) isEqualTo "OBJECT"})then
{
  _crew_type = getText(configFile >> "CfgVehicles" >> (typeOf _vec_name) >> "crew");
  _crew_info = [];
  {
    _in_crew = fullCrew [_vec_name, _x, true]; hint str _in_crew;
    If(count _in_crew > 0)then{_sel_crew = (_in_crew select 0);_crew_info pushBack [(toUpper _x),(_sel_crew select 3)];};
  }forEach["driver", "commander", "gunner", "turret"];
  If(count _crew_info > 0)then
  {
    _grp = CREA_GROUP(MSOT_ENEMY_SIDE);
    {
      _unit = _grp createUnit [_crew_type, _pos, [], 0, "FORM"];
      If(_inhousepos)then{SET_POSATL(_unit,_pos,0.01);};
      switch(_x select 0)do
      {
        case "DRIVER":{_unit assignAsDriver _vec_name;[_unit] orderGetIn true;};
        case "COMMANDER":{_unit assignAsCommander _vec_name,[_unit] orderGetIn true;};
        case "GUNNER":{_unit assignAsGunner _vec_name;[_unit] orderGetIn true;};
        case "TURRET":{_unit assignAsTurret [_vec_name,(_x select 1)];[_unit] orderGetIn true;};
      };
    }forEach _crew_info;
    [_grp] call MFUNC(system,setUnitSkill);
    ARR_ADDVAR(_output,_grp);
  };
};
_output
