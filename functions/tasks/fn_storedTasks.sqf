If(!hasInterface)exitWith{};
#include "msot_components.hpp"
private ["_chk_state","_task_arr","_task_name","_task_Type","_task_description_long","_task_description_forHUD","_task_priority"];
params ["_idx","_state",["_target",objNull],["_added_txt",""]];

  _chk_state = toUpper(_state);_task_arr = [];_task_name = "";_task_Type = "";_task_description_long = "";_task_description_forHUD = "";
  _task_priority = 2;

switch(_idx)do
{
  case 0:{
            _task_name = "Task01";

            _task_description_long = "Ein neuer Einsatz wartet auf Sie! Treffen Sie sich vor der Barracke mit den anderen Teammitgliedern und begeben Sie sich zu den Hangars auf dem Flugfeld! Treffen Sie sich dort mit dem Colonel! Von ihm erhalten Sie weitere Instruktionen!";

            _task_description_forHUD = "Einsatzbesprechung";

            _task_Type  = "meet";

         };
   case 1:{
            _task_name = "Task02";

            _task_description_long = "Hallo das";

            _task_description_forHUD = "Hallo";

            _task_Type  = "target";
          };
   case 2:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "";
          };
   case 3:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "T";

            _task_Type  = "kill";
          };
   case 4:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "destroy";
          };
   case 5:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "boat";
          };
   case 6:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "attack";
          };
   case 7:{
            _task_name = "Task08";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "";
          };
   case 8:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "move";
          };
   case 9:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "";
          };
  case 10:{
            _task_name = "";

            _task_description_long = "";

            _task_description_forHUD = "";

            _task_Type  = "getout ";
          };
};

if(count (missionNamespace getVariable [STRVAR_DO(missions_stored_tasks),[]]) > 0)then{_task_priority = 1;};

switch(typeName _target)do
{
  case "OBJECT":{_task_arr = [player,[_task_name],[_task_description_long,_task_description_forHUD,""],_target,_chk_state,_task_priority,true,_task_Type];};
  case "ARRAY":{_task_arr = [player,[_task_name],[_task_description_long,_task_description_forHUD,""],_target,_chk_state,_task_priority,true,_task_Type];};
  default {
            hint format ["FEHLER IN TASK AUFRUF: TASK_MARK_POS_OBJ - VARIABLE >>> %1",(typeName _target)];
            diag_log format ["FEHLER IN TASK AUFRUF: TASK_MARK_POS_OBJ - VARIABLE >>> %1",(typeName _target)];
          };
};

If(count _task_arr > 0)then
{
  _task_arr call BIS_fnc_taskCreate;
};
