//	edited by [TF]def 2015 09 20 (0.4.1)
/**/
//Only display vehicles for that players side, if true Opfor can only spawn Opfor vehicles and so on.
VVS_SideOnly = false;

//Only set to true if you are making pre-made vehicle lists with VVS_x (i.e VVS_Car)
VVS_Premade_List = false;

ZONT_fnc_filterVVS = {
  switch(_this) do {
  	case "Guard": { VVS_West_IG };
  	case "Mechanicus": { VVS_West_Mech };
  	case "Astartes": { VVS_West_Astartes };
  	case "SL": { VVS_West_Salo };
	case "Navy": { VVS_West_Navy };
	case "Scion": { VVS_West_Scion };

  	default {[]};
  };
};

ZONT_fnc_onSpawnVVS = {
  // params ["_mode", "_vehicle"];
  switch(_this) do {
  	case "TV": { {
      _vehicle setVehicleAmmo 0;
      _vehicle setFuel 0
    } };

  	default {nil};
  };
};


VVS_West_Mech = [
"Mars_annihilator",
"Mars_Conqueror",
"Mars_Executioneer",
"Mars_Exterminator",
"AM_Chimerro",
"AM_Hellhound",
"O_ScorpiusDisintegrator",
"O_ScorpiusDisintegrator13",
"O_ScorpiusBelleros_base",
"Dos_Drop_Pod7",
"O_ScorpiusBelleros13_base"
];

VVS_West_IG = [
"TIOW_CadianChimAuto_776", 
"TIOW_Centaur_01_Cadian_776_Blu", 
"TIOW_CadianTrojan_776", 
"IC_Tauros_GMG_woodland_F", 
"IC_Tauros_HMG_woodland_F", 
"IC_Tauros_unarmed_woodland_F", 
"IC_Tauros_Venator_woodland_F", 
"OM_Tauros_Unarmed_Medicae_IC", 
"ML700_Taurox_Stubber", 
"ML700_Taurox_Unarmed"
];

VVS_West_Salo = [
"TIOW_SM_Predator_SL",
"TIOW_SM_Razorback_AC_SL",
"TIOW_SM_Razorback_SL",
"TIOW_SM_Razorback_LC_SL",
"TIOW_SM_Rhino_SL",
"TIOW_SM_Vindicator_SL",
"Steve_SAL_Jetbike_HB",
"Steve_SAL_Jetbike_MM",
"Steve_SAL_Jetbike_PC",
"Steve_SAL_Jetbike_VLK"
];


VVS_Car = [];
VVS_Air = [];
VVS_Ship = [];
VVS_Armored = [];
VVS_Autonomous = [];
VVS_Support = [];

VVS_R_Car = [];
VVS_R_Air = [];
VVS_R_Ship = [];
VVS_R_Armored = [];
VVS_R_Autonomous = [];
VVS_R_Support = [];


/*
this disableAI "move"; this disableAI "radioprotocol"; this disableAI "autocombat"; this disableAI "weaponaim";
this addAction [
"Запрос Техники",
VVS_fnc_openVVS,
[VVS_west_Land,"West"],
6,
true,
true,
"",
"true",
5
];
*/
