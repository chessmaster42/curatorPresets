// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ['_unit','_fa_action','_drag_action'];
_unit = _this select 0;

//Add the First Aid and Drag actions to the unit
_fa_action = _unit addAction [
	format["<t color='#F00000'>First Aid to %1</t>", name _unit],
	{_this spawn cws_fnc_firstAid}, _unit, 100, false, true, "",
	"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && alive _target && vehicle _target == _target"
];
_drag_action = _unit addAction [
	format["<t color='#FC9512'>Drag %1</t>", name _unit],
	{_this spawn cws_fnc_drag}, _unit, 100, false, true, "",
	"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && alive _target && vehicle _target == _target"
];

//Save the action handles so that we can easily clean up later
_unit setVariable ["fa_action", _fa_action, false];
_unit setVariable ["drag_action", _drag_action, false];