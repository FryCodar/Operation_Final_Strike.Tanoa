If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_resp_pos","_force_calc","_script","_triggername","_veh"];
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
            
         };
};
