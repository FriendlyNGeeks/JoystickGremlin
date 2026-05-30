@echo "Starting to build Gremlin ..."
cd /d %0\..
set WIX_BIN=%CD%\.tools\wix\pkg\tools
if not exist "%WIX_BIN%\candle.exe" set WIX_BIN=C:\Program Files (x86)\WiX Toolset v3.11\bin

@echo "Building executable ..."
pyinstaller -y --clean joystick_gremlin.spec

@echo "Generating WIX ..."
python generate_wix.py
copy /Y joystick_gremlin.wxs dist\joystick_gremlin.wxs

@echo "Building MSI installer ..."
cd dist
del /Q PFiles
del joystick_gremlin.wixobj
del joystick_gremlin.wixpdb
del joystick_gremlin.msi
"%WIX_BIN%\candle.exe" joystick_gremlin.wxs
"%WIX_BIN%\light.exe" -ext WixUiExtension joystick_gremlin.wixobj

cd ..

@pause
