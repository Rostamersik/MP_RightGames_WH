waitUntil {vehicle player == player};

[] spawn ZONT_fnc_loadProfile;
[] spawn ZONT_fnc_autoSaveInit;

[] spawn ZONT_fnc_initTeleportTerminals;

[] spawn ZONT_fnc_addReverse;

[] execVM "chatCommands.sqf";

[] execVM "initPlayerAfterRespawn.sqf";

/*** Custom Scripts ***/

//[] execVM "external\scripts\autoheal_list.sqf"; //Автохил космарей и мехов
[] execVM "external\scripts\introtext.sqf"; //Вступительный текст
[] execVM "external\scripts\medic.sqf";  //Инит пульсометра


/******                            Zeus list                             ******/
/* MCH_ZEUS_LIST = [{
  if (isnull (finddisplay 312)) exitWith {};
  mpc_cc_name = format ["%1 (%2)", name player, getPlayerUID player];
  if (isNil 'mpv_current_curators') then {mpv_current_curators = []};

  if (!(mpc_cc_name in mpv_current_curators)) then {
      mpv_current_curators pushBack mpc_cc_name;
      publicVariable 'mpv_current_curators';
      (finddisplay 312) displayAddEventHandler ["Unload", {
          mpv_current_curators deleteAt (mpv_current_curators find mpc_cc_name);
          publicVariable 'mpv_current_curators';
          hintSilent "";
      }];
  };
  private _str = "<t color='#00FF00'>Активные зевсы:</t>";
  { _str = format ["%1<br/>%2", _str, _x]; } forEach mpv_current_curators;
  hintSilent parseText _str;
}, 1] call CBA_fnc_addPerFrameHandler; */


private _fn_checkSlotPermission = {
  waituntil { sleep 0.1; !isNil 'ZPR_roles' };
  if not ([[],[],_this] call ZONT_fnc_checkRole) then {
    ["absrole"] call ZONT_fnc_forceExit;
  };
};

private _var = [];
private _varg = group player getVariable ["ZPR_rr", ""];
private _vars =       player getVariable ["ZPR_rr", ""];
if (_varg != "") then { _var pushBack _varg };
if (_vars != "") then { _var pushBack _vars };
if (count _var > 0) then {
  _var spawn _fn_checkSlotPermission;
};


private _fn_moveToCustomSpawn = {
  params ['_player','_fn_moveToSpawn'];
  waituntil { sleep 0.1; !isNil 'ZPR_roles' };
  if ([["Mechanicus"]] call ZONT_fnc_checkRole)
  exitWith { [_player, true, 'MP_spawn_mec'] call _fn_moveToSpawn };
  if ([["Astartes"]] call ZONT_fnc_checkRole)
  exitWith { [_player, true, 'MP_spawn_sm'] call _fn_moveToSpawn };
  if ([["Inqusition"]] call ZONT_fnc_checkRole)
  exitWith { [_player, true, 'MP_spawn_inq'] call _fn_moveToSpawn };
};

private _fn_moveToSpawn = {
  params ["_player", "_cg", '_spawnName'];
  private _side = side _player;
  private _spawn = objnull;

  if (isNil '_spawnName') then {
    if (_side == east)       then { _spawn = MP_spawn_east };
    if (_side == west)       then { _spawn = MP_spawn_west };
    if (_side == resistance) then { _spawn = MP_spawn_guer };
    if (_side == civilian)   then { _spawn = MP_spawn_civ };
  } else {
    _spawn = missionNamespace getVariable _spawnName;
  };

  if (!isNil '_spawn') then {
    _player setPosATL getPosATL _spawn;
    _player setDir getDir _spawn;
  };

  if (_cg) then {
    private _g = createGroup _side;
    [_player] joinSilent _g;
    _g deleteGroupWhenEmpty true;
  };
};


[player, false] call _fn_moveToSpawn;
[player, _fn_moveToSpawn] spawn _fn_moveToCustomSpawn;


[] spawn {
  waitUntil {
  	{
  		if (
        agent _x isKindOf "Rabbit_F" ||
        agent _x isKindOf "Snake_random_F" ||
        agent _x isKindOf "Servo_skull"
      ) then {
  			deleteVehicle agent _x;
  		};
  	} forEach agents;

  	sleep 0.01; false;
  };
};
