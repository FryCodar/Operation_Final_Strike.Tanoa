If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_script","_triggername"];
params ["_idx"];

_main_pos = [2210.77,13445.6,0.0440073];
_main_radius = 40;
sleep 10;
switch(_idx)do
{
  case 1:{
            [0,"AUTOASSIGNED",[2210.77,13445.6,0.0440073]] call MFUNC(tasks,setTask);

            _script = {[2] execVM "Missions\mission1.sqf";};
            _triggername = ["ACTIVATE",_main_pos,_main_radius] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",_main_pos,[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);

            _script = {[3] execVM "Missions\mission1.sqf";};
            ["MAINTARGETS",_main_pos,[TACTAB,"",_script]] call MFUNC(system,addMissionInfos);
            ["MAINACTIONS",[TACTAB,"SUCCESS","Skripte\addTabletFunc.sqf","true",true]] call MSOT_system_fnc_addMissionInfos;
            ["ACTIONSTORAGE",[TACTAB,"ACTION","GREEN","Tablet nehmen"]] spawn MSOT_system_fnc_addMissionInfos;
         };
  case 2:{
            [0,"SUCCEEDED"] call MFUNC(tasks,setTask);
            [1] call MFUNC(briefing,sendNewDiary);
            "Neues Lageupdate!" remoteExec ["hint",([0,-2] select isDedicated)];
            sleep 5;
            [1,"AUTOASSIGNED",TACTAB] call MFUNC(tasks,setTask);

         };
  case 3:{
            [1,"SUCCEEDED"] call MFUNC(tasks,setTask);
            sleep 6;
            [1] execVM "Missions\mission2.sqf";
            _script = {[1] execVM "Missions\mission3.sqf";};
            _triggername = ["LEAVE",_main_pos,300] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",_main_pos,[_triggername,_script,0,true]] call MFUNC(system,addMissionInfos);
         };
};
