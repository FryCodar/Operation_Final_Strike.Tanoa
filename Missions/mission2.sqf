If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_base1","_b1_radius","_base2","_b2_radius","_force_calc","_script","_triggername","_car_num"];
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
           [[_main_pos,_base1],_b1_radius,((_force_calc select 0) + 2),(_force_calc select 1),"MIXED_ALL","MIXED"] call MFUNC(creating,setUnits);

         };
  case 2:{

         };

};
