#define pixelScale	1.25
#define pixelGrid 4
#define GRID_W (pixelW * pixelScale * pixelGrid)
#define GRID_H (pixelH * pixelScale * pixelGrid)

#define CT_OPTIONMENU_W 192
#define CT_OPTIONMENU_H 108

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

class ct_optionMenu {
	name = "ct_optionMenu";
	idd = 25264;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls {
		class menu: ct_controlGroupNoScrollBar_base {
			idc = -1;
			x = (safezoneX + (safezoneW / 2)) - ((CT_OPTIONMENU_W / 2) * GRID_W);
			w = CT_OPTIONMENU_W * GRID_W;
			y = (safezoneY + (safezoneH / 2)) - ((CT_OPTIONMENU_H / 2) * GRID_H);
			h = CT_OPTIONMENU_H * GRID_H;
			class Controls {
				class frame: ct_background_base {
					idc = -1;
					style = 64;
					colorText[] = {1,1,1,1};
					x = 0;
					w = CT_OPTIONMENU_W * GRID_W;
					y = 0;
					h = CT_OPTIONMENU_H * GRID_H;
				};
  				class background: ct_background_base {
					idc = -1;
					x = 0;
					w = CT_OPTIONMENU_W * GRID_W;
					y = 0;
					h = CT_OPTIONMENU_H * GRID_H;
				};
				class tabs: ct_controlGroupNoScrollBar_base {
					idc = -1;
					x = 0;
					w = CT_OPTIONMENU_W * GRID_W;
					y = 0;
					h = 10 * GRID_H;
					class Controls {
						class background: ct_background_base {
							idc = -1;
							x = 0;
							w = CT_OPTIONMENU_W * GRID_W;
							y = 0;
							h = 10 * GRID_H;
							colorBackground[] = {0.5,0.5,0.5,0.4};
						};
						class button_general: ct_button_base {
							idc = CT_GENERALBUT_IDC;
							x = GRID_W;
							w = 40 * GRID_W;
							y = GRID_H;
							h = 8 * GRID_H;
							text = $STR_A3_option_menu_general_tab;
							colorFocused[] = { 1, 0.537, 0, 0.54 }; 
						};
						class button_tutorials: ct_button_base {
							idc = CT_TUTORIALBUT_IDC;
							x = 42 * GRID_W;
							w = 40 * GRID_W;
							y = GRID_H;
							h = 8 * GRID_H;
							text = $STR_A3_option_menu_tutorials_tab;
							colorFocused[] = { 1, 0.537, 0, 0.54 }; 
						};
					};
				};
				class separator_1: ct_background_base {
					x = 0;
					w = CT_OPTIONMENU_W * GRID_W;
					y = 10 * GRID_H;
					h = 0.5	* GRID_H;
					colorBackground[] = {0.6,0.6,0.6,1}; 
				};
				class sliders: ct_controlGroupNoScrollBar_base {
					idc = CT_SLIDERSGROUP_IDC;
					x = 1 * GRID_W;
					w = ((CT_OPTIONMENU_W / 2) - 1) * GRID_W;
					y = 11 * GRID_H;
					h = (CT_OPTIONMENU_H - 12) * GRID_H;
					class Controls {
						class frame_1: frame {
							text = $STR_A3_option_menu_manipulation_sliders;
							x = 0;
							w = ((CT_OPTIONMENU_W / 2) - 1) * GRID_W;
							y = 0;
							h = 58 * GRID_H;
						};
						class rotateText: ct_text_base {
							text = $STR_A3_option_menu_sliders_rotation_text;
							x = 1 * GRID_W;
							w = 50 * GRID_W;
							y = 4 * GRID_H;
							h = 5 * GRID_H;
						};
						class rotateSlider: ct_slider {
							idc = CT_SLIDERSROTATESLIDER_IDC;
							x = 1 * GRID_W;
							w = ((CT_OPTIONMENU_W / 2) - 3) * GRID_W;
							y = 10 * GRID_H;
							h = 5 * GRID_H;
							sliderRange[] = {0.001, 180};
							sliderPosition = 0;
							pageSize = 1;
						};
						class rotateEdit: ct_edit_base {
							idc = CT_SLIDERSROTATEEDIT_IDC;
							x = ((CT_OPTIONMENU_W / 2) - 18) * GRID_W;
							w = 15 * GRID_W;
							y = 4 * GRID_H;
							h = 5 * GRID_H;
							sizeEx = 0.034;
							tooltip = $STR_A3_option_menu_slider_edit_tooltip;
						};						
						class heightText: rotateText {
							text = $STR_A3_option_menu_sliders_height_text;
							y = 17 * GRID_H;
						};
						class heightSlider: rotateSlider {
							idc = CT_SLIDERSHEIGHTSLIDER_IDC;
							y = 23 * GRID_H;
							sliderRange[] = {0.001, 20};
						};
						class heightEdit: rotateEdit {
							idc = CT_SLIDERSHEIGHTEDIT_IDC;
							y = 17 * GRID_H;
						};
						class radiusText: rotateText {
							text = $STR_A3_option_menu_sliders_radius_text;
							y = 30 * GRID_H;
						};
						class radiusSlider: rotateSlider {
							idc = CT_SLIDERSRADIUSSLIDER_IDC;
							y = 36 * GRID_H;
							sliderRange[] = {0.001, 30};
						};
						class radiusEdit: rotateEdit {
							idc = CT_SLIDERSRADIUSEDIT_IDC;
							y = 30 * GRID_H;
						};
						class selectText: rotateText {
							text = $STR_A3_option_menu_sliders_select_text;
							y = 43 * GRID_H;
						};
						class selectSlider: rotateSlider {
							idc = CT_SLIDERSSELECTSLIDER_IDC;
							y = 49 * GRID_H;
							sliderRange[] = {0.001, 50};
						};
						class selectEdit: rotateEdit {
							idc = CT_SLIDERSSELECTEDIT_IDC;
							y = 43 * GRID_H;
						};
						class frame_2: frame_1 {
							text = $STR_A3_option_menu_camera_sliders;
							y = 59 * GRID_H;
							h = 33 * GRID_H;
						};
						class camRotateText: rotateText {
							text = $STR_A3_option_menu_sliders_camRotate_text;
							y = 63 * GRID_H;
						};
						class camRotateSlider: rotateSlider {
							idc = CT_SLIDERSCAMROTATIONSLIDER_IDC;
							y = 69 * GRID_H;
							sliderRange[] = {0.001, 5};
						};
						class camRotateEdit: rotateEdit {
							idc = CT_SLIDERSCAMROTATIONEDIT_IDC;
							y = 63 * GRID_H;
						};
						class camMoveText: rotateText {
							text = $STR_A3_option_menu_sliders_camMove_text;
							y = 76 * GRID_H;
						};
						class camMoveSlider: rotateSlider {
							idc = CT_SLIDERSCAMMOVESLIDER_IDC;
							y = 82 * GRID_H;
							sliderRange[] = {0.001, 10};
						};
						class camMoveEdit: rotateEdit {
							idc = CT_SLIDERSCAMMOVEEDIT_IDC;
							y = 76 * GRID_H;
						};
					};
				};
				class toggles: ct_controlGroupNoScrollBar_base {
					idc = CT_TOGGLESGROUP_IDC;
					x = (CT_OPTIONMENU_W / 2) * GRID_W;
					w = ((CT_OPTIONMENU_W / 2) - 1) * GRID_W;
					y = 11 * GRID_H;
					h = (CT_OPTIONMENU_H - 12) * GRID_H;
					class controls {
						class frame_1: frame {
							text = $STR_A3_option_menu_toggles;
							x = 1 * GRID_H;
							w = ((CT_OPTIONMENU_W / 2) - 3) * GRID_W;
							y = 0;
							h = 17 * GRID_H;
						};
						class unitSimToggle : ctrlCheckboxToolbar {
							idc = CT_TOGGLESUNITSIM_IDC;
							onLoad = "";
							tooltip = "$STR_A3_ct_eden_gui_toggleUnitSim_hint";
							textureChecked = "composition_tool_data\data\UI\ct_unitSim_on.paa";
							textureUnchecked = "composition_tool_data\data\UI\ct_unitSim_off.paa";
							textureFocusedChecked = "composition_tool_data\data\UI\ct_unitSim_on.paa";
							textureFocusedUnchecked = "composition_tool_data\data\UI\ct_unitSim_off.paa";
							textureHoverChecked = "composition_tool_data\data\UI\ct_unitSim_on.paa";
							textureHoverUnchecked = "composition_tool_data\data\UI\ct_unitSim_off.paa";
							texturePressedChecked = "composition_tool_data\data\UI\ct_unitSim_on.paa";
							texturePressedUnchecked = "composition_tool_data\data\UI\ct_unitSim_off.paa";
							textureDisabledChecked = "composition_tool_data\data\UI\ct_unitSim_on.paa";
							textureDisabledUnchecked = "composition_tool_data\data\UI\ct_unitSim_off.paa";
							x = 2.66 * GRID_W;
							w = 10 * GRID_W;
							y = 5 * GRID_H;
							h = 10 * GRID_H;
						};
						class objectsSimToggle : ctrlCheckboxToolbar {
							idc = CT_TOGGLESOBJECTSIM_IDC;
							onLoad = "";
							tooltip = "$STR_A3_ct_eden_gui_toggleObjectsSim_hint";
							textureChecked = "composition_tool_data\data\UI\ct_objectsSim_on.paa";
							textureUnchecked = "composition_tool_data\data\UI\ct_objectsSim_off.paa";
							textureFocusedChecked = "composition_tool_data\data\UI\ct_objectsSim_on.paa";
							textureFocusedUnchecked = "composition_tool_data\data\UI\ct_objectsSim_off.paa";
							textureHoverChecked = "composition_tool_data\data\UI\ct_objectsSim_on.paa";
							textureHoverUnchecked = "composition_tool_data\data\UI\ct_objectsSim_off.paa";
							texturePressedChecked = "composition_tool_data\data\UI\ct_objectsSim_on.paa";
							texturePressedUnchecked = "composition_tool_data\data\UI\ct_objectsSim_off.paa";
							textureDisabledChecked = "composition_tool_data\data\UI\ct_objectsSim_on.paa";
							textureDisabledUnchecked = "composition_tool_data\data\UI\ct_objectsSim_off.paa";
							x = 14.32 * GRID_W;
							w = 10 * GRID_W;
							y = 5 * GRID_H;
							h = 10 * GRID_H;
						};
					};
				};
				class tutorials: ct_controlGroupNoScrollBar_base {
					idc = CT_TUTORIALSGROUP_IDC;
					x = 0;
					w = CT_OPTIONMENU_W * GRID_W;
					y = 11 * GRID_H;
					h = (CT_OPTIONMENU_H - 12) * GRID_H;
					class Controls {
						class frame: frame {
							text = $STR_A3_option_menu_tutorials_text;
							x = 1 * GRID_W;
							w = (CT_OPTIONMENU_W - 2) * GRID_W;
							y = 0 * GRID_H;
							h = (CT_OPTIONMENU_H - 13) * GRID_H;
						};
					};
				};
			};
		};
	};
};
