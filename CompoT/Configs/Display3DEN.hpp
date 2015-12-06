//#define pixelW  (1 / (getResolution select 2))
//#define pixelH  (1 / (getResolution select 3))
#define pixelScale	1.25
#define pixelGrid 4
#define GRID_W (pixelW * pixelScale * pixelGrid)
#define GRID_H (pixelH * pixelScale * pixelGrid)
#define PANEL_W	60
#define SIZE_M	5
#define MENUBAR_H	SIZE_M
#define TOOLBAR_H	(SIZE_M + 2)

#define CT_SPC 1
#define CT_SPC_SCR 3
#define CT_MODETAB_H	6
#define CT_PANEL_W 60
#define CT_ADVANCEDTAB_H 60
#define CT_PROMTWIN_W 90
#define CT_PROMTWIN_H 40
#define CT_SCREENSIDE 40

#define CT_SEPARATORCOLOR 0.4,0.4,0.4,0.8

#define CT_CTTOOLBAR_IDC 758341
#define CT_CTTOGGLE_IDC 758342
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
#define CT_PROMTUNLOADCTBUT_IDC 758357
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




class ctrlControlsGroupNoScrollbars; //External class reference
class ctrlCheckboxToolbar; //External class reference
class ctrlButtonToolbar; //External class reference
class ctrlStatic; //External class reference
class ctrlShortcutButton; //External class reference
class ctrlToolbox; //External class reference
class ctrlCombo; //External class reference
class ctrlStaticMulti; //External class reference
class ctrlStaticPicture; //External class reference
class ctrlEdit; //External class reference

class Cfg3DEN {
	class EventHandlers {
		class CT {
			onMissionNew = "['newMission'] call CT_fnc_handler";
			OnTerrainNew = "['newMission'] call CT_fnc_handler";
			OnMissionPreview = "['previewStart'] call CT_fnc_handler";
			OnMissionPreviewEnd = "['previewEnd'] call CT_fnc_handler";
			OnMissionLoad = "['missionLoaded'] call CT_fnc_handler";
		};
	};
	class Notifications {
		class CT_noProject {
			text = "$STR_A3_ct_eden_gui_noProjects_error";
			isWarning = 1;
		};
		class CT_nameEmpty {
			text = "$STR_A3_ct_eden_gui_nameEmpty_error";
			isWarning = 1;
		};
		class CT_libsToClipboard {
			text = "$STR_A3_ct_eden_gui_libsToClipboard_warning";
			isWarning = 0;
		};
		class CT_projectsToClipboard {
			text = "$STR_A3_ct_eden_gui_projectsToClipboard_warning";
			isWarning = 0;
		};
		class CT_libsToFile {
			text = "$STR_A3_ct_eden_gui_libsTofile_warning";
			isWarning = 0;
		};
		class CT_projectsToFile {
			text = "$STR_A3_ct_eden_gui_projectsTofile_warning";
			isWarning = 0;
		};
		class CT_libsWrong {
			text = "$STR_A3_ct_eden_gui_libsWrong_error";
			isWarning = 1;
		};
		class CT_noPlayer {
			text = "$STR_A3_ct_eden_gui_noPlayer_error";
			isWarning = 1;
		};
	};
};
class Display3DEN {
	class Controls {
		class Toolbar : ctrlControlsGroupNoScrollbars {
			class Controls {
				class Separator1; //External class reference
				class Separator6: Separator1 {
					x = 32 * SIZE_M * GRID_W;
				};
				class CTtoolbar : ctrlControlsGroupNoScrollbars {
					idc = CT_CTTOOLBAR_IDC;
					x = 32.5 * SIZE_M * GRID_W;
					y = 1 * GRID_H;
					w = 1 * SIZE_M * GRID_W;
					h = SIZE_M * GRID_H;
					
					class Controls {
						class promtButton : ctrlButtonToolbar {
							idc = CT_PROMTUNLOADCTBUT_IDC;
							action = "['loadOrUnloadCT'] call CT_fnc_handler";
							text = "composition_tool\data\UI\ct_but_off.paa";
							tooltip = "$STR_A3_ct_eden_gui_toggle_hint";
							onLoad = "";
							x = 0;
							y = 0;
							h = SIZE_M * GRID_H;
							W = SIZE_M * GRID_W;
							offsetPressedX = 0;
							offsetPressedY = 0;
							// colorText[] = {0, 0, 0, 0};
							// colorDisabled[] = {0, 0, 0, 0};
							// colorBackground[] = {0, 0, 0, 0};
							// colorBackgroundDisabled[] = {0, 0, 0, 0};
							// colorBackgroundActive[] = {0,0,0,0};
							// colorFocused[] = {0,0,0,0};
						};
						class CTtoggle : ctrlCheckboxToolbar {
							idc = CT_CTTOGGLE_IDC;
							onCheckedChanged = "";
							onLoad = "";
							tooltip = "$STR_A3_ct_eden_gui_toggle_hint";
							textureChecked = "composition_tool\data\UI\ct_but_on.paa";
							textureUnchecked = "composition_tool\data\UI\ct_but_off.paa";
							textureFocusedChecked = "composition_tool\data\UI\ct_but_on.paa";
							textureFocusedUnchecked = "composition_tool\data\UI\ct_but_off.paa";
							textureHoverChecked = "composition_tool\data\UI\ct_but_on.paa";
							textureHoverUnchecked = "composition_tool\data\UI\ct_but_off.paa";
							texturePressedChecked = "composition_tool\data\UI\ct_but_on.paa";
							texturePressedUnchecked = "composition_tool\data\UI\ct_but_off.paa";
							textureDisabledChecked = "composition_tool\data\UI\ct_but_on.paa";
							textureDisabledUnchecked = "composition_tool\data\UI\ct_but_off.paa";
							x = 0;
							y = 0;
							h = SIZE_M * GRID_H;
							W = SIZE_M * GRID_W;
						};
					};
				};
			};
		};
		class Panel_ct : ctrlControlsGroupNoScrollbars {
			idc = CT_PANEL_IDC;
			x = safezoneX + safezoneW - (CT_PANEL_W + PANEL_W) * GRID_W;
			y = safezoneY + (5 + TOOLBAR_H) * GRID_H;
			w = CT_PANEL_W * GRID_W;
			h = CT_ADVANCEDTAB_H * GRID_H;
			show = 0;
			class Controls {
				class ModeTab : ctrlControlsGroupNoScrollbars {
					idc = CT_MODETAB_IDC;
					x = 0;
					y = 0;
					w = (CT_PANEL_W - 3) * GRID_W;
					h = CT_MODETAB_H * GRID_H;
					
					class Controls {
						class Background_ct : ctrlStatic {
							idc = -1;
							x = 0;
							y = 0;
							w = (CT_PANEL_W - 3) * GRID_W;
							h = CT_MODETAB_H * GRID_H;
							colorBackground[] = {0.1, 0.1, 0.1, 1};
						};
						class ModeToolbox_ct : ctrlToolbox {
							idc = CT_MODETOOLBOX_IDC;
							x = 1 * GRID_W;
							y = 1 * GRID_H;
							w = (CT_PANEL_W -  5) * GRID_W;
							h = (CT_MODETAB_H - 1) * GRID_H;
							font = "PuristaLight";
							columns = 2;
							strings[] = {"$STR_A3_ct_eden_gui_basic_tab", "$STR_A3_ct_eden_gui_advance_tab"};
							colorBackground[] = {0, 0, 0, 0};
							colorSelectedBg[] = {0.2, 0.2, 0.2, 1};
							onToolBoxSelChanged = "['modeChange',(_this select 1)] call CT_fnc_handler";
						};
					};
				};
				class BasicMode_ct : ctrlControlsGroupNoScrollbars {
					idc = CT_BASICMODETAB_IDC;
					x = 0;
					y = 6 * GRID_H;
					w = 0 * GRID_W;
					h = 0 * GRID_H;
					
					class Controls {
						class Background_ct : ctrlStaticMulti {
							idc = -1;
							text = "";
							x = 0;
							y = 0;
							w = 0 * GRID_W;
							h = 0 * GRID_H;
							colorBackground[] = {0.2, 0.2, 0.2, 1};
						};
					};
				};
				class AdvancedMode_ct : ctrlControlsGroupNoScrollbars {
					idc = CT_ADVANCEDMODETAB_IDC;
					x = 0;
					y = 6 * GRID_H;
					w = CT_PANEL_W * GRID_W;
					h = CT_ADVANCEDTAB_H * GRID_H;
					
					class Controls {
						class Background_ct : ctrlStatic {
							idc = -1;
							x = 0;
							y = 0;
							w = CT_PANEL_W * GRID_W;
							h = CT_ADVANCEDTAB_H * GRID_H;
							colorBackground[] = {0.2, 0.2, 0.2, 1};
						};
						class Start_ct : ctrlShortcutButton {
							idc = CT_STRATCTBUTTON_IDC;
							text = "$STR_A3_ct_eden_gui_start_but";
							x = 2 * GRID_W;
							y = (2 * CT_SPC) * GRID_H;
							w = (CT_PANEL_W - 4) * GRID_W;
							h = 10 * GRID_H;
							size = 3 * GRID_H;
							action = "if !(is3DENMultiplayer) then {['enterEditor'] call CT_fnc_handler} else {['enterEditorMP'] call CT_fnc_handler};";
							shadow = false;
							color2[] = {0, 0, 0, 1};
							colorFocused[] = {0, 0, 0, 1};
							colorBackground[] = {1, 1, 1, 1};
							animTextureNormal = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\playNormal_ca.paa";
							animTexturePressed = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\playNormal_ca.paa";
							animTextureOver = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\playOver_ca.paa";
							animTextureFocused = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\playOver_ca.paa";
							animTextureDisabled = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\playDisabled_ca.paa";
							class Attributes {
								align = "center";
								color = "#ffffff";
								font = "PuristaMedium";
								shadow = false;
							};
							class TextPos {
								left = 0;
								top = 10 * GRID_W * 0.3;
								right = (CT_PANEL_W - 4) * GRID_W * 0.1;
								bottom = 0;
							};
						};
						class separator1: ctrlStatic {
							idc = -1;
							x = 1 * GRID_W;
							y = (10 + (3 * CT_SPC)) * GRID_H;
							w = (CT_PANEL_W - 2) * GRID_W;
							h = 0.5 * GRID_H;
							colorBackground[] = {CT_SEPARATORCOLOR};
						};
						class curProjectText : ctrlStatic {
							idc = -1;
							text = "$STR_A3_ct_eden_curProjectText_text";
							x = 2 * GRID_W;
							y = (10.5 + (4 * CT_SPC)) * GRID_H;
							w = (CT_PANEL_W - 2) * GRID_W;
							h = 5 * GRID_H;
						};
						class projectCombo : ctrlCombo {
							idc = CT_PROJECTCOMBO_IDC;
							tooltip = "$STR_A3_ct_eden_chooseProject_combo";
							x = 2 * GRID_W;
							y = (15.5 + (5 * CT_SPC)) * GRID_H;
							w = (CT_PANEL_W * 0.75) * GRID_W;
							h = 5 * GRID_H;
							onLbSelChanged = "['selectProject',_this] call CT_fnc_handler";
							class Items {};
						};
						class newProject : ctrlButtonToolbar {
							idc = CT_NEWPROJECTBUT_IDC;
							action = "['newProject'] call CT_fnc_handler";
							text = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\new_ca.paa";
							tooltip = "$STR_A3_ct_eden_gui_newProject_hint";
							onLoad = "";
							x = ((CT_PANEL_W * 0.75) + 2) * GRID_W;
							y = (15.5 + (5 * CT_SPC)) * GRID_H;
							w = 5 * GRID_W;
							h = 5 * GRID_H;
						};
						class deleteProject : ctrlButtonToolbar {
							idc = CT_DELETEPROJECTBUT_IDC;
							action = "['deleteProject'] call CT_fnc_handler";
							text = "composition_tool\data\UI\ct_but_delete.paa";
							tooltip = "$STR_A3_ct_eden_gui_deleteProject_hint";
							onLoad = "";
							x = ((CT_PANEL_W * 0.75) + 2 + 5) * GRID_W;
							y = (15.5 + (5 * CT_SPC)) * GRID_H;
							w = 5 * GRID_W;
							h = 5 * GRID_H;
						};
						class separator2: separator1 {
							y = (20.5 + (6 * CT_SPC)) * GRID_H;
							w = (CT_PANEL_W - 2) * GRID_W;
						};
						class unitSimToggle : ctrlCheckboxToolbar {
							idc = CT_UNITSIMTOGGLE_IDC;
							onCheckedChanged = "['toggleUnitSim', _this] call CT_fnc_handler";
							onLoad = "";
							tooltip = "$STR_A3_ct_eden_gui_toggleUnitSim_hint";
							textureChecked = "composition_tool\data\UI\ct_unitSim_on.paa";
							textureUnchecked = "composition_tool\data\UI\ct_unitSim_off.paa";
							textureFocusedChecked = "composition_tool\data\UI\ct_unitSim_on.paa";
							textureFocusedUnchecked = "composition_tool\data\UI\ct_unitSim_off.paa";
							textureHoverChecked = "composition_tool\data\UI\ct_unitSim_on.paa";
							textureHoverUnchecked = "composition_tool\data\UI\ct_unitSim_off.paa";
							texturePressedChecked = "composition_tool\data\UI\ct_unitSim_on.paa";
							texturePressedUnchecked = "composition_tool\data\UI\ct_unitSim_off.paa";
							textureDisabledChecked = "composition_tool\data\UI\ct_unitSim_on.paa";
							textureDisabledUnchecked = "composition_tool\data\UI\ct_unitSim_off.paa";
							x = 2 * GRID_W;
							y = (21 + (7 * CT_SPC)) * GRID_H;
							w = 10 * GRID_W;
							h = 10 * GRID_H;
						};
						class objectsSimToggle : ctrlCheckboxToolbar {
							idc = CT_OBJECTSSIMTOGGLE_IDC;
							onCheckedChanged = "['toggleObjectsSim', _this] call CT_fnc_handler";
							onLoad = "";
							tooltip = "$STR_A3_ct_eden_gui_toggleObjectsSim_hint";
							textureChecked = "composition_tool\data\UI\ct_objectsSim_on.paa";
							textureUnchecked = "composition_tool\data\UI\ct_objectsSim_off.paa";
							textureFocusedChecked = "composition_tool\data\UI\ct_objectsSim_on.paa";
							textureFocusedUnchecked = "composition_tool\data\UI\ct_objectsSim_off.paa";
							textureHoverChecked = "composition_tool\data\UI\ct_objectsSim_on.paa";
							textureHoverUnchecked = "composition_tool\data\UI\ct_objectsSim_off.paa";
							texturePressedChecked = "composition_tool\data\UI\ct_objectsSim_on.paa";
							texturePressedUnchecked = "composition_tool\data\UI\ct_objectsSim_off.paa";
							textureDisabledChecked = "composition_tool\data\UI\ct_objectsSim_on.paa";
							textureDisabledUnchecked = "composition_tool\data\UI\ct_objectsSim_off.paa";
							x = (2 + 10 + 2) * GRID_W;
							y = (21 + (7 * CT_SPC)) * GRID_H;
							w = 10 * GRID_W;
							h = 10 * GRID_H;
						};
						class separator3: separator1 {
							y = (31 + (8 * CT_SPC)) * GRID_H;
							w = (CT_PANEL_W - 2) * GRID_W;
						};
						class exportLibs : ctrlButtonToolbar {
							idc = CT_EXPORTLIBSBUT_IDC;
							action = "['exportLib'] call CT_fnc_handler";
							text = "composition_tool\data\UI\ct_exportLibs.paa";
							tooltip = "$STR_A3_ct_eden_gui_exportLib_hint";
							onLoad = "";
							x = 2 * GRID_W;
							y = (31.5 + (9 * CT_SPC)) * GRID_H;
							w = 10 * GRID_W;
							h = 10 * GRID_H;
						};
						class exportProjects : ctrlButtonToolbar {
							idc = CT_EXPORTPROJECTSBUT_IDC;
							action = "['exportProjects'] call CT_fnc_handler";
							text = "composition_tool\data\UI\ct_exportProjects.paa";
							tooltip = "$STR_A3_ct_eden_gui_exportProjects_hint";
							onLoad = "";
							x = (2 + 10 + 2) * GRID_W;
							y = (31.5 + (9 * CT_SPC)) * GRID_H;
							w = 10 * GRID_W;
							h = 10 * GRID_H;
						};
					};
				};
				class hideCTPanel_ct : ctrlControlsGroupNoScrollbars {
					idc = CT_HIDECTBUT_IDC;
					x = (CT_PANEL_W - 3) * GRID_W;
					y = 0;
					w = 3 * GRID_W;
					h = 6 * GRID_H;
					class Controls {
						class Background : ctrlStatic {
							idc = -1;
							x = 0;
							y = 0;
							w = 3 * GRID_W;
							h = 6 * GRID_H;
							colorBackground[] = {0.1, 0.1, 0.1, 1};
						};
						class hideToggle_ct : ctrlCheckboxToolbar {
							idc = CT_HIDECTTOGGLE_IDC;
							onCheckedChanged = "['toggleCT', _this] call CT_fnc_handler";
							onLoad = "";
							tooltip = "";
							textureChecked = "composition_tool\data\UI\ct_hideCT_up.paa";
							textureUnchecked = "composition_tool\data\UI\ct_hideCT_down.paa";
							textureFocusedChecked = "composition_tool\data\UI\ct_hideCT_up.paa";
							textureFocusedUnchecked = "composition_tool\data\UI\ct_hideCT_down.paa";
							textureHoverChecked = "composition_tool\data\UI\ct_hideCT_up.paa";
							textureHoverUnchecked = "composition_tool\data\UI\ct_hideCT_down.paa";
							texturePressedChecked = "composition_tool\data\UI\ct_hideCT_up.paa";
							texturePressedUnchecked = "composition_tool\data\UI\ct_hideCT_down.paa";
							textureDisabledChecked = "composition_tool\data\UI\ct_hideCT_up.paa";
							textureDisabledUnchecked = "composition_tool\data\UI\ct_hideCT_down.paa";
							x = 0 * GRID_W;
							y = 1 * GRID_W;
							w = 3 * GRID_W;
							h = 3 * GRID_H;
						};
					};
				};
			};
		};
		class PromtWindow_ct : ctrlControlsGroupNoScrollbars {
			idc = CT_PROMTWINDOW_IDC;
			x = safezoneX + (safezoneW / 2) - (CT_PROMTWIN_W / 2) * GRID_W;
			y = safezoneY + (safezoneH / 2) - (CT_PROMTWIN_H / 2) * GRID_H;
			w = CT_PROMTWIN_W * GRID_W;
			h = CT_PROMTWIN_H * GRID_H;
			show = 0;
			class Controls {
				class Background1 : ctrlStatic {
					idc = -1;
					x = 0;
					y = 0;
					w = CT_PROMTWIN_W * GRID_W;
					h = CT_PROMTWIN_H * GRID_H;
					colorBackground[] = {0.2, 0.2, 0.2, 1};
				};
				class Background2 : Background1 {
					h = (CT_PROMTWIN_H * 0.15) * GRID_H;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
				};
				class Background3 : Background1 {
					y = (CT_PROMTWIN_H * 0.8) * GRID_H;
					h = (CT_PROMTWIN_H * 0.2) * GRID_H;
					colorBackground[] = {0.1, 0.1, 0.1, 1};
				};
				class warningSign : ctrlStaticPicture {
					idc = CT_WARNINGIMAGE_IDC;
					text = "composition_tool\data\UI\ct_warning.paa";
					x = (CT_PROMTWIN_W * 0.034) * GRID_W;
					y = (CT_PROMTWIN_H * 0.22) * GRID_H;
					w = (CT_PROMTWIN_W * 0.166) * GRID_W;
					h = (CT_PROMTWIN_W * 0.166) * GRID_H;
					colorBackground[] = {0, 0, 0, 0};
				};
				class warningText : ctrlStaticMulti {
					idc = CT_WARNINGTEXT_IDC;
					x = (CT_PROMTWIN_W * 0.20) * GRID_W;
					y = (CT_PROMTWIN_H * 0.22) * GRID_H;
					w = (CT_PROMTWIN_W * 0.70) * GRID_W;
					h = (CT_PROMTWIN_H * 0.43) * GRID_H;
				};
				class okBut : ctrlButtonToolbar {
					idc = CT_PROMTWINOKBUT_IDC;
					style = 0x02;
					action = "";
					text = "OK";
					tooltip = "";
					onLoad = "";
					x = (CT_PROMTWIN_W * 0.45) * GRID_W;
					y = (CT_PROMTWIN_H * 0.82) * GRID_H;
					w = (CT_PROMTWIN_W * 0.26) * GRID_W;
					h = (CT_PROMTWIN_H * 0.16) * GRID_H;
					colorBackground[] = {0, 0, 0, 1};
				};
				class cancelBut : ctrlButtonToolbar {
					idc = CT_PROMTWINCANCELBUT_IDC;
					style = 0x02;
					action = "";
					text = "CANCEL";
					tooltip = "";
					onLoad = "";
					x = (CT_PROMTWIN_W * 0.73) * GRID_W;
					y = (CT_PROMTWIN_H * 0.82) * GRID_H;
					w = (CT_PROMTWIN_W * 0.26) * GRID_W;
					h = (CT_PROMTWIN_H * 0.16) * GRID_H;
					colorBackground[] = {0, 0, 0, 1};
				};
				class editBox : ctrlEdit {
					idc = CT_PROMTWINEDITBOX_IDC;
					x = (CT_PROMTWIN_W * 0.20) * GRID_W;
					y = (CT_PROMTWIN_H * 0.65) * GRID_H;
					w = (CT_PROMTWIN_W * 0.50) * GRID_W;
					h = (CT_PROMTWIN_H * 0.13) * GRID_H;
				};
			};
		};
		class ObjecSelectMenu_ct : ctrlControlsGroupNoScrollbars {
			idc = CT_OBJECTSELECTIONMENU_IDC;
			x = safezoneX;
			y = safezoneY + (MENUBAR_H + TOOLBAR_H) * GRID_H;
			w = safezoneW;
			h = safezoneH;
			show = 0;
			class Controls {
				class main_background: ctrlStatic {
					idc = -1;
					x = 0;
					y = 0;
					w = safezoneW;
					h = safezoneH;
					colorBackground[] = {0,0,0,0.6};
				};
				class tools_background: ctrlStatic {
					idc = -1;
					x = 8 * GRID_W;
					y = 0;
					w = safezoneW - (16 * GRID_W);
					h = 22 * GRID_H;
					colorBackground[] = {0.3,0.3,0.3,1};
				};
				class cat_name_combo: ctrlCombo {
					idc = CT_OSMCATCOMBO_IDC;
					text = "";
					x = 80 * GRID_W;
					y = 10 * GRID_H;
					w = 60 * GRID_W;
					h = 8 * GRID_H;
					Size = 0.07;
				};
				class cat_text: ctrlStatic {
					idc = CT_OSMCATNAMETEXT_IDC;
					text = $STR_A3_info_gui_category;
					x = 80 * GRID_W;
					y = 1 * GRID_H;
					w = 60 * GRID_W;
					h = 9 * GRID_H;
					Size = 0.08;
				};
				class groupby_combo: ctrlCombo {
					idc = CT_OSMGROUPBY_IDC;
					x = 10 * GRID_W;
					y = 10 * GRID_H;
					w = 60 * GRID_W;
					h = 8 * GRID_H;
					sizeEx = 0.041;
				};
				class groupby_text: ctrlStatic {
					idc = -1;
					text = $STR_A3_object_select_groupby;
					x = 10 * GRID_W;
					y = 1 * GRID_H;
					w = 60 * GRID_W;
					h = 9 * GRID_H;
					Size = 0.08;
				};
				class search_text: ctrlStatic {
					idc = -1;
					text = $STR_A3_object_select_search;
					x = 150 * GRID_W;
					y = 1 * GRID_H;
					w = 60 * GRID_W;
					h = 9 * GRID_H;
					Size = 0.08;
				};
				class search_edit: compo_edit_base {
					idc = CT_OSMSEARCH_IDC;
					x = 150 * GRID_W;
					y = 10 * GRID_H;
					w = 60 * GRID_W;
					h = 8 * GRID_H;
					sizeEx = 0.041;
				};
				class screen_01: ctrlButtonToolbar {
					idc = CT_SCREEN_01_IDC;
					text = "";
					x = 16 * GRID_W;
					y = 25 * GRID_H;
					w = CT_SCREENSIDE * GRID_W;
					h = CT_SCREENSIDE * GRID_H;
					onMouseEnter = "['in',_this] call CT_fnc_OS_setFocus";
					onMouseExit = "['out',_this] call CT_fnc_OS_setFocus";
					onMouseButtonUp = "_this call CT_fnc_OS_selectObject; true;";
				};
				class screen_02: screen_01 {
					idc = CT_SCREEN_02_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;
				};
				class screen_03: screen_01 {
					idc = CT_SCREEN_03_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;
				};
				class screen_04: screen_01 {
					idc = CT_SCREEN_04_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;
				};
				class screen_05: screen_01 {
					idc = CT_SCREEN_05_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;
				};
				class screen_06: screen_01 {
					idc = CT_SCREEN_06_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;
				};
				class screen_07: screen_01 {
					idc = CT_SCREEN_07_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;
				};
				class screen_08: screen_01 {
					idc = CT_SCREEN_08_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;
				};
				class screen_09: screen_01 {
					idc = CT_SCREEN_09_IDC;
					x = 16 * GRID_W;
					y = (25 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_H;
				};
				class screen_10: screen_09 {
					idc = CT_SCREEN_10_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;
				};
				class screen_11: screen_09 {
					idc = CT_SCREEN_11_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;
				};
				class screen_12: screen_09 {
					idc = CT_SCREEN_12_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;
				};
				class screen_13: screen_09 {
					idc = CT_SCREEN_13_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;
				};
				class screen_14: screen_09 {
					idc = CT_SCREEN_14_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;
				};
				class screen_15: screen_09 {
					idc = CT_SCREEN_15_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;
				};
				class screen_16: screen_09 {
					idc = CT_SCREEN_16_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;
				};
				class screen_17: screen_09 {
					idc = CT_SCREEN_17_IDC;
					x = 16 * GRID_W;
					y = (25 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_H;
				};
				class screen_18: screen_17 {
					idc = CT_SCREEN_18_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;
				};
				class screen_19: screen_17 {
					idc = CT_SCREEN_19_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;
				};
				class screen_20: screen_17 {
					idc = CT_SCREEN_20_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;
				};
				class screen_21: screen_17 {
					idc = CT_SCREEN_21_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;
				};
				class screen_22: screen_17 {
					idc = CT_SCREEN_22_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;
				};
				class screen_23: screen_17 {
					idc = CT_SCREEN_23_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;
				};
				class screen_24: screen_17 {
					idc = CT_SCREEN_24_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;
				};
				class screen_25: screen_17 {
					idc = CT_SCREEN_25_IDC;
					x = 16 * GRID_W;
					y = (25 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_H;
				};
				class screen_26: screen_25 {
					idc = CT_SCREEN_26_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;
				};
				class screen_27: screen_25 {
					idc = CT_SCREEN_27_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;
				};
				class screen_28: screen_25 {
					idc = CT_SCREEN_28_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;
				};
				class screen_29: screen_25 {
					idc = CT_SCREEN_29_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;
				};
				class screen_30: screen_25 {
					idc = CT_SCREEN_30_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;
				};
				class screen_31: screen_25 {
					idc = CT_SCREEN_31_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;
				};
				class screen_32: screen_25 {
					idc = CT_SCREEN_32_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;
				};

				class screen_01_text: ctrlStaticMulti {
					idc = CT_SCREENTEXT_01_IDC;
					x = 16 * GRID_W;
					y = 57 * GRID_H;
					w = CT_SCREENSIDE * GRID_W;
					h = (CT_SCREENSIDE / 5) * GRID_H;
				};
				class screen_02_text: screen_01_text {
					idc = CT_SCREENTEXT_02_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;
				};
				class screen_03_text: screen_01_text {
					idc = CT_SCREENTEXT_03_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;
				};
				class screen_04_text: screen_01_text {
					idc = CT_SCREENTEXT_04_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;
				};
				class screen_05_text: screen_01_text {
					idc = CT_SCREENTEXT_05_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;		
				};
				class screen_06_text: screen_01_text {
					idc = CT_SCREENTEXT_06_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;		
				};
				class screen_07_text: screen_01_text {
					idc = CT_SCREENTEXT_07_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;			
				};
				class screen_08_text: screen_01_text {
					idc = CT_SCREENTEXT_08_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;		
				};
				class screen_09_text: screen_01_text {
					idc = CT_SCREENTEXT_09_IDC;
					x = 16 * GRID_W;
					y = (57 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_H;
				};
				class screen_10_text: screen_09_text {
					idc = CT_SCREENTEXT_10_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;		
				};
				class screen_11_text: screen_09_text {
					idc = CT_SCREENTEXT_11_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;		
				};
				class screen_12_text: screen_09_text {
					idc = CT_SCREENTEXT_12_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;			
				};
				class screen_13_text: screen_09_text {
					idc = CT_SCREENTEXT_13_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;		
				};
				class screen_14_text: screen_09_text {
					idc = CT_SCREENTEXT_14_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;			
				};
				class screen_15_text: screen_09_text {
					idc = CT_SCREENTEXT_15_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;			
				};
				class screen_16_text: screen_09_text {
					idc = CT_SCREENTEXT_16_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;			
				};
				class screen_17_text: screen_09_text {
					idc = CT_SCREENTEXT_17_IDC;
					x = 16 * GRID_W;
					y = (57 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_H;			
				};
				class screen_18_text: screen_17_text {
					idc = CT_SCREENTEXT_18_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;			
				};
				class screen_19_text: screen_17_text {
					idc = CT_SCREENTEXT_19_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;		
				};
				class screen_20_text: screen_17_text {
					idc = CT_SCREENTEXT_20_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;
				};
				class screen_21_text: screen_17_text {
					idc = CT_SCREENTEXT_21_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;
				};
				class screen_22_text: screen_17_text {
					idc = CT_SCREENTEXT_22_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;
				};
				class screen_23_text: screen_17_text {
					idc = CT_SCREENTEXT_23_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;	
				};
				class screen_24_text: screen_17_text {
					idc = CT_SCREENTEXT_24_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;				
				};
				class screen_25_text: screen_17_text {
					idc = CT_SCREENTEXT_25_IDC;
					x = 16 * GRID_W;
					y = (57 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_H;		
				};
				class screen_26_text: screen_25_text {
					idc = CT_SCREENTEXT_26_IDC;
					x = (16 + (CT_SPC_SCR * 1) + (CT_SCREENSIDE * 1)) * GRID_W;			
				};
				class screen_27_text: screen_25_text {
					idc = CT_SCREENTEXT_27_IDC;
					x = (16 + (CT_SPC_SCR * 2) + (CT_SCREENSIDE * 2)) * GRID_W;				
				};
				class screen_28_text: screen_25_text {
					idc = CT_SCREENTEXT_28_IDC;
					x = (16 + (CT_SPC_SCR * 3) + (CT_SCREENSIDE * 3)) * GRID_W;			
				};
				class screen_29_text: screen_25_text {
					idc = CT_SCREENTEXT_29_IDC;
					x = (16 + (CT_SPC_SCR * 4) + (CT_SCREENSIDE * 4)) * GRID_W;	
				};
				class screen_30_text: screen_25_text {
					idc = CT_SCREENTEXT_30_IDC;
					x = (16 + (CT_SPC_SCR * 5) + (CT_SCREENSIDE * 5)) * GRID_W;	
				};
				class screen_31_text: screen_25_text {
					idc = CT_SCREENTEXT_31_IDC;
					x = (16 + (CT_SPC_SCR * 6) + (CT_SCREENSIDE * 6)) * GRID_W;	
				};
				class screen_32_text: screen_25_text {
					idc = CT_SCREENTEXT_32_IDC;
					x = (16 + (CT_SPC_SCR * 7) + (CT_SCREENSIDE * 7)) * GRID_W;		
				};
			};
		};
	};
};













































