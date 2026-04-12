---
type: concept
title: "Microphone Sensitivity dB SPL And dBV"
week: 3
tags: [microphone, db, dbv, db-spl, sensitivity, sound-pressure, voltage]
sources: ["3 - Electrics, Shielding, Connectors_BB_2026.pdf"]
created: 2026-04-12
updated: 2026-04-12
status: active
---

## Teaching Aim

Clarify the relationship between acoustic input and electrical output in a
microphone, especially the meaning of `1 Pa`, `94 dB SPL`, `1.85 mV`, and
`-54.5 dBV/Pa`.

## Core Idea

A microphone converts:

- acoustic pressure at the input
- into electrical voltage at the output

So in this context:

- `dB SPL` or `Pa` describe the sound arriving at the microphone
- `mV` or `dBV` describe the voltage leaving the microphone

## dB Is A Ratio, Not A Standalone Quantity

There are two important logarithmic forms:

### Power quantities

`dB = 10 log10(P1 / P2)`

Use this for:

- power
- energy

### Amplitude quantities

`dB = 20 log10(A1 / A2)`

Use this for:

- voltage
- current
- sound pressure

The reason for `20` is that power is proportional to amplitude squared.

## What dB SPL Means

`dB SPL` means sound pressure level, referenced to:

- `20 uPa`, the standard threshold-of-hearing reference

Formula:

`dB SPL = 20 log10(p / 20 uPa)`

## Why The Reference Is `20 uPa`

This reference is not arbitrary. It is used because it is approximately the
threshold of human hearing in air at around `1 kHz`.

In plain language:

- `20 uPa` is about the smallest sound pressure a healthy young listener can
  detect under ideal conditions
- this is why it is used as the zero reference point for `dB SPL`

So when:

- `p = 20 uPa`

then:

- `dB SPL = 0 dB SPL`

This does not mean there is no sound. It means the sound pressure is equal to
the agreed reference level.

## Why Engineers Use This Reference

Decibels always need a reference value. In acoustics, using `20 uPa` is useful
because it gives a scale that aligns reasonably well with human hearing:

- `0 dB SPL` is near the threshold of hearing
- around `60 dB SPL` is typical conversation
- around `120 dB SPL` is close to the threshold of pain

So `dB SPL` is not just a physical pressure scale. It is a physical scale chosen
to be meaningful for human listening.

## Standardisation Note

This reference pressure is standardised in acoustics and audio engineering by
international standards bodies such as ISO and IEC.

So when:

- `p = 1 Pa`

then:

- `dB SPL = 20 log10(1 / 20e-6) = 93.98 dB SPL`

which is rounded to:

- `94 dB SPL`

## What dBV Means

`dBV` is a voltage level referenced to:

- `1 V`

Formula:

`dBV = 20 log10(V / 1 V)`

So if a microphone outputs:

- `1.85 mV = 0.00185 V`

then:

- `dBV = 20 log10(0.00185) = -54.66 dBV`

which is commonly stated as approximately:

- `-54.5 dBV`

## What `-54.5 dBV/Pa` Means

This is a microphone sensitivity specification.

It means:

- if the microphone is exposed to `1 Pa` sound pressure
- which is the same as `94 dB SPL`
- the microphone output is about `1.85 mV`
- which is about `-54.5 dBV`

So the specification links one acoustic reference point to one electrical output point.

## One Sentence Version

At `94 dB SPL` input, the microphone produces about `1.85 mV` output.

## Why This Matters In Teaching

Students often confuse:

- acoustic dB with electrical dB
- absolute units with ratio units
- `10 log` and `20 log`
- the hearing threshold with “no sound”

This topic is useful because it joins all three together in one practical
broadcast example.

## Good Teaching Sequence

1. Start with the microphone sensitivity line from the datasheet.
2. Explain that `1 Pa` is the physical pressure input.
3. Convert `1 Pa` into `94 dB SPL`.
4. Convert `1.85 mV` into `-54.5 dBV`.
5. Restate the result in plain English.
6. Explain why `20 uPa` is the reference point for `0 dB SPL`.

## Exam-Style Interpretation

If the SPL increases by `20 dB`, the pressure amplitude increases by a factor of `10`.

If the microphone behaves linearly, the output voltage also increases by a factor of `10`.

So:

- `94 dB SPL` -> `1.85 mV`
- `114 dB SPL` -> about `18.5 mV`

## Common Student Mistakes

- saying dB is a unit like volts or pascals
- using `10 log` for voltage or sound pressure
- forgetting that `dBV` is referenced to `1 V`
- forgetting that `dB SPL` is referenced to `20 uPa`
- thinking `0 dB SPL` means silence
- thinking `94 dB SPL` and `-54.5 dBV` are the same kind of quantity

## Student Reading Version

You can read the microphone sensitivity line like this:

When the microphone receives a sound pressure of `1 Pa`, which is the same as
`94 dB SPL`, it produces an electrical output of about `1.85 mV`, which is about
`-54.5 dBV`.

The `dB SPL` part describes the sound entering the microphone.

The `mV` and `dBV` part describe the voltage leaving the microphone.

The reason `dB SPL` starts from `20 uPa` is that this pressure is close to the
quietest sound a human can hear at around `1 kHz`. That is why acoustics uses
it as the zero reference point.

## Linked Pages

- [[lectures/week-03-electrics-shielding-connectors-companion]]
- [[demos/microphone-sensitivity-db-demo]]
