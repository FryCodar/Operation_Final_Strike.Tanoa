If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_resp_pos","_force_calc","_script","_triggername","_veh","_car_num","_m_name"];
params ["_idx"];


_main_pos = [11931.7,10468.7,0];
_main_radius = 500;


switch(_idx)do
{
  case 1:{
            [2] call MFUNC(briefing,sendNewDiary);
            "Neues Lageupdate!" remoteExec ["hint",([0,-2] select isDedicated)];
            MSOT_MISSION_MARKER = [_main_pos,"Tagebau","ICON",[1,1],"ColorRed","o_installation","",0,"Tagebau RED SPRING"] call MFUNC(usage,setMapMarker);
            [[11405.2,10615.7,0],2500,5,"O_Plane_Fighter_02_Stealth_F"] spawn MFUNC(creating,setAirForce);
         };
  case 2:{
            //[4,"AUTOASSIGNED",_main_pos] call MFUNC(tasks,setTask);

            private _vec_types = ["O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F"];
            private _helipads = [_main_pos,["Land_HelipadCircle_F"],500] call MFUNC(spawnhelp,checkObjects);
            If(count _helipads > 0)then
            {
              MSOT_COMBAT_HELIS = [];
              private _hel_chk = _helipads call BFUNC(arrayShuffle);
              F_LOOP(_i,0,4)
              {
                private _sel_hel = (_hel_chk select _i);
                _veh = createVehicle [(selectRandom _vec_types),(position _sel_hel), [], 0, "NONE"];
                _veh setDir (getDir _sel_hel);
                ARR_ADDVAR(MSOT_COMBAT_HELIS,_veh);
              };
            };
            private _vec_list = [];
            private _vec_posses = [[12102.5,10600.2,0.0015564],9,4,267] call MFUNC(geometry,getNumPosLine);
            If(count _vec_posses > 0)then
            {
              {_veh = createVehicle ["O_T_Truck_03_fuel_ghex_F",_x, [], 0,"NONE"];_veh setDir 316;ARR_ADDVAR(_vec_list,_veh);}forEach _vec_posses;
            };
            _vec_posses = [[12041.7,10620.6,0.00143433],8,3,253] call MFUNC(geometry,getNumPosLine);
            If(count _vec_posses > 0)then
            {
              {_veh = createVehicle ["O_T_Truck_03_ammo_ghex_F",_x, [], 0,"NONE"];_veh setDir 132;ARR_ADDVAR(_vec_list,_veh);}forEach _vec_posses;
            };
            /*
            _vec_posses = [[12283.8,10394.5,0.00143433],9,4,217] call MFUNC(geometry,getNumPosLine);
            If(count _vec_posses > 0)then
            {
              {_veh = createVehicle ["O_T_APC_Tracked_02_cannon_ghex_F",_x, [], 0,"NONE"];_veh setDir 149;ARR_ADDVAR(_vec_list,_veh);}forEach _vec_posses;
            };
            _vec_posses = [[12285.1,10348,0.00143433],9,3,248] call MFUNC(geometry,getNumPosLine);
            If(count _vec_posses > 0)then
            {
              {_veh = createVehicle ["O_T_APC_Wheeled_02_rcws_v2_ghex_F",_x, [], 0,"NONE"];_veh setDir 335;ARR_ADDVAR(_vec_list,_veh);}forEach _vec_posses;
            };
            _vec_posses = [[12292.7,10235.3,0.00135803],11,5,15] call MFUNC(geometry,getNumPosLine);
            If(count _vec_posses > 0)then
            {
              {_veh = createVehicle ["O_T_MBT_02_cannon_ghex_F",_x, [], 0,"NONE"];_veh setDir 271;ARR_ADDVAR(_vec_list,_veh);}forEach _vec_posses;
            };
            */
            {
              [_x,"SUCCESS"] call MFUNC(system,addKilledEvent);
              //nach Test den Hint ändern
              ["MAINTARGETS",_main_pos,[_x,"",{hint "FHZ zerstört!"}]] call MSOT_system_fnc_addMissionInfos;
            }forEach _vec_list;
            /*
            _force_calc = [([] call MFUNC(system,getPlayerCount)),([] call MFUNC(usage,checkNight))] call MFUNC(system,getForcesCalc);
            _car_num = If((_force_calc select 2) < 1)then{2}else{(_force_calc select 2)};
            _veh = [_main_pos,(_main_radius - 100),(_car_num + 1), "APC_AAIR","AREA",true] call MFUNC(creating,setVehicles);
            {
              _m_name = [(position _x),(format["%1_%2",_x,_forEachIndex]),"ICON",[1,1],"ColorOrange","hd_destroy","",0,"AA Site"] call MSOT_usage_fnc_setMapMarker;
              _script = {"Eine Luftabwehr ausgeschaltet!" remoteExec ["hint",([0,-2] select isDedicated)];};
              ["MAINTARGETS",_main_pos,[_x,_m_name,_script]] call MSOT_system_fnc_addMissionInfos;
            }forEach _veh;
            _veh = [_main_pos,(_main_radius - 100),(_car_num + 1), "ARTY","AREA",true] call MFUNC(creating,setVehicles);
            {
              _m_name = [(position _x),(format["%1_%2",_x,_forEachIndex]),"ICON",[1,1],"ColorRed","hd_destroy","",0,"Artillery Site"] call MSOT_usage_fnc_setMapMarker;
              _script = {"Eine Artillerie ausgeschaltet!" remoteExec ["hint",([0,-2] select isDedicated)];};
              ["MAINTARGETS",_main_pos,[_x,_m_name,_script]] call MSOT_system_fnc_addMissionInfos;
            }forEach _veh;
            _veh = [_main_pos,_main_radius,(_car_num + 1), "CAR","AREA"] call MFUNC(creating,setVehicles);
            _veh = [_main_pos,_main_radius,(_car_num + 1), "TANK","AREA"] call MFUNC(creating,setVehicles);
            [_main_pos,_main_radius,((_force_calc select 0) + 2),(_force_calc select 1),"MIXED_ALL","AREA"] call MFUNC(creating,setUnits);
            */
         };
};
