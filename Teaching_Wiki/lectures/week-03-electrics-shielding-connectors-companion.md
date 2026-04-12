---
type: lecture
title: "Week 03 Electrics, Shielding, and Connectors"
week: 3
tags: [electrics, shielding, grounding, balanced-audio, connectors, phantom-power, sdi, aes3]
sources: ["3 - Electrics, Shielding, Connectors_BB_2026.pdf"]
created: 2026-04-12
updated: 2026-04-12
status: active
---

Original source: `3 - Electrics, Shielding, Connectors_BB_2026.pdf`

## Teaching Aim

Help you understand why low-level broadcast signals need careful reference,
shielding, connector choice, and differential signalling rather than treating
cables as passive accessories.

## Core Story

Read this lecture as a progression:

1. Electrical charge and conduction explain why signals can move in a circuit.
2. Very small real audio signals are vulnerable to interference.
3. Chassis, 0 V reference, and earth are related but not identical ideas.
4. Shielding reduces interference, but unbalanced connections still remain exposed.
5. Balanced lines improve robustness by using differential reception and common-mode rejection.
6. Phantom power adds DC support without destroying the AC audio path.
7. Broadcast standards such as SDI and AES3 then formalise connector, impedance, and signalling practice.

## What To Notice

The lecture covers:

- chassis and common reference potential
- live, neutral, and earth in mains distribution
- shielding of circuits and interconnects
- unbalanced interconnects and their noise vulnerability
- ground loops and ground lift
- transformer and op-amp approaches to balanced conversion
- differential signal recovery
- XLR wiring and balanced connectors
- phantom power on balanced microphone lines
- a transition from analogue interconnect thinking to SDI and AES3 standards

## Common Confusions

- confusing earth with every 0 V reference in a signal path
- thinking the shield is the same as the wanted signal return in all cases
- assuming balanced lines “cancel the signal” because one conductor is inverted
- not seeing why common-mode noise is rejected only after differential subtraction
- misunderstanding phantom power as “48 V on the audio” rather than equal DC bias on both signal conductors
- missing the connection between connector choice and electrical behaviour

## Good Things To Watch For

- Put one unbalanced cable diagram and one balanced cable diagram side by side.
- Show one low-level microphone signal against a much smaller but still damaging hum voltage.
- Use the balanced audio MATLAB demo live when discussing ground loops, differential signalling, and phantom power.
- Explicitly separate these terms:
  - earth as safety reference
  - chassis as conductive enclosure/reference structure
  - 0 V as local circuit reference

## Broadcast Engineering Link

The ending on SDI and AES3 matters because it moves you from “audio cable craft”
toward formal broadcast interfaces:

- SDI uses 75 ohm coax and BNC for digital video transport.
- AES3 uses defined balanced and unbalanced physical variants for digital audio.
- Characteristic impedance matters because interface reliability depends on transmission-line behaviour, not only connectivity.

## MATLAB Support

Use [[demos/balanced-audio-and-ground-loops]] during or immediately after this
lecture. It helps you see:

- common-mode interference
- balanced versus unbalanced transmission
- ground-loop hum
- phantom power intuition
- differential recovery

## Linked Pages

- [[concepts/balanced-lines-shielding-and-phantom-power]]
- [[demos/balanced-audio-and-ground-loops]]
- [[concepts/transmission-line-behaviour]]
