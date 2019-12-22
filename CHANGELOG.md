# Changelog

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
