if(isMultiplayer)then{If(!isServer)exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_briefing_fnc_sendNewDiary

Description: Send new Diary Index to CLient and save this for JIP

Parameters: [INDEX]

            INDEX         -     defined NUMBERS

Returns: Bool

Examples:
            _isStored = [2] call MSOT_briefing_fnc_sendNewDiary

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private _holder = missionNamespace getVariable [STRVAR_DO(diary_mission_records),[]];
If(count _holder > 0)then
{
  ARR_ADDARR(_holder,_this);
}else{_holder = _this};
missionNamespace setVariable [STRVAR_DO(diary_mission_records),_holder,true];
private _state = [0,-2] select isMultiplayer;
REMOTE_TRIEXESM(_this,briefing,addNewDiary,_state);
