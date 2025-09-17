# Changelog

## Unreleased

- Move ANSI map to its own console.

## v1.2

Lots of updates!

- Bugfix: Rewrote the SCORE capture system. The issue with text being "eaten"
  - on startup for certain characters has been fixed. This was mainly affecting
  - characters with only one class.
- Bugfix: Corrected issues with the room descriptions missing letters when the
  - ANSI map was being captured.
- Added Global Junkyards to the Timers in the left console.
- Added the `uigetclasses` command to refresh class variables manually if desired.
- Added and updated several function to eliminate errors related to nil or blank variables.
- Added various functions and outputs related to the unreleased
  - "ErionMud GamePack" package. This should not affect profiles without the GamePack.
- Updated the ANSI Map and Exits capture system.
- Updated several regex triggers and their names.
- Updated Comments throughout the code to better explain functionality.
- Updated the left console dimensions to improve layout.
- Updated the Pet section of the bottom bar to include a health bar
  - for your lowest pet's health. The Pet line will be blank if the current
  - character does not have pets.
- Updated misc visuals.

## v1.1.1

- Bugfix: Enabled trigger "Expedition end"

## v1.1

### Package

- Added Expedition and Junkyard details to the top console.
- Moved "Pets" to their own line in the bottom console.
- Disabled all consoles from scrolling except for the right (chat) and the top.
- Separated chat captures into different triggers for easier control.
- Added new chat channels to the chat console.
- Updated several regex triggers.
- Updated and cleaned comments.
- Updated logo.

### Project

- Added `BUILD.md` to assist with building your own package.
- Updated `README.md`.
- Added `CHANGELOG.md` (this file).

## v1.0

- Initial release
