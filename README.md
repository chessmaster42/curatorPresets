Curator Presets Mod
===================

This is an addon for Arma 3 that provides script presets in Zeus (aka Curator) mode in the Modules screen. This mod is very simple but very useful now that Zeus (aka Curator) has been released to Stable. I needed a way to run scripts on objects but not have to give debug console access both in the mission and to users in general. As a result I came up with this mod to help provide some extra utility to Zeus. It's still very basic and needs a ton of work but I wanted to throw it out here for you guys to consume and try out.

Features
========

This mod currently provides a number of utility functions through Zeus-enabled modules. The following is a list of the modules that I currently have implemented.

-	Air Flight - Allows setting of flight height for flying vehicles
-	Artillery - Calls for artillery fire from the unit using coordinates, ammo type, and round count
-	CWS Injury Load - Loads Chessmaster's Wounding System onto the unit
-	Damage Component - Damages the unit's component based on the component selected and the damage slider
-	Spawn Garrison - Spawns a garrison of units at the given location based on some config params (use with caution!)
-	Unit Action - Runs an action on the unit
-	Unit Animation - Plays an animation on the unit
-	Unit Chat - Sends a chat message through the unit
-	Unit Recruitable - Adds an action to the unit that allows players to recruit into their own group
-	Unit Speed - Sets the unit speed to limited, normal, or full based on the selection
-	Unit Surrender - Calls the unit to surrender
-	Vehicle Disembark - Calls the passengers, crew, or all units in the vehicle to disembark
-	Virtual Ammobox System - Loads the Virtual Ammobox System onto the unit/object

I have also implemented non-module feature(s) that are listed below

-	Waypoint Handler - When a waypoint is placed in Zeus (RMB by default) you will get a config popup to set the waypoint type. This is skipped for get-in or destroy orders.

Currently these modules are in the Modules screen in Zeus under the Zeus category. I'm still working on a custom category but for now this is where the modules will be.

Notes
=====

-	Spawn Garrison is limited to 100 units and 50 groups. Once at the unit limit no more will spawn. Once at the group limit all future units will be added to the last group
-	Unit Animation is not yet complete and as such will not do anything yet

Known Issues
============

-	Some UI elements must be clicked on to initialize
-	Guard waypoint type spawns a trigger and icon that can't yet be removed
-	Units will not always obey when Unit Action is called on them (seems to be limited to specific action types)
-	Unit Surrender module doesn't remove action when action is used
-	Surrendered units that have been secured appear to sometimes have animation/movement issues

Changelog
==========

-	v1.7.2 (Not Released Yet) - Fixed some issues with Unit Surrender, Disabled fleeing for a vehicle when given a "Land" or "Land - Get In" waypoint type (goes back when waypoint is completed)
-	v1.7.1 - Fixed some critical problems in the new Spawn Garrison module
-	v1.7 - Added Spawn Garrison module
-	v1.6 - Added Unit Action module, Added Unit Animation module (incomplete), Added Unit Chat module, Improved Unit Surrender module, Changed list boxes to combo boxes, Misc UI improvements
-	v1.5 - Internal UI overhaul, Added Air Flight module, Added waypoint placement handler
-	v1.4 - Fixed global and persistence of module functions
-	v1.3 - Added Artillery and Vehicle Disembark modules, Fixed mod logo
-	v1.2 - Implemented config dialogs for Component Damage and Unit Speed
-	v1.1 - Added bisign keys, Fixed Curator messages, Added recruit unit module
-	v1.0 - Initial alpha release