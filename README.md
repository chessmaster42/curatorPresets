Curator Presets Mod
===================

This is an addon for Arma 3 that provides script presets in Zeus (aka Curator) mode in the Modules screen. This mod is very simple but very useful now that Zeus (aka Curator) has been released to Stable. I needed a way to run scripts on objects but not have to give debug console access both in the mission and to users in general. As a result I came up with this mod to help provide some extra utility to Zeus. It's still very basic and needs a ton of work but I wanted to throw it out here for you guys to consume and try out.

Module Features
===============

Core
----
-	Air Flight - Allows setting of flight height and speed for flying vehicles
-	Artillery - Calls for artillery fire from the unit using coordinates, ammo type, and round count
-	Damage Component - Damages the unit's component based on the component selected and the damage slider
-	Spawn Garrison - Spawns a garrison of units at the given location based on some config params (use with caution!)
-	Vehicle Disembark - Calls the passengers, crew, or all units in the vehicle to disembark

System
------
-	CPM Config - Basic config dialog for the mod
-	Task Force Radio - Basic config for the TFR voip addon. Support for other voip methods and more TFR options will come later
-	Virtual Ammobox System - Loads the Virtual Ammobox System onto the unit/object

Unit
----
-	Unit Action - Runs an action on the unit
-	Unit Animation - Plays an animation on the unit
-	Unit Chat - Sends a text chat message through the unit
-	Unit Recruitable - Adds an action to the unit that allows players to recruit into their own group
-	Unit Skills - Sets the precise skills for the unit
-	Unit Surrender - Calls the unit to surrender
-	Unit Teleport - Teleports the unit to the given coordinates

Non-Module Features
===================

-	Waypoint Handler - Ctrl+Shift+RMB - Custom waypoint dialog to setup non-standard waypoints
-	Waypoint Type 'Land' - Fleeing is disabled and vehicle will land and shut down
-	Waypoint Type 'Land - Get In' - Fleeing is disabled and vehicle will come to a hover a few meters off of the ground
-	Waypoint Type 'Search Buildings' - Unit/Group will search through all positions in the building nearest to the waypoint when placed. Groups will divide up the task as evenly as possible and will spread out to cover all building positions.
-	Custom Module Category - Modules are now located within a custom category labeled "Curator Presets" in the Create side bar. This was a huge pain in the rear to get working and is still buggy but it's a step in the right direction

Notes
=====

-	Spawn Garrison is limited to 150 units and 25 groups. Once at the unit limit no more will spawn. Once at the group limit all future units will be added to the last group.
-	Unit Animation is not yet complete and as such will not do anything yet.
-	Search Buildings is new and buggy. Please let me know of any suggestions you have or bugs you find.

Known Issues
============

-	Units will not always obey when Unit Action is called on them (seems to be limited to specific action types but maybe a locality issue)
-	Clicking on custom sub-categories for modules will put a non-functioning module object on the cursor. Just right-click it away to continue

Changelog
==========

-	v1.9
		-	Created new mod "Chessmaster's Common Library" that houses many common functions and UI elements for both CPM and CWS (this will also have a separate release later)
		-	Created new mod version of CWS (this will have a separate release later)
		-	Fixed icon and improved functionality of TaskForceRadio module
		-	CWS icons over units in Zeus screen now have bleeding percentage as well has healing progress percentage
		-	Overhauled the waypoint handler to use the new Ctrl+Shift+RMB key combo for placing the custom waypoints
		-	Fixed innumerable bugs and improved AI in CWS dramatically
		-	Overhauled bleeding system in CWS. Bleeding pausing while being healed is now much more reliable
		-	Added Failsafe Reload Module to both CWS and CPM. Putting this down will cause a full reload of the respective mod
		-	Improved the AI behaviour in 'Search Building' waypoint type. It is now distance sorted and more reliable
		-	And many more misc things ...
-	v1.8.1 Released
		-	Added CWS icons above units when they have CWS loaded. Color is white a full heath and red when injured
		-	Fixed bug with losing custom category of modules when closing and re-opening the curator display
		-	Added 'CPM Failsafe Module' to the old 'Zeus' category that can be placed to do a forced reload of the mod
		-	Added more functionality to 'ShowMessage' function
		-	More minor tweaks working towards fixing the module on cursor bug for the CPM module sub-categories
-	v1.8 Released
		-	Added 'Search Building' waypoint type
		-	Added 'Task Force Radio' module
		-	Added 'Unit Skills' module that gives access to all 10 AI skills for a unit
		-	Added custom category for CPM modules
		-	Added 'Applies To' option to most unit-based modules so that module can be applies to unit, group, faction, or even players (depends on module)
		-	Reorganized config files
		-	Reorganized most script files
		-	Fixed some issues with Unit Surrender
		-	Overflow units from 'Spawn Garrison' are now grouped with the nearest group instead of the last created group
		-	Drop-down UI elements are now much more accessible
		-	Slider UI elements now show the current value in the tooltip text
		-	Disabled fleeing for "Land" or "Land - Get In" waypoint type
		-	Major UI overhauls
-	v1.7.1 - Fixed some critical problems in the new Spawn Garrison module
-	v1.7 - Added Spawn Garrison module
-	v1.6 - Added Unit Action module, Added Unit Animation module (incomplete), Added Unit Chat module, Improved Unit Surrender module, Changed list boxes to combo boxes, Misc UI improvements
-	v1.5 - Internal UI overhaul, Added Air Flight module, Added waypoint placement handler
-	v1.4 - Fixed global and persistence of module functions
-	v1.3 - Added Artillery and Vehicle Disembark modules, Fixed mod logo
-	v1.2 - Implemented config dialogs for Component Damage and Unit Speed
-	v1.1 - Added bisign keys, Fixed Curator messages, Added recruit unit module
-	v1.0 - Initial alpha release
