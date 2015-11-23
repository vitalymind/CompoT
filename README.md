# CompoT
Arma3 objects placement and manipulation toolset

CompoT is a toolset designed for mission/addon makers to place and manipulate objects. 
CompoT is integrated directly into Eden mission editor, allowing you to place most ArmA 3 
buildings and objects seamlessly, while normal mission making.
 
To play mission made using CompoT, players do not need to have addon installed, 
everything is stored in mission.sqm and/or ct_projects.sqf. Addon is needed only for 
mission making process.
 
CompoT have powerful GUI tools to utilize objects added by other addons, as example 
it is natively compatible with CUP objects, which is 3500 additional objects.
 
CompoT`s cornerstone is randomization. With CompoT, mission/addon makers are able to 
significantly increase replayability and overall variability of their missions, by adding 
certain level of battle field randomization.
 
CompoT is aiming to support as much of community tools and utilities as it possibly can. 
If you like to have CompoT`s functionality in your own project/addon/what-ever-you-are-doing, 
please don’t hesitate to contact me, I will be happy to help integrate CompoT in your project.

# HOW TO BUILD
1) Pack CompoT folder with you prefered PBO tool. 
   1.1) Make sure your PBO tool is able to read $PREFIX$ file. If addon prefix is not set 
   correctly with included file $PREFIX$, use method supported by your PBO tool to add prefix 
   to PBO file. prefix is "compsition_tool". 
2) Place CompoT.pbo in ..\@compot\addons\CompoT.pbo 

3) Start game with @compot addon.
