#define COMPONENT zeusHC
#include "\z\legio\addons\core\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS

#ifdef DEBUG_ENABLED_ZEUSHC
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ZEUSHC
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ZEUSHC
#endif

// display defines
#define BG_IDC 212453
#define FRAME_IDC 164739
#define OK_IDC 486369
#define CANCEL_IDC 362181

#define BUILD_GROUP_IDD 796475
#define BUILD_GROUP_ADD_IDC 595106
#define BUILD_GROUP_UNITS_IDC 136824
#define BUILD_GROUP_TO_ADD_IDC 158049
#define BUILD_GROUP_REMOVE_IDC 819477
#define BUILD_GROUP_FACTIONS_IDC 149743

#define BUILD_GROUP_DISPLAY (findDisplay BUILD_GROUP_IDD)

#define SPAWN_VIC_IDD 117957
#define SPAWN_VIC_LIST_IDC 330480
#define SPAWN_VIC_FACTIONS_IDC 605453

#define SPAWN_VIC_DISPLAY (findDisplay SPAWN_VIC_IDD)

#define GARRISON_IDD 703765
#define GARRISON_FACTIONS_IDC 232568
#define GARRISON_UNITS_SLIDER_IDC 157831
#define GARRISON_CHANCE_SLIDER_IDC 300285
#define GARRISON_RADIUS_SLIDER_IDC 194578
#define GARRISON_MIN_SLIDER_IDC 213330
#define GARRISON_MAX_SLIDER_IDC 340290
#define GARRISON_UNITS_EDIT_IDC 299047
#define GARRISON_CHANCE_EDIT_IDC 369665
#define GARRISON_RADIUS_EDIT_IDC 87244
#define GARRISON_MIN_EDIT_IDC 556542
#define GARRISON_MAX_EDIT_IDC 259294

#define GARRISON_DISPLAY (findDisplay GARRISON_IDD)

#include "\z\legio\addons\core\script_macros.hpp"
