/******         Database, Database, just living in the Database...       ******/
MPS_spawn_BDINIT = [] spawn {
  [] call ZONT_fnc_bd_initBasic;
  MPS_BDL_pres =
      ["profiles"] call ZONT_fnc_bd_initCustom;
  MPS_BDL_status =
      ["status"] call ZONT_fnc_bd_initCustom;
      MPS_BDL_lockers =
    ["lockers"] call ZONT_fnc_bd_initCustom;
};

MPH_COMMITER = [{ [] call ZONT_fnc_commitInfo }, 20] call CBA_fnc_addPerFrameHandler;

/******                               ???                                ******/
private _fortif_list = [
	["836th_flag",10],
	["land_Aquila",25],
	["Land_PortableLight_double_F",10],
	["Land_fort_rampat",20],
	["Land_BagFence_Long_F",15],
	["Land_BagFence_Short_F",15],
	["Land_BagFence_Round_F",15],
	["Land_Plank_01_4m_F",10],
	["Land_BagBunker_Small_F",25],
	["Land_BagBunker_Large_F",50],
	["land_TIOW_adl_single",15],
	["land_TIOW_adl_double",20],
	["TIOW_Dragons_teeth_multiple",25],
	["RF_Bunker",65],
	["Land_Bunker_01_small_F",50],
	["Land_Bunker_01_big_F",100],
	["Land_PillboxBunker_01_big_F",100],
	["land_TIOW_Bastion_green",120]

];
[west,       15000, _fortif_list] call acex_fortify_fnc_registerObjects;
[east,       15000, _fortif_list] call acex_fortify_fnc_registerObjects;
[resistance, 15000, _fortif_list] call acex_fortify_fnc_registerObjects;
