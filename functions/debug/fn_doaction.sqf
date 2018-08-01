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
            [2] execVM "Missions\mission3.sqf";
            /*
            {_grp_arr = [(position HL12),_x] call MFUNC(creating,setDistanceCrew);
             [(_grp_arr select 0),[11931.7,10468.7,0],1000] call BFUNC(taskPatrol);
             sleep 3;
            }forEach [H12,H13];

            _chute = createVehicle ["B_Parachute_02_F", [((getPosATL player) select 0),((getPosATL player) select 1),(((getPosATL player) select 2) + 200)], [], 0, 'FLY'];
            _chute setPos [((getPosATL player) select 0),((getPosATL player) select 1),(((getPosATL player) select 2) + 200)];
            _crate = createVehicle ["B_CargoNet_01_ammo_F", position _chute, [], 0, 'NONE'];
            _crate attachTo [_chute,[0, 0, -1.3]];
            waituntil{position _crate select 2 < 1};
            detach _crate;
            //_________________________________________________________________________________________________________________________________
            "O_T_Truck_03_fuel_ghex_F" ||| POSITION_NORMAL: [12104.7,10603.8,0.00143433] DIR: 237.484 <<<]  3 x 316° XXXX
            "O_T_Truck_03_ammo_ghex_F" ||| POSITION_NORMAL: [12033,10608.6,0.00143433] DIR: 41.3431 <<<]    3 x 132° XXXX
            "O_T_APC_Tracked_02_cannon_ghex_F" ||| POSITION_NORMAL: [12283.8,10394.5,0.00143433] DIR: 229.608 <<<]  4 x 149° XXXX
            "O_T_APC_Wheeled_02_rcws_v2_ghex_F" ||| POSITION_NORMAL: [12285.1,10348,0.00143433] DIR: 248.244 <<<] 3 x 335°  XXXX
            "O_T_MBT_02_cannon_ghex_F"  ||| POSITION_NORMAL: [12312.1,10304.2,0.00157166] DIR: 187.291 <<<] 5 x 271°
            */
          };
   case 3:{
            //ZWEITER TESTBEREICH
            hint "Script 2 begins";
            //______________________________________________________________________________________________________________________________
            copyToClipboard str (getPos Tr21);

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
