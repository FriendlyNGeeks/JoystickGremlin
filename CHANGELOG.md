# Changelog

## Unreleased

- Fixed the frozen Windows build so `dill.dll` initializes from a writable
  working directory before the app switches back to the install folder.
- Bundled required frozen-app runtime dependencies, including `msvcp140.dll`
  and `Qt6Multimedia.dll`, so `dill.dll` and `QtTextToSpeech` load correctly.
- Updated WiX generation for the PyInstaller `_internal` layout, stable
  WiX-safe identifiers, the current `version.json` version, and fresh MSI
  ProductCodes.
- Added first-time build instructions and frozen build troubleshooting notes to
  the README.
- Replaced the startup tray toggle with a `Startup behavior` selection:
  `Normal`, `Minimized`, or `System Tray`.
- Added a `Close behavior` toggle controlling whether the close button
  minimizes the app to the system tray.
- Added single-instance startup handling so launching Joystick Gremlin again
  restores the existing window and exits the new process.
