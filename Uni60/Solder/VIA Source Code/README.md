# Uni60 — VIA Firmware

This is the VIA-compatible firmware for the Uni60, a universal 60% solder PCB. It shows up as **Universal60** once connected.

The PCB supports a range of alternative layouts. All of them are switchable in VIA without reflashing:

| Option | Choices |
| --- | --- |
| Split Backspace | 2u backspace, or two 1u keys |
| Bottom Row | 7u, 6.25u, 6.25u split, 7u split, or 10u |
| ISO Enter | ANSI enter, or ISO enter |
| Full Right Shift | 1.75u shift + 1u Fn, or full 2.75u shift |
| Split Left Shift | 2.25u shift, or 1.25u shift + 1u key |

## Option 1: Just flash it (recommended)

If you don't need to change anything, use the pre-compiled `uni60_via.bin`.

1. Download [QMK Toolbox](https://github.com/qmk/qmk_toolbox/releases).
2. Open QMK Toolbox, click 'Open' and open the `uni60_via.bin` file.
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
5. Copy the contents of the `shentobento_uni60_solder` folder from this repo into `qmk_firmware/keyboards/shentobento/uni60`, so the path looks like:
   ```
   qmk_firmware/keyboards/shentobento/uni60/
   ```
6. Compile:
   ```
   qmk compile -kb shentobento/uni60 -km via
   ```
7. You'll get `shentobento_uni60_via.bin` in the `qmk_firmware` folder. Flash it with QMK Toolbox as described above.

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
6. Copy the `shentobento` folder from this repo into `qmk_firmware/keyboards/`, so the path looks like:
   ```
   qmk_firmware/keyboards/shentobento/uni60/
   ```
7. Compile:
   ```
   qmk compile -kb shentobento/uni60 -km via
   ```
8. You'll get `shentobento_uni60_via.bin` in the `qmk_firmware` folder. Flash it with QMK Toolbox as described above.

## After flashing

Go to [usevia.app](https://usevia.app) in a Chromium-based browser (Chrome, Edge, Brave — Firefox and Safari don't support the WebHID connection VIA needs). This firmware isn't in VIA's official keyboard database, so there's one extra one-time step before it's recognized:

1. Click the gear icon (Settings) → toggle **Show Design Tab** on.
2. Go to the Design tab (brush icon) → **Load Draft Definition** → select `uni60.json` (included in this repo).
3. Switch back to the Configure tab → **Authorize Device** → select your keyboard.

From there you can remap keys, set up macros, and more, all without reflashing. VIA remembers the loaded definition afterward, so you only need to do this once per browser.

### Set your layout options first

Before you remap anything, go to **Configure → Layouts** and set the options to match how you actually built the board. VIA stores these on the PCB itself, so they survive unplugging and follow the board to another computer.

Doing this first matters: the keymap grid redraws to match, so you'll be remapping the keys you actually have instead of guessing which one is which.

## Default keymap

The board ships as a standard ANSI 60% with a 2u backspace, split right shift and a 7u bottom row. Fn is the 1u key to the right of the right shift.

Holding Fn gives you:

| Fn + | Result |
| --- | --- |
| Esc | ` ~ |
| 1 – = | F1 – F12 |
| Backspace | Delete |
| `[` | Up |
| `;` `'` | Left, Right |
| `/` | Down |
| Right Shift | Page Up |
| Right Alt, Right GUI, Right Ctrl | Home, Page Down, End |

Layer 2 is empty and layer 3 is unused — both are yours to fill in.

## Notes on specific layouts

**Split backspace.** The 2u backspace footprint is wired in parallel with the *left* of the two 1u positions, so out of the box you get Backspace on the left and Delete on the right. If you'd rather have `\ |` up there, remap the left key to `\` and move Backspace down to the 1.5u key in the Tab row.

**ISO enter.** The extra key at the end of the home row defaults to `\ |`. Remap it to **Non-US #** (`KC_NUHS`) to get `# ~` as ISO expects.

**Split left shift.** The new 1u key is already set to **Non-US \\** (`KC_NUBS`) — the `< >` key on German layouts and `\ |` on UK.

**Full right shift.** This removes the default Fn key. If you're on a 6.25u-based bottom row there's a second Fn on the key immediately right of the spacebar. On a 7u bottom row there isn't one, so assign Fn (`MO(1)`) to a key of your choice or you'll have no way to reach layer 1.

**Split spacebars.** On the 6.25u split and 7u split bottom rows, the left segment is Backspace and both the small middle key and the right segment are Space. The middle key has to default to Space because it shares wiring with the full-size spacebar on every other bottom row — remap it to Fn or whatever you like.

**N-key rollover.** NKRO is compiled in but off by default, since some BIOS and UEFI screens don't handle it. To turn it on, assign `NK_TOGG` to a key in VIA, press it once, then remap that key back to whatever you wanted. The setting is stored on the board.

**Getting back into the bootloader.** Besides holding Esc while plugging in or using the BOOT button, you can assign VIA's `QK_BOOT` (listed under Special) to a key.
