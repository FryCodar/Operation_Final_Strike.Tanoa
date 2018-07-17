If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_usage_fnc_deleteAllInArea

Description: Creates an Diary Record to Player

Parameters: [POSITION,RADIUS]

            POSITION    -   ARRAY with Coordinates
            RADIUS      -   RADIUS arround the POSITION

Returns: Nothing

Examples:
            [(getMarkerPos "Town"),200] call MSOT_usage_fnc_deleteAllInArea

Author: Fry

----------------------------------------------------------------------------------------------------------------- */

params ["_pos","_radius"];

private _simpleObjects = (allSimpleObject []) select {(_x distance _pos) >= _radius};
If(count _simpleObjects > 0)then
{
  {deleteVehicle _x}forEach (nearestObjects [_pos, ["all"],_radius]) + _simpleObjects;
}else{{deleteVehicle _x}forEach (nearestObjects [_pos, ["all"],_radius]);};
