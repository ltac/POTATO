/*
 * Author: AACO
 * Function to pass a remote call to a HC (or server if no HC is available)
 *
 * Arguments:
 * 0: Parameters for passed through function <ANY>
 * 1: Function to be passed to the HC (or server if no HC is available) <STRING>
 * 2: Should this function be spawned instead of called on the remote machine? (optional, default false) <BOOL>
 * 3: Should this function exit if not called on server? (optional, default false) <BOOL>
 *
 * Return Value:
 * nil if there was an error, otherwise an empty string <ANY>
 *
 * Examples:
 * ["test hint", "hint"] call legio_zeusHC_fnc_hcPassthrough;
 * [[], "legio_zeusHC_fnc_buildACache"] call legio_zeusHC_fnc_hcPassthrough;
 * [[], "legio_zeusHC_fnc_buildACache",true] call legio_zeusHC_fnc_hcPassthrough;
 *
 * Public: Yes
 */

#include "script_component.hpp"

TRACE_1("params",_this);
params ["_remoteParameters", "_functionToCall", ["_spawn", false, [false]], ["_exitIfNotServer", false, [false]]];

if (isServer) exitWith {
    if (_spawn) then {
        _remoteParameters remoteExec [_functionToCall, [] call FUNC(getSpawnMachineId)]
    } else {
        _remoteParameters remoteExecCall [_functionToCall, [] call FUNC(getSpawnMachineId)]
    };
};

if (_exitIfNotServer) exitWith {
    ERROR("_exitIfNotServer is true, but not executed on the server");
    nil
};

[_remoteParameters, _functionToCall, _spawn, true] remoteExecCall [QFUNC(hcPassthrough), SERVER_CLIENT_ID]
