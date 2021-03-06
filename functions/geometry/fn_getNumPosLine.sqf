#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_geometry_fnc_getNumPosLine

Description: Finds X positions on a line around a position with given vector.


Parameters: [Position,Distance,Number,Degrees]

            - Important: Distances under 5 meters are not allowed!

Returns:  ARRAY with Positions  (Array select 0 is in Function given Position)
Examples:
          _pos_arr = [(position HELIPAD),10,5,(round(getDir Helipad) - 90)] call MSOT_geometry_fnc_getNumPosLine;

Author: Fry

------------------------------------------------------------------------------------------------------------- */
private ["_center_x","_center_y","_x_k","_y_k","_cos_num","_sin_num","_output","_holder_arr","_allowed","_noanglecalc",
         "_add_dist","_slope","_i","_sloped_pos"];
params ["_position","_dist","_num","_dir"];

_center_x = (_position select 0);
_center_y = (_position select 1);
_x_k = 0;
_y_k = 0;
_cos_num = 0;
_sin_num = 0;
_holder_arr = [];
_output = [];
_noanglecalc = [0,90,180,270,360];
_allowed = true;
_add_dist = 0;
switch(true)do
{
  case (_dir < 0):{_dir = _dir + 360;};
  case (_dir > 360):{_dir = _dir - 360;};
};

F_LOOP(_i,1,(_num - 1))
{
  If(_allowed)then
  {
   _add_dist = _add_dist + _dist;
   If(!(_dir In _noanglecalc))then
   {
    _cos_num = (cos _dir * _add_dist);
    _sin_num = (sin _dir * _add_dist);
   };


   switch(true)do
   {
     case (_dir == 0 || _dir == 360):{_x_k = _center_x;_y_k = _center_y + _add_dist;};
     case (_dir == 90):{_x_k = _center_x + _add_dist;_y_k = _center_y;};
     case (_dir == 180):{_x_k = _center_x;_y_k = _center_y - _add_dist;};
     case (_dir == 270):{_x_k = _center_x - _add_dist;_y_k = _center_y;};
     default {_x_k = _center_x + _sin_num;_y_k = _center_y + _cos_num;};
   };
     _slope = [[_x_k,_y_k,0]] call MFUNC(spawnhelp,getSlope);
     If(!(surfaceIsWater [_x_k,_y_k]) && _slope)then
     {
      If(count _holder_arr == 0)then{ARR_ADDVAR(_holder_arr,_position);};
      _sloped_pos = [_x_k,_y_k,0];
      ARR_ADDVAR(_holder_arr,_sloped_pos);
     }else{_allowed = false;};

  };
  sleep 0.02;
};
If(_allowed)then{_output = _holder_arr;};
_output
