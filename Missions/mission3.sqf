If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_resp_pos","_force_calc","_script","_triggername"];
params ["_idx"];


_main_pos = [11931.7,10468.7,0];
_main_radius = 500;


switch(_idx)do
{
  case 1:{
            [2] call MFUNC(briefing,sendNewDiary);
            "Neues Lageupdate!" remoteExec ["hint",([0,-2] select isDedicated)];
            MSOT_MISSION_MARKER = [_main_pos,"Tagebau","ICON",[1,1],"ColorRed","o_installation","",0,"Tagebau RED SPRING"] call MFUNC(usage,setMapMarker);
         };
  case 2:{
            [4,"AUTOASSIGNED",_main_pos] call MFUNC(tasks,setTask);

         };
};
