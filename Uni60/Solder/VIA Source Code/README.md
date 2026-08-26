# Velvet Pro — VIA Firmware

This is the VIA-compatible firmware for the Velvet Pro PCB.

## Option 1: Just flash it (recommended)

If you don't need to change anything, use the pre-compiled `velvet_pro_firmware_via.bin`

1. Download [QMK Toolbox](https://github.com/qmk/qmk_toolbox/releases).
2. Open QMK Toolbox, click 'Open' and open the `velvet_pro_firmware_via.bin` file
3. Plug in the PCB while holding ESC, or the BOOT button on the back. A yellow message like 'STM32 DFU device connected (WinUSB): STMicroelectronics STM32  BOOTLOADER' should appear.
4. Click 'Flash' and wait for it to complete.
5. Once flashed, see 'After flashing' below to get set up in VIA.

## Option 2: Build it yourself

Want to edit the keymap before flashing? Compile it from source.

### Windows

1. Install [QMK MSYS](https://msys.qmk.fm/) and open the **QMK MSYS** terminal from the Start Menu. Paste the following commands in each step:
2. Clone qmk_firmware:
   ```
   git clone https://github.com/qmk/qmk_firmware.git
   ```
3. Move into the folder:
   ```
   cd qmk_firmware
   ```
4. Pull in the required submodules:
   ```
   make git-submodule
   ```
5. Copy the `velvet_pro` folder from this repo into `qmk_firmware/keyboards/`, so the path looks like:
   ```
   qmk_firmware/keyboards/velvet_pro/velvet_pro_firmware_via/
   ```
6. Compile:
   ```
   qmk compile -kb velvet_pro/velvet_pro_firmware_via -km via
   ```
7. You'll get a `.bin` file in the `qmk_firmware` folder. Flash it with QMK Toolbox as described above.

### Mac

1. Install [Homebrew](https://brew.sh) if you don't already have it.
2. In Terminal, install the QMK CLI:
   ```
   brew install qmk/qmk/qmk
   ```
3. Clone qmk_firmware:
   ```
   git clone https://github.com/qmk/qmk_firmware.git
   ```
4. Move into the folder:
   ```
   cd qmk_firmware
   ```
5. Pull in the required submodules:
   ```
   make git-submodule
   ```
6. Copy the `velvet_pro` folder from this repo into `qmk_firmware/keyboards/`, so the path looks like:
   ```
   qmk_firmware/keyboards/velvet_pro/velvet_pro_firmware_via/
   ```
7. Compile:
   ```
   qmk compile -kb velvet_pro/velvet_pro_firmware_via -km via
   ```
8. You'll get a `.bin` file in the `qmk_firmware` folder. Flash it with QMK Toolbox as described above.

## After flashing

Go to [usevia.app](https://usevia.app) in a Chromium-based browser (Chrome, Edge, Brave — Firefox and Safari don't support the WebHID connection VIA needs). This firmware isn't in VIA's official keyboard database, so there's one extra one-time step before it's recognized:

1. Click the gear icon (Settings) → toggle **Show Design Tab** on.
2. Go to the Design tab (brush icon) → **Load Draft Definition** → select `velvet_pro_via.json` (included in this repo).
3. Switch back to the Configure tab → **Authorize Device** → select your keyboard.

From there you can remap keys, set up macros, and more, all without reflashing. VIA remembers the loaded definition afterward, so you only need to do this once per browser.
