// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ['_unit'];
_unit = _this select 0;

_unit removeAction (_unit getVariable "fa_action");
_unit removeAction (_unit getVariable "drag_action");
_unit setVariable ["fa_action",nil];
_unit setVariable ["drag_action",nil];
if (!isNil {_unit getVariable "drag_action"}) then {
	_unit removeAction (_unit getVariable "drop_action");
	_unit setVariable ["drop_action",nil];
};
if (!isNil {_unit getVariable "carry_action"}) then {
	_unit removeAction (_unit getVariable "carry_action");
	_unit setVariable ["carry_action",nil];
};