---
type: concept
title: "Signal Noise And Distortion"
week: 1
tags: [signals, noise, distortion, snr, quality]
sources: ["1 - Signals_BB Lecture Notes Enhanced.md", "demo_RLCG_transmission.m", "balanced_audio_demo.m"]
created: 2026-04-12
updated: 2026-04-13
status: active
---

Original sources:
- [1 - Signals_BB Lecture Notes Enhanced.md](<../assets/sources/1 - Signals_BB Lecture Notes Enhanced.md>)
- [demo_RLCG_transmission.m](../assets/sources/demo_RLCG_transmission.m)
- [balanced_audio_demo.m](../assets/sources/balanced_audio_demo.m)

## Teaching Aim

Separate three ideas that students often blur together: the wanted signal, added
noise, and waveform-changing distortion.

## Core Distinctions

- Signal: the wanted variation carrying information.
- Noise: unwanted random or quasi-random addition to that signal.
- Distortion: change in waveform shape caused by a system that is not behaving ideally.

## Why This Matters

If students do not separate noise from distortion, they struggle later with:

- SNR
- clipping
- harmonic distortion
- intermodulation
- equalisation and channel compensation

## MATLAB Visual Strategy

Best classroom sequence:

1. Plot a clean sine wave.
2. Add random noise and show that the underlying waveform still exists.
3. Clip the same sine wave and show that new shape and new harmonics appear.
4. Compare spectra so the difference is not just descriptive.

## Short Teaching Line

Noise is added to the signal. Distortion changes the signal.

## Linked Pages

- [[lectures/week-01-signals-companion]]
- [[demos/matlab-signal-visualisation-roadmap]]
