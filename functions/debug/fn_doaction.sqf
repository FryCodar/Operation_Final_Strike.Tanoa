if(!hasInterface) exitwith {};
#include "msot_components.hpp"

params ["_obj","_caller","_idx","_xtra"];


  switch(_xtra)do
  {
   case 0:{
            _this call MFUNC(usage,fastTravel);
   	      };
   case 1:{
            private _pos = (position _caller);
            private _posatl = (getPosATL _caller);
            private _posasl = (getPosASL _caller);
            private _dir = (getDir _caller);
            hint format ["SPIELER DATEN:\n\nPOSITION: %1\nPOSITION_ATL: %2\nPOSITION_ASL: %3\nDIR: %4",_pos,_posatl,_posasl,_dir];
  		      diag_log format ["SPIELER DATEN:____POSITION: %1 ____POSITION_ATL: %2 ____POSITION_ASL: %3 ____DIR: %4",_pos,_posatl,_posasl,_dir];
            copyToClipboard format ["[SPIELER DATEN: >>> POSITION_NORMAL: %1 <<<_>>> POSITION_ATL: %2 <<<_>>> POSITION_ASL: %3 <<<_>>> DIR: %4 <<<]",_pos,_posatl,_posasl,_dir];
          };
   case 2:{
            // ERSTER TESTBEREICH
            hint "Script 1 begins";
            //_____________________________________________________________________________________________________________________________
            /*
            _ghrp = CREA_GROUP(MSOT_ENEMY_SIDE);
            _vechh = [(position Tr21),(random 360),"O_T_Boat_Armed_01_hmg_F",_ghrp] call BFUNC(spawnVehicle);
            [(_vechh select 2),(position Tr21),100] call BFUNC(taskPatrol);

            "Land_Radar_F"
            "Land_TTowerBig_2_F"
            "Land_TTowerBig_1_F"
            "Land_Radar_Small_F"
            */
            //[1] execVM "Missions\mission2.sqf";
            _targets = [[10034.2,11780.8,0],["Land_Radar_F","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Land_Radar_Small_F"],100,true] call MFUNC(spawnhelp,checkObjects);
            If(count _targets > 0)then
            {
              {
                _x addEventHandler ["Explosion",{If(damage (_this select 0) > 0.9)then{["MAINTARGETS",(_this select 0),"SUCCESS"] spawn MSOT_system_fnc_eventHandling;};}];
                _m_name = [(position _x),(format["%1_%2",_x,_forEachIndex]),"ICON",[1,1],"ColorRed","hd_destroy"] call MSOT_usage_fnc_setMapMarker;
                ["MAINTARGETS",[10034.2,11780.8,0],[_x,_m_name,{hint "Turm gesprengt";}]] call MSOT_system_fnc_addMissionInfos;
              }forEach _targets;
            };
            _script = {Hint "alle Ziele erfüllt";};
            ["MAINMARKER",[10034.2,11780.8,0],["",_script]] spawn MSOT_system_fnc_addMissionInfos;
          };
   case 3:{
            //ZWEITER TESTBEREICH
            hint "Script 2 begins";
            //______________________________________________________________________________________________________________________________
            copyToClipboard str [(getPos TR21),(getPos TR22)];

          };
   case 4:{
            If(captive player)then
            {
              player setCaptive false;
              hint format ["Friendly: %1",(captive player)];
            }else{
                  player setCaptive true;
                  hint format ["Friendly: %1",(captive player)];
                };
  		    };

  };

/*
IDSEH = player addEventHandler ["InventoryOpened",{[[0],"Missions\mission_1.sqf"] remoteExec ["execVM", 0]; player removeEventHandler ["InventoryOpened",IDSEH];}];
PFEIL Blau = "Sign_Arrow_Blue_F"
              Sign_Arrow_F
moves = ["aidlpsitmstpsnonwnondnon_ground00"];

rosa = #ff45f0
gelb = #dddd00
hellblau = #f000ffff
grün = #f000ff00
rot = #ff1221
	#f00dffff
[Terminal,0] call BIS_fnc_dataTerminalAnimate; Terminal aufklappen 0 = zu 3 = auf
*/
