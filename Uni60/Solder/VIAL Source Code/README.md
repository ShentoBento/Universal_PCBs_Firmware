# Velvet Pro — Vial Firmware

This is the Vial-compatible firmware for the Velvet Pro PCB.

## Option 1: Just flash it (recommended)

If you don't need to change anything, use the pre-compiled `velvet_pro_firmware_vial.bin`

1. Download [QMK Toolbox](https://github.com/qmk/qmk_toolbox/releases).
2. Open QMK Toolbox, click 'Open' and open the `velvet_pro_firmware_vial.bin` file
3. Plug in the PCB while holding ESC, or the BOOT button on the back. A yellow message like 'STM32 DFU device connected (WinUSB): STMicroelectronics STM32  BOOTLOADER' should appear.
4. Click 'Flash' and wait for it to complete.
5. Once flashed, customize the mapping in [Vial](https://vial.rocks/)

## Option 2: Build it yourself

Want to edit the keymap before flashing? Compile it from source.

### Windows

1. Install [QMK MSYS](https://msys.qmk.fm/) and open the **QMK MSYS** terminal from the Start Menu. Paste the following commands in each step:
2. Clone vial-qmk:
   ```
   git clone https://github.com/vial-kb/vial-qmk.git
   ```
3. Move into the folder:
   ```
   cd vial-qmk
   ```
4. Pull in the required submodules:
   ```
   make git-submodule
   ```
5. Copy the `velvet_pro` folder from this repo into `vial-qmk/keyboards/`, so the path looks like:
   ```
   vial-qmk/keyboards/velvet_pro/velvet_pro_firmware_vial/
   ```
6. Compile:
   ```
   qmk compile -kb velvet_pro/velvet_pro_firmware_vial -km vial
   ```
7. You'll get a `.bin` file in the `vial-qmk` folder. Flash it with QMK Toolbox as described above.

### Mac

1. Install [Homebrew](https://brew.sh) if you don't already have it.
2. In Terminal, install the QMK CLI:
   ```
   brew install qmk/qmk/qmk
   ```
3. Clone vial-qmk:
   ```
   git clone https://github.com/vial-kb/vial-qmk.git
   ```
4. Move into the folder:
   ```
   cd vial-qmk
   ```
5. Pull in the required submodules:
   ```
   make git-submodule
   ```
6. Copy the `velvet_pro` folder from this repo into `vial-qmk/keyboards/`, so the path looks like:
   ```
   vial-qmk/keyboards/velvet_pro/velvet_pro_firmware_vial/
   ```
7. Compile:
   ```
   qmk compile -kb velvet_pro/velvet_pro_firmware_vial -km vial
   ```
8. You'll get a `.bin` file in the `vial-qmk` folder. Flash it with QMK Toolbox as described above.

## After flashing

Open [Vial](https://vial.rocks/) — it will detect your keyboard automatically. From there you can remap keys, set up macros, and more, all without reflashing.
