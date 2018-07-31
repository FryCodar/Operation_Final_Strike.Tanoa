If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_base1","_b1_radius","_base2","_b2_radius","_resp_pos","_force_calc","_script","_triggername","_car_num","_targets","_m_name"];
params ["_idx"];


_main_pos = [11931.7,10468.7,0];
_main_radius = 500;


switch(_idx)do
{
  case 1:{
            [2] call MFUNC(briefing,sendNewDiary);
            "Neues Lageupdate!" remoteExec ["hint",([0,-2] select isDedicated)];
            MSOT_MISSION_MARKER = []
            _marker = createMarker ["Tagebau", position Tagebau01];
          	"Tagebau" setMarkerColor "ColorRed";
          	"Tagebau" setMarkerType "o_installation";
          	"Tagebau" setMarkerText "Tagebau RED SPRING";
         };
};
