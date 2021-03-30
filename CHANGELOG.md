# Changelog

## [Unreleased]
### Added
- Athena hack to hide other players

  Hides other units and vehicles except the player and player's vehicle from
  Athena by default. Follows a missionNamespace variable "ath_all_data" to
  determine whether all data should be displayed.

## [1.11.0] - 2020-08-13
### Added
- Keybind for Earplugs volume control.

### Fixed
- Fix error message caused by calling earplugs from preInit.

## [1.10.0] - 2020-08-13
### Added
- Earplugs volume control function working with ACE Earplugs.

## [1.9.0] - 2020-07-28
### Added
- Alice Webbing vest (by Caboose).

## [1.8.2] - 2020-07-17
### Fixed
- Remove unnecessary line.

## [1.8.1] - 2020-07-10
### Fixed
- Fix modules dependency on Achilles.

## [1.8.0] - 2020-07-09
### Added
- A patch to remove a duplicate default keybind introduced by TFAR Animations.

## [1.7.0] - 2020-06-11
### Added
- Extra uniforms and vests (by Caboose).

## [1.6.0] - 2020-04-29
### Added
- A patch to prevent under barrel smoke grenades from bouncing (by Caboose).

## [1.5.1] - 2020-04-10
### Fixed
- Fix fortification boxes not showing up in zeus.

## [1.5.0] - 2020-04-06
### Added
- `fn_moduleSpawnFortificationBoxLarge` zeus module to spawn a large fortification box.
- `fn_moduleSpawnFortificationBoxSmall` zeus module to spawn a small fortification box.

## [1.4.3] - 2020-03-24
### Fixed
- Forgot to include bikey.

## [1.4.2] - 2020-03-23
### Fixed
- Forgot to rePBO the `zeusops_addon` in the last fix. Yikes.

## [1.4.1] - 2020-03-22
### Fixed
- Fix Custom dynamic groups functions calling functions with the wrong prefix.

## [1.4.0] - 2019-12-22
### Added
- Custom dynamic groups functions that don't show if people are dead, and don't show random insignia's.

## [1.3.0] - 2019-10-06
### Added
- Icons for all modules.

### Fixed
- Bodybag and respawn module not working because of using 'exitWith' after an if statement instead of 'then'.

## [1.2.3] - 2019-09-16
### Fixed
- Arsenal & rearm modules not sending curator messages.
- Modules placed in editor causing error because `fn_getUnitUnderCursor` uses a variable that doesn't exist yet.

## [1.2.2] - 2019-09-14
### Fixed
- Forgot to repack the addon in 1.2.1.

## [1.2.1] - 2019-09-14
### Fixed
- `fn_moduleToggleRespawn` was not exiting when not local instance.

## [1.2.0] - 2019-09-14
### Added
- `fn_moduleForceRespawnWave` zeus module to force a respawn wave.
- `fn_moduleToggleRespawn` zeus module to toggle all respawns (both wave and auto). Enabling respawn also triggers a wave immediately.

## [1.1.1] - 2019-09-08
### Fixed
- Player spectator camera not on player when bodybagged with module.
- Curator feedback messages showing up, only to the actor.

## [1.1.0] - 2019-09-07
### Added
- `fn_moduleBodybagAndRespawnPlayer` zeus module to bodybag and respawn players, including alive/unconscious players.
- `fn_respawnPlayer` to be able to respawn a player remotely, made for the zeus module.
- `fn_showCuratorMessage` to  simplify curator feedback messages (which don't work in MP for an unknown reason).

## [1.0.1] - 2019-09-05
### Fixed
- functions not packed into addon.

## [1.0.0] - 2019-09-05
### Added
- `fn_moduleBodybagPlayer` zeus module to bodybag players, including alive/unconscious players.
- `fn_moduleRespawnPosition` zeus module to move the respawn position, visible with a marker on the map.
- `fn_moduleSpawnArsenalBox` zeus module to spawn an arsenal box.
- `fn_moduleSpawnRearmBox` zeus module to spawn a rearm box.
