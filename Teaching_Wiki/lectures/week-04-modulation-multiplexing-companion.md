---
type: lecture
title: "Session 04 Modulation and Multiplexing"
week: 4
tags: [modulation, multiplexing, carriers, am, fm, qam, psk, tdm, fdm, ofdm]
sources: ["4 - Modulation, Multiplexing 2026.pdf"]
created: 2026-04-13
updated: 2026-04-14
status: active
---

Original sources:
- [4 - Modulation, Multiplexing 2026.pdf](<../assets/sources/4 - Modulation, Multiplexing 2026.pdf>)

## Teaching Aim

Help you see modulation and multiplexing as practical engineering responses to
real transmission limits: antenna size, channel sharing, noise, interference,
and symbol recovery.

## Revision Summary

- modulation moves a baseband signal onto a carrier
- multiplexing lets multiple signals share one channel
- noise, interference, attenuation, and jitter limit transmission quality
- AM is simple but noise-sensitive
- FM is more robust to amplitude noise
- higher-order QAM carries more bits per symbol but reduces noise margin

## Core Story

Read this session as one continuous chain:

1. Baseband signals are not always practical to radiate or combine directly.
2. A carrier lets the message move to a more useful frequency range.
3. AM, FM, and phase-based methods differ in what property of the carrier they change.
4. The spectrum of a modulated signal explains bandwidth use, sidebands, and noise behaviour.
5. Multiplexing lets several services share one bearer by separating them in frequency, time, statistics, or wavelength.
6. Digital modulation extends the same carrier idea by mapping bits to symbol states.
7. Constellation diagrams then become the cleanest way to visualise digital decision points and error vulnerability.

## Signal Transmission Pipeline

Use this lecture in the wider transmission chain:

`Source -> Encoding -> Modulation -> Channel -> Demodulation -> Decoding`

At each stage, practical channels may introduce:

- noise
- interference
- attenuation
- jitter
- bit errors

The engineering goal is not perfection. The goal is to reduce errors and make
recovery reliable enough for the service being carried.

## What To Notice

The lecture covers:

- the difference between baseband and carrier transmission
- why antenna practicality pushes low-frequency information onto higher-frequency carriers
- AM, FM, and phase-based modulation as changes to carrier parameters
- sidebands, carrier frequency, and modulation index
- why AM is more vulnerable to amplitude noise than FM
- subcarriers and layered modulation structures
- SSB and VSB as bandwidth-efficiency compromises
- multiplexing methods:
  - FDM
  - TDM
  - statistical multiplexing
  - WDM
- digital carrier modulation using PSK and QAM
- constellation diagrams, decision points, and the trade-off between capacity and robustness

## Carrier Logic

The key physical reason modulation is needed is antenna practicality:

- low-frequency baseband signals have long wavelengths
- long wavelengths imply physically large antennas
- large antennas are often impractical for real broadcast systems
- shifting the message onto a higher-frequency carrier reduces the wavelength and makes transmission practical

This is also what allows many different services to coexist by tuning receivers
to different carrier frequencies.

Teaching line:

If you tried to radiate a `100 Hz` voice signal directly, a quarter-wavelength
antenna would be about `750 km` long. If you first modulate that message onto a
`100 MHz` carrier, the antenna only needs to be about `75 cm`. That is the
practical meaning of modulation.

Quick comparison:

| Frequency | Period | Electromagnetic wavelength | Quarter-wave antenna | Sound wavelength in air |
|---|---:|---:|---:|---:|
| `100 Hz` | `10 ms` | `3000 km` | `750 km` | `3.4 m` |
| `1 kHz` | `1 ms` | `300 km` | `75 km` | `0.34 m` |
| `1 MHz` | `1 us` | `300 m` | `75 m` | `0.34 mm` |
| `100 MHz` | `10 ns` | `3 m` | `0.75 m` | `3.4 um` |

Impact line:

The same `100 Hz` frequency has a wavelength of only a few metres in air as a
sound wave, but thousands of kilometres in the electromagnetic domain.

Follow-up line:

The waveform pattern may look similar, but the propagation speed is different,
so the wavelength is completely different.

## Modulation Types

### AM

In AM, the message changes the amplitude of the carrier.

Students should notice:

- the output spectrum contains the carrier
- the upper sideband and lower sideband carry the message information
- amplitude noise directly corrupts the same property that carries the message

## Key Question: What Are Sidebands In AM, Why Do They Appear, And Do We Need Both To Recover The Signal?

In `AM`, the carrier is multiplied by the message signal. Once that happens in
the time domain, the frequency domain no longer contains only the original
carrier frequency. It now contains:

- the carrier
- an upper sideband at `fc + fm`
- a lower sideband at `fc - fm`

If the message contains many frequencies, each one creates matching upper and
lower sideband components around the carrier. That is why the AM spectrum
spreads out into bands rather than remaining one single line.

The sidebands appear because the message information is being translated to sit
around the carrier frequency. In other words, the carrier provides the centre
frequency, and the sidebands carry the changing information.

The most important point for students is this:

- the carrier mainly helps with transmission and receiver tuning
- the sidebands contain the actual message information

Do we need both sidebands to recover the signal?

- in ordinary AM, both sidebands are transmitted
- however, they carry duplicate information
- this is why `SSB` can remove one sideband and still recover the message

So, for message recovery, you do not always need both sidebands. One sideband is
enough if the receiver is designed for it. You also do not strictly need the
full carrier in every system, but removing it makes reception more difficult and
usually requires a more specialised receiver.

### FM

In FM, the message changes the carrier frequency.

Students should notice:

- the wanted information is carried in frequency deviation rather than amplitude
- amplitude corruption is less damaging because the receiver is interested mainly in frequency behaviour
- improved noise robustness comes with different bandwidth and receiver complexity trade-offs

## Key Question: Is FM Demodulation The Same As PWM?

Not really. `PWM` means the information is represented by pulse width or duty
cycle. After low-pass filtering, that varying width can be turned back into an
analogue voltage.

The FM demodulation idea shown in this lecture is closer to `PFM` or `PDM` than
to true `PWM`:

- `PWM`: information is in pulse width
- `PFM`: information is in pulse frequency
- `PDM`: information is in pulse density

In this case, the receiver behaviour is more like:

`FM -> zero-crossing or pulse conversion -> pulse density or frequency changes -> low-pass filter -> recovered analogue signal`

So the useful teaching comparison is:

- `PWM` represents the message by changing pulse width
- FM demodulation here represents the message more through pulse rate or pulse density
- both approaches can still use low-pass filtering at the end to recover an analogue waveform

That is why the page may look superficially like `PWM`, but the underlying
information is not actually being carried in pulse width.

## Key Question: What Is The Usefulness Of The FM Modulation Index?

The `FM modulation index`, often written as `beta`, is useful because it tells
you how strongly the carrier frequency is being varied by the message signal.
It links the size of the frequency deviation to the modulating frequency.

In practical teaching terms, it helps students judge:

- how much the carrier is being pushed away from its centre frequency
- how “deep” the FM process is
- how much bandwidth the FM signal is likely to occupy
- why different FM systems behave differently even when they all count as `FM`

So the modulation index is not just a formula. It is a way of describing the
relationship between:

- message frequency
- carrier deviation
- resulting spectral spread

The usefulness is that it helps predict transmission behaviour:

- a larger modulation index usually means a wider transmitted spectrum
- a smaller modulation index means less deviation and a narrower spectrum
- it therefore helps engineers compare robustness, fidelity, and bandwidth use

The simplest student summary is:

`FM modulation index tells us how strongly the message is driving the carrier frequency, and therefore helps us understand bandwidth and system behaviour.`

## FM Broadcast Subsignals

FM broadcasting does not carry only one simple audio waveform. In practical
broadcast systems, one FM channel can carry the main audio plus extra embedded
signals.

### Pilot Tone (`19 kHz`)

The pilot tone acts as a marker signal.

Its purpose is to tell the receiver:

`this is a stereo transmission, not just mono`

Without it, a receiver can treat the broadcast as an ordinary mono service.

### Stereo Subcarrier (`38 kHz`)

The stereo system does not simply transmit left and right channels separately.
Instead, it uses:

- main audio component: `L + R`
- stereo difference component on the subcarrier: `L - R`

At the receiver:

- `L = (L + R + L - R) / 2`
- `R = (L + R - (L - R)) / 2`

This is what allows the original left and right channels to be reconstructed.

### RDS (`57 kHz`)

`RDS` carries data rather than programme audio.

Typical examples include:

- station name
- song or programme text
- traffic information
- alternative frequency support for retuning

This is the system behind the text and station information often seen on car
radios.

## Key Question: Why Are Subcarriers Useful In FM Broadcasting?

Subcarriers are useful because they allow extra information to be added without
replacing the main audio service.

They let one broadcast channel carry:

- the main audio
- stereo structure information
- data services

So one FM station is not only broadcasting sound. It can also broadcast control
and data signals at the same time.

Teaching line:

An FM station is not only sending audio. It is also sending structure and data.

### Digital Modulation

Digital data still needs an analogue carrier in many transmission systems.

The lecture introduces:

- PSK, where digital information is represented by phase changes
- QAM, where digital information is represented by phase and amplitude together

## QAM Trade-Off

QAM is a good place to connect throughput and robustness clearly:

- `16-QAM` carries `4 bits` per symbol
- `64-QAM` carries `6 bits` per symbol
- `256-QAM` carries `8 bits` per symbol

Higher-order constellations increase capacity, but the decision points sit
closer together, so smaller disturbances can push a symbol into the wrong
decision region.

## Inter-Symbol Interference

The lecture also links modulation to transmission impairments:

- in radio, multipath can create delayed versions of the same signal
- in cables, propagation delay and dispersion can smear symbol boundaries
- the result is inter-symbol interference, where one symbol spreads into the next

This matters because modulation is not only about carrier placement. It is also
about whether the receiver can still recover each symbol cleanly.

## Key Question: What Is Inter-Symbol Interference In Modulated Data, And What Causes It?

Inter-symbol interference, usually shortened to `ISI`, happens when one symbol
does not finish cleanly before the next symbol arrives. The symbols overlap in
time, so the receiver sees a smeared or contaminated waveform instead of one
clear symbol at a time.

In practice, the main causes are:

- multipath propagation in radio, where reflected versions of the same signal arrive later
- propagation delay in cables and transmission paths
- dispersion or pulse spreading, where the waveform widens as it travels
- phase delay and uneven channel response, which distort the symbol shape
- jitter or timing error at the receiver, which makes sampling less accurate

The core idea is simple: `ISI` happens because the channel spreads or delays the
signal in time, so neighbouring symbols begin to interfere with each other.

## Multiplexing Overview

Multiplexing means sharing one bearer between multiple services.

### FDM

- each service occupies a different carrier or frequency slot
- guard bands are often needed to reduce overlap and interference

### TDM

- services take turns in allocated time slots
- data is organised into repeating frames

### Statistical Multiplexing

- channel capacity is allocated dynamically rather than fixed equally at all times
- this is useful when service bit rates vary over time

### WDM

- optical signals are separated by wavelength on fibre
- multiple multiplexes can share one physical fibre using different optical carriers

## Common Confusions

- treating modulation as “just putting a signal on a sine wave” without asking why
- confusing carrier frequency with message frequency
- missing that sidebands carry the message information, not the carrier alone
- assuming FM always uses less bandwidth because the waveform amplitude looks constant
- mixing up subcarriers with multiple separate carriers such as OFDM-style systems
- thinking higher-order QAM is simply “better” rather than more fragile
- not seeing that multiplexing is about shared channel organisation, not one specific technology

## Exam-Facing Comparisons

- `AM vs FM`: AM is simpler but more vulnerable to amplitude noise; FM is more robust against amplitude noise but has different complexity and bandwidth implications.
- `Capacity vs robustness`: increasing modulation density increases throughput but tightens the error margin.
- `Multiplexing vs modulation`: modulation changes how one signal occupies a carrier; multiplexing organises how multiple signals share a channel.

## Good Things To Watch For

- Put one baseband spectrum next to one modulated spectrum so students can track where the information moved.
- Show AM in both time and frequency domains, especially the carrier plus upper and lower sidebands.
- Contrast AM noise vulnerability with FM’s relative immunity to amplitude corruption.
- Use one simple FDM diagram and one simple TDM frame diagram side by side.
- When teaching QAM, move immediately from waveform changes to constellation diagrams so students can connect symbol states to decision regions.

## Broadcast Engineering Link

This session is where several broadcast systems stop looking like isolated
examples and start looking like one family of design choices:

- DVB systems combine coding, interleaving, mapping, and multicarrier modulation.
- Broadcast RF planning depends on carrier allocation, guard bands, and bandwidth efficiency.
- Television examples such as VSB show that practical systems often keep some theoretical inefficiency in order to preserve recoverability.
- Statistical multiplexing matters because service capacity can be shared dynamically across programme streams rather than fixed permanently.

## MATLAB Support

The strongest MATLAB opportunities after this lecture are:

- AM versus FM time-domain comparison
- AM sideband spectrum visualisation
- multiplexing examples using simple FDM and TDM constructions
- noisy PSK and QAM constellation plots
- symbol error intuition as constellation points spread under noise

Relevant existing page:
- [[demos/matlab-signal-visualisation-roadmap]]

## Likely Student Struggles

- understanding why modulation is necessary before learning how each type works
- separating carrier, message, sideband, and bandwidth ideas
- keeping analogue modulation and digital modulation in one mental framework
- reading constellation diagrams as decision spaces rather than decorative plots
- understanding why more bits per symbol usually means tighter noise margins

## One-Line Summary

Modulation moves the signal to a carrier. Multiplexing shares the channel.
Noise and interference set the practical limits.

## Linked Pages

- [[demos/matlab-signal-visualisation-roadmap]]
- [[concepts/signal-noise-and-distortion]]
- [[concepts/transmission-line-behaviour]]
