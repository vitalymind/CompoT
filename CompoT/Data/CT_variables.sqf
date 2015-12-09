/* 
   File: CT_variables.sqf
   Function: 
   Folder: Data 
   Scope: 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 

//KEYBOARD & MOUSE HANDLING
ct_var_holdenKeys = [false,false,false,false,false,false,false,false,false];

//CAMERA
ct_var_camSpeed = 0.4;
ct_var_camIsMoving = false;
ct_var_camIsRotating = false;

//CURSOR
ct_var_cursor = objNull;
ct_var_cursorTool = "";
ct_var_cursorMoving = true;
ct_var_valueBeingChanged = "rotateAngle";
CT_var_stickToObjectMode = false;

//MOUSE CURSOR
ct_var_mouseCursorActive = false;
ct_var_mousePos = [0.5,0.5];

//SELECT TOOL
ct_var_sel = [];
ct_var_selectedClone = objNull;
ct_var_selectToolSize = "big";
ct_var_cursorBestSelect = objNull;
ct_var_rotateMode = "individual";

//BUILD TOOL
ct_var_slopeMode = false;
ct_var_buildToolEmpty = false;
ct_var_buildToolCamMoved = false;
ct_var_buildToolAngle = 0;
ct_var_buildToolHeight = 0;
ct_var_builtObjects = [];
ct_var_builtPivots = [];
ct_var_builtPreview = [];
ct_var_buildMode = [["object",0,0],[0,0],[0,0],[0,0],[0,0]];
ct_var_btc = []; 
ct_var_disableSim = true;

//CLIPBOARD
ct_var_clipboard = [];

//LIBRARY
ct_var_usedNames = [];

//DRAW
ct_var_drawOrders = [];
ct_var_drawOrderId = 0;

//IMPORT MENU GUI
ct_var_IM_importOptions = [];

//BUILDTOOL SELECT GUI
ct_var_buildToolGUIShown = false;
ct_var_buildToolSelected = "";

//GENERAL GUI
ct_var_openedGUI = false;
ct_var_curGUIMode = "info+cursorControls";

//OBJECT SELECTION GUI
ct_var_OS_grouping = "category";
ct_var_OS_shownObjects = [];
ct_var_OS_shownSearchResults = [];
ct_var_OS_scrollPos = 0;
ct_var_OS_searchScrollPos = 0;
ct_var_OS_searchText = "";
ct_var_OS_searchThreadHandle = scriptNull;

//INFO GUI
ct_var_infoGuiVisible = false;
ct_var_controlsGuiVisible = false;
ct_var_GUIdelayCounter = 0;

//OBJECT LIBRARY GUI
ct_var_ObL_previewDistance = 2;
ct_var_ObL_activeCtrl = "list";
ct_var_ObL_selection = "content";

//COMPOSITION LIBRARY GUI
ct_var_CmL_selection = [0,0, "left"];
ct_var_CmL_camPos = [];

//COLLECTION LIBRARY
ct_var_CiL_objects = [[],[]];
ct_var_CiL_selection = "collection";

//PREFAB LIBRARY
ct_var_PrL_compositions = [[],[]];
ct_var_PrL_selection = "prefab";

//DEFAULT CONFIGS
ct_var_rotateAngle = 5;
ct_var_selectRange = 5;
ct_var_heightChange = 0.1;
ct_var_radiusChange = 1;
ct_var_mods = ["STD"];

//LIBRARIES
ct_var_objects = [];
ct_var_compositions = [];
ct_var_collections = [];
ct_var_prefabs = [];
ct_var_projects = [];

ct_var_mainPivot = objNull;