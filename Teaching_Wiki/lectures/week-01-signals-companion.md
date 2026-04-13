---
type: lecture
title: "Week 01 Signals Companion"
week: 1
tags: [signals, channels, bandwidth, noise, matlab, broadcasting]
sources: ["1 - Signals_BB Lecture Notes Enhanced.md", "1 - Signals_BB_2026.pdf", "1 - Signals_BB Lecture Notes Enhanced.pdf"]
created: 2026-04-12
updated: 2026-04-13
status: active
---

Original sources:
- [1 - Signals_BB Lecture Notes Enhanced.md](<../assets/sources/1 - Signals_BB Lecture Notes Enhanced.md>)
- [1 - Signals_BB_2026.pdf](<../assets/sources/1 - Signals_BB_2026.pdf>)
- [1 - Signals_BB Lecture Notes Enhanced.pdf](<../assets/sources/1 - Signals_BB Lecture Notes Enhanced.pdf>)

## Teaching Aim

Give students a stronger mental model of what a signal is, how a channel changes
it, and why noise, distortion, and bandwidth are engineering constraints rather
than isolated definitions.

## Core Narrative

Think of this week as one continuous story:

1. A signal starts as a physical variation that can carry information.
2. The channel never behaves ideally, so the received signal differs from the transmitted one.
3. Bandwidth limits waveform fidelity.
4. Noise adds uncertainty; distortion reshapes the waveform.
5. Digital systems win in practice because threshold decisions, coding, and timing
   recovery make them more robust than direct analogue transmission.

## What To Expand Beyond The Slides

Students often memorise terms without seeing the connection between them. The
companion notes should repeatedly connect:

- time-domain shape to frequency content
- channel imperfections to eye closure and symbol errors
- bandwidth limits to rounded edges and lost detail
- noise power to SNR and practical quality limits
- distortion to non-linearity and new frequency components

## MATLAB Priority

Week 1 is already strong enough to support live MATLAB-led teaching.

Recommended sequence:
- plot a clean pulse and then a bandwidth-limited version
- compare input, mid-line, and output voltages along a simulated transmission line
- animate pulse propagation so delay and spreading become visible
- add controlled noise and compare analogue degradation with digital threshold decisions

Relevant pages:
- [[demos/matlab-signal-visualisation-roadmap]]
- [[concepts/signal-noise-and-distortion]]
- [[concepts/transmission-line-behaviour]]

## Common Student Misconceptions

- A signal is the same thing as information.
- Noise and distortion are interchangeable terms.
- More bandwidth only means faster systems.
- Digital systems are perfect rather than simply more fault-tolerant.
- If the waveform shape changes slightly, the message is still necessarily safe.

## Suggested Lecture Additions

- Put one eye diagram next to one analogue noise example so students see that
  timing margin and amplitude margin are both practical engineering concerns.
- Use one “same pulse, different channel” comparison to show attenuation, delay,
  and spreading in a single figure.
- Explicitly contrast additive noise with non-linear clipping.
- Frame SNR as a decision-quality problem rather than only a formula.

## Follow-On Teaching Links

- [[tutorials/tutorial-00-matlab-and-signals]]
- [[concepts/signal-noise-and-distortion]]
- [[concepts/transmission-line-behaviour]]
