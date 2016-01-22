#define DIK_UP				16
#define DIK_DOWN 			18
#define DIK_FORW 			17
#define DIK_BACK 			31
#define DIK_LEFT 			30
#define DIK_RGHT 			32
#define DIK_ESC 			1
#define DIK_DELETE 			211
#define DIK_MINUS 			74
#define DIK_PLUS 			78
#define DIK_CAPS			58
#define DIK_TAB				15
#define DIK_ARROWUP			200
#define DIK_ARROWDOWN		208
#define DIK_ENTER			28
#define DIK_SPACE			57
#define DIK_LMB 			0
#define DIK_RMB 			1
#define DIK_1				2
#define DIK_2				3
#define DIK_R				19
#define DIK_C				46
#define DIK_V				47
#define DIK_F				33
#define DIK_N				49
#define DIK_D				32
#define DIK_Z 				44
#define DIK_S 				31
#define DIK_E 				18
#define DIK_Q				16
#define DIK_M				50
#define DIK_T				20
#define DIK_G				34
#define DIK_K				37
#define DIK_F1				59
#define DIK_F2				60
#define DIK_F3				61
#define DIK_F4				62
#define DIK_F5				63
#define DIK_F6				64
#define DIK_F7				65
#define DIK_F8				66
#define DIK_F11				87
#define DIK_ARROW_LEFT		203
#define DIK_ARROW_RIGHT		205
#define DIK_ARROW_DOWN		208
#define DIK_ARROW_UP		200

//ACTIONS
#define OS_FAST_FORWARD		209
#define OS_FAST_BACKWARD	201

//COLORS AND OBJECTS
#define PIVOT				"Sign_Arrow_Large_F"
#define CENTER_PIVOT		"Sign_Arrow_Large_Cyan_F"
#define ADD_TOOL			"Sign_Arrow_Large_Green_F"
#define SELECT_TOOL_S		"Sign_Sphere10cm_F"
#define SELECT_TOOL_B		"Sign_Sphere100cm_F"
#define COLOR_RED			[1,0,0,1]
#define COLOR_CYAN			[0,1,1,1]
#define COLOR_BLUE			[0,0,1,1]
#define COLOR_WHITE			[1,1,1,1]
#define COLOR_VIOLET		[1,0,1,1]

//CONSTATS
#define RADIUS_CHANGE		1
#define ANGLE_CHANGE		0.5
#define HEIGHT_CHANGE		0.02

//SHORTCUTS
#define NOTHING_SELECTED 	(count ct_var_sel == 0)
#define SOMETHING_SELECTED 	(count ct_var_sel != 0)
#define SELECTION 			(ct_var_sel select 0)
#define SEL_LIB 			(ct_var_sel select 1)
#define SEL_STATE 			(ct_var_sel select 2)
#define FIRST_SELECTION		((SELECTION select 0) select 0)
#define ALL_SELECTED(ARRAY)	{ARRAY pushBack (_x select 0)} forEach (ct_var_sel select 0);
#define HK_CTRL				(ct_var_holdenKeys select 6)
#define HK_SHIFT 			(ct_var_holdenKeys select 7)
#define HK_ALT 				(ct_var_holdenKeys select 8)

//IDCs
#define CT_PANEL_IDC 758343
#define CT_STRATCTBUTTON_IDC 758344
#define CT_MODETOOLBOX_IDC 758345
#define CT_ADVANCEDMODETAB_IDC 758346
#define CT_BASICMODETAB_IDC 758347
#define CT_PROJECTCOMBO_IDC 758348
#define CT_NEWPROJECTBUT_IDC 758349
#define CT_DELETEPROJECTBUT_IDC 758350
#define CT_UNITSIMTOGGLE_IDC 758351
#define CT_OBJECTSSIMTOGGLE_IDC 758352
#define CT_EXPORTLIBSBUT_IDC 758353
#define CT_EXPORTPROJECTSBUT_IDC 758354
#define CT_HIDECTBUT_IDC 758355
#define CT_MODETAB_IDC 758356
#define CT_PROMTWINDOW_IDC 758358
#define CT_WARNINGTEXT_IDC 758359
#define CT_PROMTWINOKBUT_IDC 758360
#define CT_PROMTWINCANCELBUT_IDC 758361
#define CT_HIDECTTOGGLE_IDC 758362
#define CT_PROMTWINEDITBOX_IDC 758363
#define CT_WARNINGIMAGE_IDC 758364
#define CT_OBJECTSELECTIONMENU_IDC 758365
#define CT_OSMCATCOMBO_IDC 758366
#define CT_OSMSEARCH_IDC 758367
#define CT_OSMGROUPBY_IDC 758368
#define CT_OSMCATNAMETEXT_IDC 758369
#define CT_ROTATIONCLAMPTOGGLE_IDC 758370

#define CT_SCREEN_01_IDC 758501
#define CT_SCREEN_02_IDC 758502
#define CT_SCREEN_03_IDC 758503
#define CT_SCREEN_04_IDC 758504
#define CT_SCREEN_05_IDC 758505
#define CT_SCREEN_06_IDC 758506
#define CT_SCREEN_07_IDC 758507
#define CT_SCREEN_08_IDC 758508
#define CT_SCREEN_09_IDC 758509
#define CT_SCREEN_10_IDC 758510
#define CT_SCREEN_11_IDC 758511
#define CT_SCREEN_12_IDC 758512
#define CT_SCREEN_13_IDC 758513
#define CT_SCREEN_14_IDC 758514
#define CT_SCREEN_15_IDC 758515
#define CT_SCREEN_16_IDC 758516
#define CT_SCREEN_17_IDC 758517
#define CT_SCREEN_18_IDC 758518
#define CT_SCREEN_19_IDC 758519
#define CT_SCREEN_20_IDC 758520
#define CT_SCREEN_21_IDC 758521
#define CT_SCREEN_22_IDC 758522
#define CT_SCREEN_23_IDC 758523
#define CT_SCREEN_24_IDC 758524
#define CT_SCREEN_25_IDC 758525
#define CT_SCREEN_26_IDC 758526
#define CT_SCREEN_27_IDC 758527
#define CT_SCREEN_28_IDC 758528
#define CT_SCREEN_29_IDC 758529
#define CT_SCREEN_30_IDC 758530
#define CT_SCREEN_31_IDC 758531
#define CT_SCREEN_32_IDC 758532
#define CT_SCREENTEXT_01_IDC 758601
#define CT_SCREENTEXT_02_IDC 758602
#define CT_SCREENTEXT_03_IDC 758603
#define CT_SCREENTEXT_04_IDC 758604
#define CT_SCREENTEXT_05_IDC 758605
#define CT_SCREENTEXT_06_IDC 758606
#define CT_SCREENTEXT_07_IDC 758607
#define CT_SCREENTEXT_08_IDC 758608
#define CT_SCREENTEXT_09_IDC 758609
#define CT_SCREENTEXT_10_IDC 758610
#define CT_SCREENTEXT_11_IDC 758611
#define CT_SCREENTEXT_12_IDC 758612
#define CT_SCREENTEXT_13_IDC 758613
#define CT_SCREENTEXT_14_IDC 758614
#define CT_SCREENTEXT_15_IDC 758615
#define CT_SCREENTEXT_16_IDC 758616
#define CT_SCREENTEXT_17_IDC 758617
#define CT_SCREENTEXT_18_IDC 758618
#define CT_SCREENTEXT_19_IDC 758619
#define CT_SCREENTEXT_20_IDC 758620
#define CT_SCREENTEXT_21_IDC 758621
#define CT_SCREENTEXT_22_IDC 758622
#define CT_SCREENTEXT_23_IDC 758623
#define CT_SCREENTEXT_24_IDC 758624
#define CT_SCREENTEXT_25_IDC 758625
#define CT_SCREENTEXT_26_IDC 758626
#define CT_SCREENTEXT_27_IDC 758627
#define CT_SCREENTEXT_28_IDC 758628
#define CT_SCREENTEXT_29_IDC 758629
#define CT_SCREENTEXT_30_IDC 758630
#define CT_SCREENTEXT_31_IDC 758631
#define CT_SCREENTEXT_32_IDC 758632

#define CT_GENERALBUT_IDC 1000
#define CT_TUTORIALBUT_IDC 1001
#define CT_SLIDERSGROUP_IDC 1100
#define CT_SLIDERSROTATEEDIT_IDC 1101
#define CT_SLIDERSROTATESLIDER_IDC 1102
#define CT_SLIDERSHEIGHTEDIT_IDC 1103
#define CT_SLIDERSHEIGHTSLIDER_IDC 1104
#define CT_SLIDERSRADIUSEDIT_IDC 1105
#define CT_SLIDERSRADIUSSLIDER_IDC 1106
#define CT_SLIDERSSELECTEDIT_IDC 1107
#define CT_SLIDERSSELECTSLIDER_IDC 1108
#define CT_SLIDERSCAMROTATIONEDIT_IDC 1109
#define CT_SLIDERSCAMROTATIONSLIDER_IDC 1110
#define CT_SLIDERSCAMMOVEEDIT_IDC 1111
#define CT_SLIDERSCAMMOVESLIDER_IDC 1112
#define CT_TOGGLESGROUP_IDC 1200
#define CT_TOGGLESUNITSIM_IDC 1201
#define CT_TOGGLESOBJECTSIM_IDC 1202
#define CT_TUTORIALSGROUP_IDC 1300