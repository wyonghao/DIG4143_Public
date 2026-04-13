---
type: demo
title: "Microphone Sensitivity dB Demo"
week: 3
tags: [demo, matlab, microphone, db, dbv, db-spl, sensitivity]
sources: ["3 - Electrics, Shielding, Connectors_BB_2026.pdf"]
created: 2026-04-12
updated: 2026-04-13
status: active
---

Original sources:
- [3 - Electrics, Shielding, Connectors_BB_2026.pdf](<../assets/sources/3 - Electrics, Shielding, Connectors_BB_2026.pdf>)

[MATLAB file](./microphone_sensitivity_db_demo.m)

## Teaching Aim

Make the microphone sensitivity specification visual and calculable:

- `1 Pa` corresponds to `94 dB SPL`
- `1.85 mV` corresponds to about `-54.5 dBV`
- microphone sensitivity maps acoustic input to electrical output

## What The Script Does

- converts sound pressure in pascals to `dB SPL`
- converts output voltage to `dBV`
- assumes a microphone sensitivity of `1.85 mV` at `1 Pa`
- plots:
  - sound pressure versus `dB SPL`
  - pressure versus microphone output voltage
  - output voltage versus `dBV`
- prints key teaching values in the command window

## Best Way To Use It In Class

1. Start with the point `1 Pa -> 94 dB SPL`.
2. Then show `1.85 mV -> -54.5 dBV`.
3. Ask students why both use `20 log10`.
4. Then ask why `dB SPL` and `dBV` are still different quantities despite both using the same logarithmic form.

## Good Follow-Up Questions

- What output voltage would you expect at `74 dB SPL`?
- What happens to output voltage if SPL rises by `6 dB`?
- Why is the output still small even for fairly loud sound?

## Linked Pages

- [[concepts/microphone-sensitivity-db-spl-and-dbv]]
