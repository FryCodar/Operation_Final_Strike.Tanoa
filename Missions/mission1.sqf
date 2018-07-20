If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_script","_triggername"];
params ["_idx"];

_main_pos = [2210.77,13445.6,0.0440073];
_main_radius = 10;
sleep 10;
switch(_idx)do
{
  case 1:{
            [0,"AUTOASSIGNED",[2210.77,13445.6,0.0440073]] call MFUNC(tasks,setTask);

            _script = {[2] execVM "Missions\mission1.sqf";};
            _triggername = ["ACTIVATE",_main_pos,_main_radius] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",_main_pos,[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);
         };
  case 2:{
            [0,"SUCCEEDED"] call MFUNC(tasks,setTask);
            [1] call MFUNC(briefing,sendNewDiary);
            "Neues Lageupdate!" remoteExec ["hint",([0,-2] select isDedicated)];

         };
};
