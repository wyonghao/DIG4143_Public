---
type: demo
title: "MATLAB Signal Visualisation Roadmap"
week: 1
tags: [matlab, demos, signals, noise, transmission, modulation]
sources: ["demo_RLCG_transmission.m", "demo_RLCG_animation.m", "balanced_audio_demo.m"]
created: 2026-04-12
updated: 2026-04-12
status: active
---

## Teaching Aim

Build a repeatable set of MATLAB demonstrations that make abstract broadcast
engineering concepts visible and discussable during lectures and tutorials.

## Current Demo Assets

### RLCG pulse transmission

File:
[demo_RLCG_transmission.m](../../2026Teaching/1Signal_code/demo_RLCG_transmission.m)

Use it to show:
- propagation delay
- attenuation
- pulse spreading
- the effect of repeated RLCG sections as a cable model

What students should notice:
- the output pulse is delayed and degraded compared with the input
- the mid-line signal helps reveal progressive channel damage
- capacitance and inductance affect edge behaviour, not just amplitude

### RLCG animation

File:
[demo_RLCG_animation.m](../../2026Teaching/1Signal_code/demo_RLCG_animation.m)

Use it to show:
- the pulse moving along the line
- why “the whole cable sees the same thing at once” is wrong
- how distributed models are more informative than one lumped resistor view

### Balanced audio demonstration

File:
[balanced_audio_demo.m](../../2026Teaching/2%20TransmissionCode/balanced_audio_demo.m)

Use it to show:
- common-mode interference
- balanced versus unbalanced transmission
- differential recovery
- ground-loop hum intuition
- phantom power without destroying the audio path

## Suggested Teaching Sequence This Year

1. Start with a clean sine wave and pulse in Tutorial 0.
2. Use the RLCG models in the signals and transmission weeks.
3. Use the balanced audio demo when discussing shielding, reference, and connectors.
4. Add one modulation visualisation next so students can see carrier, message, and spectrum together.
5. Add one SNR demo where noise level is increased gradually until threshold failure is visible.

## Gaps Worth Building Next

- AM and FM comparison with spectrum plots
- QAM constellation with added noise
- harmonic distortion and clipping comparison
- simple sampling and aliasing demo
- eye diagram generation from noisy digital pulses

## Linked Concepts

- [[concepts/signal-noise-and-distortion]]
- [[concepts/transmission-line-behaviour]]
- [[topics/teaching-strategy-matlab-first-year]]
