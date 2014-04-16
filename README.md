Curator Presets Mod
==============

This is an addon for Arma 3 that provides script presets in Zeus (aka Curator) mode in the Modules screen. This mod is very simple but very useful now that Zeus (aka Curator) has been released to Stable. I needed a way to run scripts on objects but not have to give debug console access both in the mission and to users in general. As a result I came up with this mod to help provide some extra utility to Zeus. It's still very basic and needs a ton of work but I wanted to throw it out here for you guys to consume and try out.

Features
========

This mod currently provides a number of utility functions through Zeus-enabled modules. The following is a list of the modules that I currently have implemented.

-	Artillery - Calls for artillery fire from the unit using coordinates, ammo type, and round count
-	CWS Injury Load - Loads Chessmaster's Wounding System onto the unit
-	Damage Component - Damages the unit's component based on the component selected and the damage slider
-	Helicopter Land - Calls the unit to land on the ground
-	Helicopter Hover - Calls the unit to decend low enough to get in
-	Unit Recruitable - Adds an action to the unit that allows players to recruit into their own group
-	Unit Speed - Sets the unit speed to limited, normal, or full based on the selection
-	Unit Surrender - Calls the unit to surrender
-	Vehicle Disembark - Calls the passengers, crew, or all units in the vehicle to disembark
-	Virtual Ammobox System - Loads the Virtual Ammobox System onto the unit/object

Currently these modules are in the Modules screen in Zeus under the Zeus category. I'm still working on a custom category but for now this is where the modules will be.

Known Issues
============

-	Surrendered units become unuseable after surrendering

Changelog
==========

-	v1.5 - Internal UI overhaul, Added Unit Waypoint module (complete), Added Air Flight module (incomplete)
-	v1.4 - Fixed global and persistence of module functions
-	v1.3 - Added Artillery and Vehicle Disembark modules, Fixed mod logo
-	v1.2 - Implemented config dialogs for Component Damage and Unit Speed
-	v1.1 - Added bisign keys, Fixed Curator messages, Added recruit unit module
-	v1.0 - Initial alpha release