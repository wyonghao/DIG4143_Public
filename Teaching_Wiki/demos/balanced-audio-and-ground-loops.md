---
type: demo
title: "Balanced Audio And Ground Loops"
week: 3
tags: [demo, matlab, balanced-audio, shielding, ground-loops, phantom-power]
sources: ["balanced_audio_demo.m", "3 - Electrics, Shielding, Connectors_BB_2026.pdf"]
created: 2026-04-12
updated: 2026-04-13
status: active
---

Original sources:
- [balanced_audio_demo.m](../assets/sources/balanced_audio_demo.m)
- [3 - Electrics, Shielding, Connectors_BB_2026.pdf](<../assets/sources/3 - Electrics, Shielding, Connectors_BB_2026.pdf>)

## Teaching Aim

Use one MATLAB script to make four difficult ideas concrete:

- unbalanced lines pick up interference easily
- balanced lines recover the wanted signal by subtraction
- ground loops create audible low-frequency contamination
- phantom power does not cancel the audio because the DC is common to both lines

## What The Script Shows

- small ground-potential differences
- unbalanced reception with common-mode noise added directly
- balanced differential signalling
- add-versus-subtract confusion
- low-level ground-loop hum
- phantom power on balanced lines
- transformer turns ratio intuition
- frequency-domain comparison

## Suggested Order

1. Show the wanted signal and the small ground difference.
2. Show how the unbalanced received waveform gets corrupted.
3. Show hot and cold conductors carrying equal and opposite signal plus shared interference.
4. Show the recovered differential output.
5. Use the phantom power plots to explain equal DC bias on both lines.

## Questions To Ask

- Why does the same interference hurt the unbalanced path more?
- Why do the opposite signal polarities not destroy the wanted audio?
- What exactly is being subtracted at the receiver?
- Why does equal DC on both conductors not appear in the recovered audio?

## Common Misconceptions

- a balanced cable is “just a better shield”
- inversion means the two halves cancel permanently
- phantom power is a separate wire rather than matched DC on both signal lines
- hum comes only from bad equipment rather than reference-path differences

## Linked Pages

- [[concepts/balanced-lines-shielding-and-phantom-power]]
- [[lectures/week-03-electrics-shielding-connectors-companion]]
