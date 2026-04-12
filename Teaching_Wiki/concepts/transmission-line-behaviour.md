---
type: concept
title: "Transmission Line Behaviour"
week: 1
tags: [transmission, cables, attenuation, delay, reflections, matlab]
sources: ["demo_RLCG_transmission.m", "demo_RLCG_animation.m", "2 - Transmission Media_DM.pdf"]
created: 2026-04-12
updated: 2026-04-12
status: active
---

## Teaching Aim

Help you move beyond the idea of a cable as an ideal wire and toward a
distributed system with resistance, inductance, capacitance, leakage, delay, and
reflection effects.

## Core Ideas

- Real cables do not transmit changes instantaneously.
- The signal can weaken, spread, and deform as it travels.
- Fast edges reveal channel limitations more clearly than slow analogue changes.
- Impedance mismatch matters because the line has wave behaviour, not just DC behaviour.

## Why MATLAB Helps

Transmission-line behaviour is difficult to teach with static definitions alone.
The two RLCG scripts in this repository are already good foundations because they
make propagation and degradation visible over time and position.

## Best Visual Explanations

- input, midpoint, and output waveforms on one figure
- snapshots of voltage along the line at multiple times
- animation of pulse motion along cable sections

## Common Misconceptions

- attenuation only means “smaller” and not “less recoverable detail”
- the whole cable changes at once
- inductance and capacitance are only abstract circuit terms
- reflections are irrelevant unless the cable is extremely long

## Linked Pages

- [[lectures/week-01-signals-companion]]
- [[demos/matlab-signal-visualisation-roadmap]]
