---
type: tutorial
title: "Tutorial 00 MATLAB And Signals"
week: 0
tags: [tutorial, matlab, signals, plotting]
sources: ["Tut 0 Introduce to MATLAB programming and Signal.docx"]
created: 2026-04-12
updated: 2026-04-12
status: active
---

Original source: `Tut 0 Introduce to MATLAB programming and Signal.docx`

## Teaching Aim

Use MATLAB early to normalise experimentation. Students should see MATLAB as a
way to inspect signal behaviour, not as a separate programming hurdle.

## Role In The Module

This tutorial should establish three habits:

- plotting before guessing
- changing one parameter at a time
- explaining what the graph means in engineering terms

## Minimum Competencies

Students should be able to:

- generate a simple sine wave
- change amplitude, frequency, and sampling step
- create subplots for comparison
- label axes properly
- describe what changed physically, not just visually

## Recommended Tutorial Framing

Keep the first MATLAB session tightly tied to broadcast engineering language:

- frequency means cycles per second, not “how compressed the graph looks”
- amplitude means signal level, not “height because MATLAB drew it that way”
- sample spacing affects what can be seen and reconstructed

## Good First Questions

- What changes when frequency doubles but amplitude stays fixed?
- What changes when amplitude doubles but frequency stays fixed?
- Why can two plots look similar over a short window but represent very different frequencies?
- What is lost when sample spacing becomes too large?

## Bridge To Later Weeks

This tutorial should feed directly into later teaching on:

- [[concepts/signal-noise-and-distortion]]
- [[concepts/transmission-line-behaviour]]
- modulation, multiplexing, and spectrum analysis

## MATLAB Follow-Up

After the introductory tutorial, students should quickly progress to:

- noisy sine-wave comparisons
- pulse propagation examples
- balanced vs unbalanced transmission examples
