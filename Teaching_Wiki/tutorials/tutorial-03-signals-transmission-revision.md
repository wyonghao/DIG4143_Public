---
type: tutorial
title: "Tutorial 03 Signals and Transmission Revision"
week: 3
tags: [tutorial, noise, dynamic-range, aliasing, transmission, packet-data, networking]
sources: ["Tutorial 3 - Signals, Transmission.docx", "Tutorial 3 - Signals, Transmission - SOLUTIONS.docx"]
created: 2026-04-12
updated: 2026-04-12
status: active
---

Original sources:
- `Tutorial 3 - Signals, Transmission.docx`
- `Tutorial 3 - Signals, Transmission - SOLUTIONS.docx`

## Teaching Aim

Turn the tutorial from a revision sheet into a guided bridge between signal
theory, transmission media, and introductory network distribution.

## What This Tutorial Covers

The source tutorial covers seven areas:

1. noise types, measurement, and white versus pink noise
2. camera sensor noise and dynamic range
3. aliasing in analogue-to-digital conversion
4. cable, radio, satellite, and optical fibre transmission trade-offs
5. circuit-switched versus packet data
6. internet versus web, routers versus hubs, MAC versus IP
7. servers and user clients

## How To Use It

This works best as a guided discussion tutorial rather than a silent worksheet.
The questions move from signal integrity into system infrastructure, so students
need help seeing the continuity.

## Notes By Question

### Q1 Noise

Look for the difference between:

- internal electronic noise mechanisms
- external interference
- how RMS and SNR relate to measurement
- why white and pink noise have different spectral distributions

Useful prompt:
Which noise sources are random device limits and which are environmental?

### Q2 Dynamic range in a camera sensor

The key idea is simple: more noise reduces usable dynamic range because the noise
floor eats into the available signal range, especially in dark regions.

Teaching line:
Dynamic range is not just about the brightest recordable point. It is the usable
distance between noise floor and saturation.

### Q3 Aliasing

The core point is Nyquist sampling. You should understand:

- aliasing is not random corruption
- it is a systematic false frequency created by insufficient sampling
- anti-alias filtering matters before conversion, not only after

### Q4 Transmission media

This is the strongest systems question in the set. Compare each medium using the
same headings:

- bandwidth capacity
- distance/range
- susceptibility to interference
- installation cost and complexity
- error mechanisms
- mitigation techniques

Link this explicitly to:
- [[concepts/transmission-line-behaviour]]
- [[concepts/balanced-lines-shielding-and-phantom-power]]

### Q5 Packet versus circuit switching

It is easy to answer this historically rather than structurally. Keep the answer
framed around:

- reserved capacity versus shared capacity
- latency predictability versus statistical efficiency
- why modern media networks still care about deterministic timing even on packet systems

### Q6 Internet, web, routers, hubs, MAC, IP

This is basic network literacy. The main risk is vague definitions.

Students should leave with:

- internet = network infrastructure and protocol interconnection
- web = one service running over that infrastructure
- router = forwards between networks
- hub = repeats traffic without intelligent path selection
- MAC = device-layer identifier
- IP = logical network-layer address

### Q7 Servers and clients

Keep this connected to media workflows:

- streaming server
- file server
- authentication server
- email server
- playout or asset-management server

## MATLAB Extension

Q1 and Q3 are especially suitable for short demos:

- noise added to a clean tone
- white versus pink spectrum shape
- undersampling and visible alias formation

## Linked Pages

- [[lectures/week-03-electrics-shielding-connectors-companion]]
- [[concepts/signal-noise-and-distortion]]
- [[concepts/balanced-lines-shielding-and-phantom-power]]
