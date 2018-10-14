//W3x2lni Data: 2018-10-13 20:39:57.636
globals
    // User-defined
group udg_UG_ResidualImage= null
unit udg_A_Unit= null
unit udg_A_Unit2= null
unit array udg_A_PlayerHero
unit array udg_Player_Hero
unit array udg_Unit_B
group udg_A_UG= null
location udg_A_Piont= null
location udg_A_Piont2= null
real udg_A_Angle= 0
real udg_A_Ang= 0
real udg_A_Ang_2= 0
real udg_A_hurt= 0
real udg_A_num= 0
real udg_x= 0
real udg_y= 0
player array udg_Player
integer udg_A_Int= 0
integer udg_Number_player= 0
integer array udg_MeiJuJiFen
integer array udg_kurongsharen
boolean array udg_HuanZhuangCD
    // Generated
unit gg_unit_N008_0054= null
unit gg_unit_N007_0055= null
unit gg_unit_n00M_0131= null
unit gg_unit_nvl2_0005= null
unit gg_unit_N00I_0116= null
unit gg_unit_n00E_0066= null
unit gg_unit_n00N_0132= null


//JASSHelper struct globals:

endglobals


//===========================================================================
// 
// 决战江湖1.55正式版
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Sat Oct 13 17:38:08 2018
//   Map Author: 云杨 zei_kale
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_UG_ResidualImage=CreateGroup()
    set udg_A_UG=CreateGroup()
    set udg_A_Ang=0
    set udg_A_Ang_2=0
    set udg_A_hurt=0
    set udg_A_num=0
    set udg_x=0
    set udg_y=0
    set udg_A_Int=0
    set udg_Number_player=0
    set i=0
    loop
        exitwhen ( i > 7 )
        set udg_MeiJuJiFen[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 5 )
        set udg_kurongsharen[i]=0
        set i=i + 1
    endloop
    set i=0
    loop
        exitwhen ( i > 5 )
        set udg_HuanZhuangCD[i]=false
        set i=i + 1
    endloop
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateBuildingsForPlayer5 takes nothing returns nothing
    local player p= Player(5)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'nbse', - 13024.0, - 15264.0, 270.000)
    set u=CreateUnit(p, 'n00H', - 8960.0, - 14016.0, 270.000)
    set u=CreateUnit(p, 'nbse', 1184.0, - 6048.0, 270.000)
    set u=CreateUnit(p, 'nbse', - 288.0, - 13088.0, 270.000)
    set u=CreateUnit(p, 'nbse', 544.0, - 13024.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer5 takes nothing returns nothing
    local player p= Player(5)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'o02D', - 101.7, - 1403.0, 105.880)
    set u=CreateUnit(p, 'N00B', 287.2, - 405.3, 352.620)
    call IssueImmediateOrder(u, "")
    call IssueImmediateOrder(u, "")
    call IssueImmediateOrder(u, "")
    set u=CreateUnit(p, 'o02M', - 1132.4, - 1892.3, 270.000)
    set u=CreateUnit(p, 'o01I', 430.0, 206.6, 180.000)
    set u=CreateUnit(p, 'o025', 434.5, 41.8, 180.000)
    set u=CreateUnit(p, 'N00I', 1315.2, - 13118.7, 343.220)
    set u=CreateUnit(p, 'o00K', - 1309.2, - 1901.3, 303.520)
endfunction
//===========================================================================
function CreateUnitsForPlayer6 takes nothing returns nothing
    local player p= Player(6)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'N008', 460.8, - 417.6, 180.000)
    set u=CreateUnit(p, 'N009', 445.4, - 223.3, 225.000)
endfunction
//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hrif', 12079.0, 8383.5, 94.211)
    set u=CreateUnit(p, 'hrif', 12335.5, 8511.9, 240.795)
    set u=CreateUnit(p, 'hrif', 12570.7, 8503.7, 296.640)
    set u=CreateUnit(p, 'hrif', 12861.9, 8465.7, 235.587)
    set u=CreateUnit(p, 'hrif', 12475.3, 8890.0, 139.454)
    set u=CreateUnit(p, 'hrif', 12093.4, 8917.0, 343.234)
    set u=CreateUnit(p, 'hrif', 12054.8, 8075.7, 247.892)
    set u=CreateUnit(p, 'hrif', 11377.5, 7797.7, 310.505)
    set u=CreateUnit(p, 'hrif', 11017.6, 7781.0, 204.451)
    set u=CreateUnit(p, 'hrif', 11104.1, 8067.7, 215.416)
    set u=CreateUnit(p, 'hrif', 11202.7, 8446.2, 52.648)
    set u=CreateUnit(p, 'hrif', 12905.5, 9070.1, 1.956)
    set u=CreateUnit(p, 'hrif', 13889.7, 9209.3, 246.541)
    set u=CreateUnit(p, 'hrif', 13320.3, 9412.1, 170.480)
    set u=CreateUnit(p, 'Hmkg', 12555.2, 9450.8, 0.040)
    call IssueImmediateOrder(u, "")
    set u=CreateUnit(p, 'hrif', 13040.2, 9945.3, 320.393)
    set u=CreateUnit(p, 'hrif', 12964.0, 10367.6, 268.042)
    set u=CreateUnit(p, 'h00N', - 4898.7, - 12198.6, 90.000)
    set u=CreateUnit(p, 'n00T', - 3273.7, - 12211.5, 90.000)
    set u=CreateUnit(p, 'n00U', - 2284.7, - 11132.1, 270.000)
    set u=CreateUnit(p, 'n00S', - 4088.4, - 11124.8, 270.000)
    set u=CreateUnit(p, 'n00M', - 3348.2, - 15208.4, 56.220)
    set u=CreateUnit(p, 'n00N', - 3272.5, - 15268.8, 90.000)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'nvl2', - 12666.8, - 12668.0, 270.000)
    set u=CreateUnit(p, 'o02C', - 11675.7, - 12657.2, 270.000)
    set u=CreateUnit(p, 'hfoo', 13113.9, - 12953.1, 180.000)
    set u=CreateUnit(p, 'hfoo', 13098.9, - 12608.4, 180.000)
    set u=CreateUnit(p, 'hfoo', 13106.8, - 12266.3, 180.000)
    set u=CreateUnit(p, 'hfoo', 13125.6, - 11941.2, 180.000)
    set u=CreateUnit(p, 'hfoo', 13110.6, - 11596.5, 180.000)
    set u=CreateUnit(p, 'hfoo', 13118.5, - 11254.4, 180.000)
    set u=CreateUnit(p, 'hfoo', 10471.2, - 12877.6, 0.000)
    set u=CreateUnit(p, 'hfoo', 10456.2, - 12532.9, 0.000)
    set u=CreateUnit(p, 'hfoo', 10464.1, - 12190.8, 0.000)
    set u=CreateUnit(p, 'hfoo', 10482.9, - 11865.7, 0.000)
    set u=CreateUnit(p, 'hfoo', 10467.9, - 11521.0, 0.000)
    set u=CreateUnit(p, 'hfoo', 10475.8, - 11178.9, 0.000)
    set u=CreateUnit(p, 'hfoo', 10788.2, - 13132.6, 90.000)
    set u=CreateUnit(p, 'hfoo', 11123.4, - 13127.2, 90.000)
    set u=CreateUnit(p, 'hfoo', 11476.5, - 13127.2, 90.000)
    set u=CreateUnit(p, 'hfoo', 11789.3, - 13119.0, 90.000)
    set u=CreateUnit(p, 'hfoo', 12117.5, - 13126.3, 90.000)
    set u=CreateUnit(p, 'hfoo', 12752.7, - 13125.3, 90.000)
    set u=CreateUnit(p, 'hfoo', 12439.1, - 13131.0, 90.000)
    set u=CreateUnit(p, 'hfoo', 10865.3, - 11041.6, 270.000)
    set u=CreateUnit(p, 'hfoo', 11200.6, - 11052.2, 270.000)
    set u=CreateUnit(p, 'hfoo', 11553.7, - 11052.2, 270.000)
    set u=CreateUnit(p, 'hfoo', 11866.5, - 11044.1, 270.000)
    set u=CreateUnit(p, 'hfoo', 12194.7, - 11051.3, 270.000)
    set u=CreateUnit(p, 'hfoo', 12829.8, - 11050.3, 270.000)
    set u=CreateUnit(p, 'hfoo', 12516.3, - 11048.0, 270.000)
    set u=CreateUnit(p, 'hbsh', 8756.7, 2231.1, 159.134)
    set u=CreateUnit(p, 'hdes', 8725.7, 1444.5, 148.343)
    set u=CreateUnit(p, 'ogrk', 10149.5, 2965.0, 12.490)
    set u=CreateUnit(p, 'nvil', 9481.5, 2020.6, 153.110)
    set u=CreateUnit(p, 'nvil', 11946.6, 1409.1, 153.110)
    set u=CreateUnit(p, 'nvil', 13162.3, - 376.3, 358.110)
    set u=CreateUnit(p, 'N007', 463.2, - 595.1, 135.000)
    set u=CreateUnit(p, 'nslf', 10997.8, 3200.4, 270.000)
    set u=CreateUnit(p, 'nwnr', 10992.4, 2448.7, 90.000)
    set u=CreateUnit(p, 'n00E', 14666.0, 1079.2, 89.340)
    set u=CreateUnit(p, 'o022', 10129.1, 2787.2, 0.000)
    set u=CreateUnit(p, 'n00A', 10780.4, 3209.3, 270.000)
    set u=CreateUnit(p, 'o01X', 12561.4, 1703.5, 225.000)
    set u=CreateUnit(p, 'nvil', 10161.2, 3604.7, 103.352)
    set u=CreateUnit(p, 'nvil', 11325.7, 3482.4, 240.168)
    set u=CreateUnit(p, 'nvil', 11322.3, 743.0, 84.356)
    set u=CreateUnit(p, 'nvil', 10865.2, - 59.7, 238.960)
    set u=CreateUnit(p, 'nvil', 12978.8, - 742.5, 322.470)
    set u=CreateUnit(p, 'nvil', 13486.5, - 796.9, 151.045)
    set u=CreateUnit(p, 'nvil', 13883.7, - 1122.0, 87.959)
    set u=CreateUnit(p, 'nvil', 14401.0, - 496.5, 7.174)
    set u=CreateUnit(p, 'nvil', 12518.7, - 847.8, 224.183)
    set u=CreateUnit(p, 'nvil', 11989.6, - 691.0, 48.506)
    set u=CreateUnit(p, 'nvil', 10697.4, 1028.4, 2.142)
    set u=CreateUnit(p, 'nvil', 9993.2, 838.7, 130.620)
    set u=CreateUnit(p, 'nvil', 9880.9, - 312.0, 83.993)
    set u=CreateUnit(p, 'o009', - 2214.0, 469.5, 315.030)
    set u=CreateUnit(p, 'o01Y', - 2283.0, 311.9, 0.000)
    set u=CreateUnit(p, 'o01Z', - 2063.7, 512.1, 270.040)
    set u=CreateUnit(p, 'o021', 10788.7, 2432.2, 90.180)
    set u=CreateUnit(p, 'N00F', 1861.0, - 4063.8, 270.000)
    set u=CreateUnit(p, 'o027', - 8391.7, - 13686.5, 180.000)
    set u=CreateUnit(p, 'o028', - 9565.3, - 13673.1, 0.000)
    set u=CreateUnit(p, 'o02A', - 9010.1, - 13208.2, 270.000)
    set u=CreateUnit(p, 'o029', - 9519.1, - 14831.5, 0.000)
    set u=CreateUnit(p, 'o02B', - 8490.7, - 14848.6, 180.000)
    set u=CreateUnit(p, 'hkni', - 11717.6, - 13939.5, 180.000)
    set u=CreateUnit(p, 'hkni', - 12586.0, - 13906.9, 0.000)
    set u=CreateUnit(p, 'o02L', 1781.6, - 4106.0, 270.000)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer5()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer5()
    call CreateUnitsForPlayer6()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateBuildingsForPlayer5() // INLINED!!
    call CreateNeutralHostile()
    call CreateNeutralPassive()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)
    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(5), false)
    call SetPlayerController(Player(5), MAP_CONTROL_COMPUTER)
    // Player 6
    call SetPlayerStartLocation(Player(6), 6)
    call ForcePlayerStartLocation(Player(6), 6)
    call SetPlayerColor(Player(6), ConvertPlayerColor(6))
    call SetPlayerRacePreference(Player(6), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(6), false)
    call SetPlayerController(Player(6), MAP_CONTROL_COMPUTER)
    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(7), false)
    call SetPlayerController(Player(7), MAP_CONTROL_COMPUTER)
    // Player 8
    call SetPlayerStartLocation(Player(8), 8)
    call ForcePlayerStartLocation(Player(8), 8)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(8), false)
    call SetPlayerController(Player(8), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_5215
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(4), 0)
    call SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(5), 0)
    call SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    // Force: TRIGSTR_5216
    call SetPlayerTeam(Player(6), 1)
    call SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(7), 1)
    call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(8), 1)
    call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 4)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 4)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 4)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(3, 4)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(4, 4)
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("VillageDay")
    call SetAmbientNightSound("VillageNight")
    call SetMapMusic("Music", true, 0)
    call CreateAllUnits()
    call InitBlizzard()


    call InitGlobals()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("决战江湖1.55正式版")
    call SetMapDescription("|cFFFF00FF那一年夏至日，黄历上说诸事不宜，我提起佩剑，跨出了家门，开始了我的江湖路。
很多年后，当我站在武林的最高峰，暮然回首过往云烟，那时侯我依然不明白何谓武？何谓侠？江湖究竟是什么
当你打开这个游戏的时候，你的江湖已经开始了.....|r")
    call SetPlayers(9)
    call SetTeams(9)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, 1728.0, - 4160.0)
    call DefineStartLocation(1, 1728.0, - 4160.0)
    call DefineStartLocation(2, 1728.0, - 4160.0)
    call DefineStartLocation(3, 1728.0, - 4160.0)
    call DefineStartLocation(4, 1728.0, - 4160.0)
    call DefineStartLocation(5, - 3328.0, - 15616.0)
    call DefineStartLocation(6, 1728.0, - 4160.0)
    call DefineStartLocation(7, 1728.0, - 4160.0)
    call DefineStartLocation(8, 1728.0, - 4160.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

