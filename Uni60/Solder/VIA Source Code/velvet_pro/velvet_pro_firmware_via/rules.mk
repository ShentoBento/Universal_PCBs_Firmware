# ─────────────────────────────────────────────────────────────────
# rules.mk — keyboard level
# ─────────────────────────────────────────────────────────────────
#
# IMPORTANT: Do NOT add VIAL_ENABLE or VIA_ENABLE here.
#
# ── HOW THIS FILE DIFFERS FROM keymaps/<name>/rules.mk ────────────
# This file applies to every keymap built against this board folder —
# it loads first, before whichever keymap-level rules.mk you're
# compiling with (vial/ or via/). Put settings here only if they're
# true regardless of which configurator you're targeting.
#
# The keymap-level rules.mk is where the two builds actually diverge:
# it picks the protocol (VIAL_ENABLE for the Vial build, VIA_ENABLE for
# this one) plus whatever features that specific keymap needs
# (EXTRAKEY_ENABLE, BOOTMAGIC_ENABLE, etc). If a setting changes
# between your Vial and VIA builds, it belongs there, not here.
#

LTO_ENABLE = yes
NKRO_ENABLE = yes