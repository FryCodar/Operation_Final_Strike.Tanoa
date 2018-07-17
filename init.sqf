#include "msot_components.hpp"
//this in every Mission
//**************************************************************************************************************************************************
waitUntil{!isNil "bis_fnc_init"};
DEBUG_MODE = ((["debug_modus",1] call BIS_fnc_getParamValue) isEqualTo 0);
FRY_INIT = false;

If(!hasInterface)then{FRY_INIT = true;}else{If(isNull player)then{[] spawn {waitUntil {!isNull player && player == player}; FRY_INIT = true;};}else{FRY_INIT = true;};};
waitUntil {FRY_INIT};

diag_log "INIT BEGINNT";

enableSentences false;
//***************************************************************************************************************************************************
If(isServer)then
{
  //[[Ar1,Ar2,Ar3,Ar4,Ar5,Ar6],230] call MFUNC(usage,addRespawnVecs);
 // [Ar1,Ar2,Ar3,Ar4,Ar5,Ar6,Ar7,Ar8,Ar9,Ar10] call MFUNC(dlg,addArtilleryUnits);
 // missionNameSpace setVariable [STRVAR_DO(available_artillery),true,true];
   execVM "Engima\enigma_init.sqf";
};
If(hasInterface)then
{
	setViewDistance 5000;
	player disableConversation true;
};

enableSaving [ false, false ];


init_run = true;
diag_log format ["INIT IST DURCHGELAUFEN: %1",init_run];
