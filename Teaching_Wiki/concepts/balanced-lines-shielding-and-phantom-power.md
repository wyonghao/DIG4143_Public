---
type: concept
title: "Balanced Lines Shielding And Phantom Power"
week: 3
tags: [balanced-audio, shielding, grounding, phantom-power, xlr, common-mode]
sources: ["3 - Electrics, Shielding, Connectors_BB_2026.pdf", "balanced_audio_demo.m"]
created: 2026-04-12
updated: 2026-04-13
status: active
---

Original sources:
- [3 - Electrics, Shielding, Connectors_BB_2026.pdf](<../assets/sources/3 - Electrics, Shielding, Connectors_BB_2026.pdf>)
- [balanced_audio_demo.m](../assets/sources/balanced_audio_demo.m)

## Teaching Aim

Give you one coherent explanation for shielding, grounded references, balanced
signalling, common-mode rejection, and phantom power.

## Core Ideas

- Shielding reduces external electromagnetic pickup.
- Ground or earth provides a reference and safety path, depending on context.
- Unbalanced transmission uses one conductor for signal and one shared return/reference path.
- Balanced transmission uses two signal conductors carrying equal and opposite versions of the wanted signal.
- Differential reception subtracts those conductors and rejects shared interference.

## Why Balanced Lines Matter

Low-level microphone signals are extremely vulnerable. In professional broadcast
and live sound contexts, longer cable runs increase the chance of:

- induced hum
- electromagnetic interference
- ground-reference differences
- noise entering through the return path

Balanced lines improve robustness because interference that appears similarly on
both conductors is largely cancelled at the receiver.

## Why The Signal Does Not Cancel

Students often say:

If one line is inverted, surely the signal cancels.

That only happens if the two conductors are added directly. A balanced receiver
subtracts one from the other, so equal and opposite wanted signals become a larger
differential result while shared noise cancels.

## Phantom Power In One Sentence

Phantom power places the same DC voltage on both balanced signal conductors, so
the microphone can draw power while the differential audio path remains centred on
the voltage difference between the two lines.

## Connector And Interface Link

The lecture source correctly anchors this to professional hardware practice:

- XLR is the standard balanced analogue audio connector
- AES3 defines professional digital audio physical variants
- SDI uses controlled-impedance coax and BNC in the video domain

This helps students see that connector choice reflects signalling method and
impedance discipline, not only convenience.

## Best Supporting Demo

- [[demos/balanced-audio-and-ground-loops]]
