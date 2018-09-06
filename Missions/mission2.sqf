If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_base1","_b1_radius","_base2","_b2_radius","_resp_pos","_force_calc","_script","_triggername","_car_num","_targets","_m_name"];
params ["_idx"];

_main_pos = [10547.4,11627.6,0];
_main_radius = 700;
_base1 = [10034.2,11780.8,0];
_b1_radius = 100;
_base2 = [11042,11484.8,0];
_b2_radius = 150;


switch(_idx)do
{
  case 1:{
           [2,"AUTOASSIGNED",[10547.4,11627.6,0]] call MFUNC(tasks,setTask);
           sleep 6;
           [3,"AUTOASSIGNED",[11042,11484.8,0]] call MFUNC(tasks,setTask);

           _force_calc = [([] call MFUNC(system,getPlayerCount)),([] call MFUNC(usage,checkNight))] call MFUNC(system,getForcesCalc);
           _car_num = If((_force_calc select 2) < 1)then{2}else{(_force_calc select 2)};
           [[_main_pos,_base1],_b1_radius,(_car_num + 1), "CAR","AREA",true] call MFUNC(creating,setVehicles);
           [[_main_pos,_base1],_b1_radius,((_force_calc select 0) + 1),(_force_calc select 1),"MIXED_ALL","MIXED"] call MFUNC(creating,setUnits);
           [[_main_pos,_base2],_b2_radius,(_car_num + 1), "CAR","AREA",true] call MFUNC(creating,setVehicles);
           [[_main_pos,_base2],_b2_radius,((_force_calc select 0) + 1),(_force_calc select 1),"MIXED_ALL","MIXED"] call MFUNC(creating,setUnits);
           _targets = [_main_pos,["Land_Radar_F","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Land_Radar_Small_F"],_main_radius,true] call MFUNC(spawnhelp,checkObjects);
           If(count _targets > 0)then
           {
             {
               _x addEventHandler ["Explosion",{If(damage (_this select 0) > 0.9)then{["MAINTARGETS",(_this select 0),"SUCCESS"] spawn MSOT_system_fnc_eventHandling;};}];
               _m_name = [(position _x),(format["%1_%2",_x,_forEachIndex]),"ICON",[1,1],"ColorOrange","hd_destroy"] call MSOT_usage_fnc_setMapMarker;
               _script = {"Ziel gesprengt!" remoteExec ["hint",([0,-2] select isDedicated)];};
               ["MAINTARGETS",_main_pos,[_x,_m_name,_script]] call MSOT_system_fnc_addMissionInfos;
             }forEach _targets;
           };
           _script = {[2] execVM "Missions\mission2.sqf";};
           ["MAINMARKER",_main_pos,["",_script]] call MSOT_system_fnc_addMissionInfos;
           //Dokumente finden
           _script = {"Sie haben die Code-List Nr.2 gefunden!" remoteExec ["hint",([0,-2] select isDedicated)];};
           ["MAINTARGETS",_base2,[Code02,"Markername",_script]] spawn MSOT_system_fnc_addMissionInfos;
           _script = {"Sie haben die Code-List Nr.1 gefunden!" remoteExec ["hint",([0,-2] select isDedicated)];};
           ["MAINTARGETS",_base2,[Code01,"Markername",_script]] spawn MSOT_system_fnc_addMissionInfos;
           _script = {[3] execVM "Missions\mission2.sqf";};
           ["MAINMARKER",_base2,["",_script]] call MSOT_system_fnc_addMissionInfos;

           {
             ["MAINACTIONS",[_x,"SUCCESS","Skripte\Collect1.sqf","true",true]] call MSOT_system_fnc_addMissionInfos;
             ["ACTIONSTORAGE",[_x,"ACTION","LYELLOW","Dokumente nehmen"]] spawn MSOT_system_fnc_addMissionInfos;
           }forEach [Code01,Code02];

           _script = {[(_this select 1)] call MFUNC(system,setTargetBehavior);sleep 1;};
           _triggername = ["DETECTED",_main_pos,900] call MFUNC(system,setTrigger);
           ["MAINTRIGGER",_main_pos,[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);

           _resp_pos = [_base1,(_b1_radius + 100),20,true] call MFUNC(geometry,getSafePos);
           If(count _resp_pos > 0)then
           {
             ["RESPAWNPOSES",_main_pos,_resp_pos] spawn MFUNC(system,addMissionInfos);
           }else{
                  ["RESPAWNPOSES",_main_pos,[9728.26,12262.1,0.00128174]] spawn MFUNC(system,addMissionInfos);
                };
         };
  case 2:{
            [2,"SUCCEEDED"] call MFUNC(tasks,setTask);
            missionNamespace setVariable[STRVAR_DO(mission2_compl),true,false];
            sleep 6;
            [4] execVM "Missions\mission2.sqf";
         };
  case 3:{
            [3,"SUCCEEDED"] call MFUNC(tasks,setTask);
            missionNamespace setVariable[STRVAR_DO(mission2_1_compl),true,false];
            sleep 6;
            [4] execVM "Missions\mission2.sqf";
         };
  case 4:{
            If((missionNamespace getVariable [STRVAR_DO(mission2_compl),false]) && (missionNamespace getVariable [STRVAR_DO(mission2_1_compl),false]))then
            {
              _script = {
                         [(_this select 1)] call MFUNC(system,delFromSystem);
                         [[10547.4,11627.6,0],700] call MFUNC(usage,deleteAllInArea);
                         ["RESPAWNPOSES",[10547.4,11627.6,0]] spawn MFUNC(system,doMissionCheck);
                        };
              _triggername = ["LEAVE",_main_pos,900] call MFUNC(system,setTrigger);
              ["MAINTRIGGER",_main_pos,[_triggername,_script,0,true]] call MFUNC(system,addMissionInfos);
              sleep 6;
              [2] execVM "Missions\mission3.sqf";
            };
         };

};
