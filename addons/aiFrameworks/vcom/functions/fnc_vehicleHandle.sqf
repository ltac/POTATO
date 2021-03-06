#include "script_component.hpp"
TRACE_1("params",_this);

params ["_unit"];

private _nearestEnemy = [_unit] call VFUNC(closestEnemy);
if (isNull _nearestEnemy) exitWith {};

private _unitVehicle = vehicle _unit;
private _cargoList = assignedCargo _unitVehicle;
private _unitGroup = group _unit;
private _unitGroupLeader = leader _unitGroup;

if (VGVAR(dismountBeforeEnemies)
        && {(_nearestEnemy distance _unit) < VGVAR(dismountBeforeEnemiesDistance)}
        && {(count _cargoList) > 0}) then {

    [_unitVehicle,_cargoList] spawn {
        params ["_unitVehicle","_cargoList"];

        (driver _unitVehicle) land "GET OUT";
        _unitVehicle land "GET OUT";

        if ((getPos _unitVehicle select 2) >= 3) then {
            waitUntil { sleep 1; (getPos _unitVehicle select 2) < 3 };
        };

        {
            unassignVehicle _x;
            commandGetOut _x;
            doGetOut _x;
            [_x] orderGetIn false;
            _x action ["eject", _unitVehicle];
            nil
        } count _cargoList;
    };
};

if (_unit getVariable [VQGVAR(allowFlankingUnit),false]
        && {(side _unit) in VGVAR(movementEnabledSides)}
        && {[_unit,VQGVAR(flanking),VGVAR(flankThreshold)] call VFUNC(pastThreshold)}
        && {(count (waypoints _unitGroup)) < 2}) then {
    [_unit] call VFUNC(flankManeuver);

    if (_unitGroupLeader == _unit) then {
        _unit doMove getWPPos [_unitGroup, currentWaypoint _unitGroup];
    } else {
        _unit doFollow _unitGroupLeader;
    };
};
