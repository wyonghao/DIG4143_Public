# Signals Lecture Notes Enhanced

These notes are a fuller student-facing companion to `1 - Signals_BB.pdf`. 

## 1. Big Picture

This lecture explains how signals behave, how channels affect them, how engineers measure quality, and why digital systems are usually preferred in modern broadcasting. The central idea is simple: a signal carries information, and every part of the system either preserves or damages that information.

Core themes:
- why sine waves matter
- how signals are described in time and frequency
- what bandwidth means
- how noise and distortion differ
- how digital signalling improves robustness
## Key Definitions

**Channel**: In signal transmission, the physical or logical path between source and destination (cable, fiber, air, etc.). It adds noise, causes attenuation, introduces phase shifts, and may create multipath reflections. Channel quality directly determines whether a signal arrives usable.

In broadcasting, "channel" has a dual meaning: it refers both to the transmission medium itself and to the frequency band allocated for a specific station. For example, "TV Channel 5" or "FM 101.5" identifies a reserved frequency slot where a broadcaster transmits, allowing receivers to tune to that specific band and separate it from other broadcasts using the same infrastructure.

**Pulse Transmission**: The process of sending discrete pulses (bits) through a channel. Digital systems rely on the receiver correctly identifying pulse presence or absence despite channel impairments.

**ISI (Inter-Symbol Interference)**: When pulses spread in time, one symbol's energy leaks into adjacent symbol periods, making decisions harder. Controlled pulse shaping and equalization help reduce ISI.

**IRE Levels**: A scale (0–100 IRE) used in video engineering to standardize signal amplitude. 0 IRE is black, 100 IRE is white, with setup and sync occupying defined ranges. This ensures consistent reproduction across equipment.

IRE stands for **Institute of Radio Engineers**, a professional organization that established standardized measurement units for video signal amplitudes. The IRE scale (0-100 IRE) is used in video engineering to define and measure signal levels consistently across different equipment and broadcast systems.

Note:
In modern digital workflows, engineers often use digital code values and scopes, but the IRE concept is still widely taught and referenced, especially for legacy analog understanding and waveform interpretation.

## 2. Slides 1-11: Sine Waves and Basic Wave Concepts

Slides 1-2 introduce the lecture roadmap. Students should see the topics as one connected story: signal generation, transmission, impairment, and recovery.

“Sine waves are preferred for power transmission because they are easy to generate, transform efficiently, and minimize harmonic-related losses in practical transmission equipment.”

Slides 3-8 explain why sine waves are fundamental. They arise naturally in rotating systems and are mathematically convenient. By building the sine function from triangle geometry and extending it through `0` to `360 degrees`, the slides show how a repeating oscillation is formed.

What students should remember:
- a sine wave is periodic
- one full cycle returns to the same position
- many complex waveforms can be understood as combinations of sine waves

Slides 9-10 introduce three core terms:
- **v** (velocity): how fast the wave travels through a medium
    - Unit: metres per second (m/s)
- **f** (frequency): cycles per second
    - Unit: Hertz (Hz)
- **λ** (lambda, wavelength): physical distance of one complete cycle
    - Unit: metres (m)

Key relationships:
- $v = f\lambda$
- $f = \frac{1}{T}$
- $T = \frac{1}{f}$

Slide 11 introduces radians. One full cycle is $2\pi$ radians. This matters because signal equations often use radians rather than degrees.

## 3. Slides 12-18: The Signal

## Slides 12-18: The Signal

Slide 13 uses a microphone as a practical example to show that useful signals may start at very small voltages. This is important in broadcast systems because tiny source signals often need clean amplification.

The **dB scale is logarithmic**. Every −20 dB represents a factor of 10 reduction in pressure (and voltage):

| dB SPL | Voltage |
|--------|---------|
| 94 dB  | 1.85 mV |
| 74 dB  | 0.185 mV |
| 54 dB  | 0.0185 mV |

This shows why low-noise preamps and careful gain staging are critical in broadcast chains—small signals need protection from noise before amplification.

Slides 14-16 explain RMS. Since an AC waveform averages to zero over a complete cycle, RMS is used to represent effective power.

RMS essentials (concise):
- RMS is exact, not an estimate. It is defined by the mean-square integral over one period.
- RMS corresponds to the DC value that would produce the same power in a resistor.
- For a pure sine wave: $V_{\mathrm{rms}} = \frac{V_{\mathrm{peak}}}{\sqrt{2}}$.
- Inverse form (equally valid): $V_{\mathrm{peak}} = \sqrt{2}\,V_{\mathrm{rms}}$.
- The $\sqrt{2}$ factor is specific to sine waves, not universal.

General definition:

$$
V_{\mathrm{rms}} = \sqrt{\frac{1}{T}\int_0^T v^2(t)\,dt}
$$

Waveform comparison:

| Waveform | Vrms |
|--------|--------|
| Sine | $V_p / \sqrt{2}$ |
| Square | $V_p$ |
| Triangle | $V_p / \sqrt{3}$ |

Teaching point:
- RMS reflects energy content (mean-square value). Waveform shape determines the conversion factor.

Slides 17-18 move into practical circuit limits:
- DC bias shifts a signal so it fits inside the circuit voltage range
- Negative DC bias is often more problematic in practice because many real circuits have little or no negative voltage headroom, not because negative bias is fundamentally worse in physics.
- clipping happens when a circuit cannot reproduce the full waveform amplitude

Teaching point: clipping is a form of non-linear distortion, not just a level problem.

## 4. Slides 19-23: The Channel

Example channel: Earth-Moon link

- Distance (Earth-Moon): ~384,000 km
- Signal travels at speed of light: ~3 x 10^8 m/s
- One-way delay: ~1.28 seconds
- Round-trip delay: ~2.56 seconds

Implications for the channel:
- Significant propagation delay (noticeable pause in conversations)
- Severe signal attenuation over long distance
- Susceptible to noise and interference

Moon landing broadcast path:
- Signal transmitted from the Moon to Earth
- Received by large ground stations
- Then redistributed globally via terrestrial and satellite networks

Teaching point:
- This example shows how a channel introduces delay, noise, and distortion in real-world communication.

These slides introduce the idea that the signal path matters as much as the source. A transmitted signal becomes a received signal only after passing through a channel, and that channel can add interference, crosstalk, phase error, and other impairment.

Slide 23 is especially important because it shows the wider communication model:

Source coding → Channel coding → Modulation → Channel → Demodulation → Decode

- source coding improves efficiency
- channel coding improves reliability
- modulation makes transmission possible over a chosen medium

This model applies to both analogue and digital transmission, but the layers are used differently:

Analogue:
- modulation is used (AM, FM radio)
- source coding and channel coding are not separate deliberate layers; they are absent or implicit

Digital:
- source coding = compression to remove redundancy (e.g. MP3, H.264)
- channel coding = error correction to add controlled redundancy (e.g. Reed-Solomon, FEC)
- modulation = mapping bits to a carrier waveform (e.g. QAM, PSK)

Teaching point:
- Analogue systems rely on modulation alone. Digital systems add source and channel coding on top, making transmission more efficient and more reliable.
- The full three-layer chain (source coding + channel coding + modulation) is a digital concept.

| Feature | Digital | Analogue |
|---------|---------|----------|
| Source coding | Yes (e.g. MP3, H.264) | No (bandwidth limiting used instead) |
| Channel coding | Yes (e.g. FEC, Reed-Solomon) | No |
| Modulation | Yes (e.g. QAM, PSK) | Yes (e.g. AM, FM, PM) |
| Noise handling | Correctable via coding | Directly degrades signal quality |

Students should understand that modern communication is a layered process, not simply “send voltage from A to B.”

## 5. Slides 24-31: Pulse Transmission and Eye Diagrams

This section moves toward digital transmission.

Slides 25-30 introduce the eye diagram, one of the most useful practical views of digital signal quality. By overlaying many pulse periods, engineers can see timing uncertainty, noise, and distortion in a single picture.

Key terms:
- jitter: timing variation in edges
- smearing: blurred or widened transitions
- ringing: overshoot and oscillation after an edge
- ISI: inter-symbol interference, where one symbol affects the next

What an eye diagram tells you:
- where to sample the signal
- how much timing margin exists
- how much noise margin exists
- whether the channel is degrading the pulse shape

Slide 31 adds multipath as a real radio example. Reflections create delayed copies of the signal, which interfere with later symbols.

## 6. Slides 32-38: Bandwidth

These slides explain that bandwidth is the frequency range a signal occupies or a channel can support.

Slides 34-35 show that adding harmonics increases bandwidth. This is a crucial idea: preserving waveform detail usually requires more high-frequency content.

Slide 36 defines analogue bandwidth in terms of baseband frequency content. For audio, this is often treated as roughly $20\,\mathrm{Hz}$ to $20\,\mathrm{kHz}$.

Slide 37 gives a telephone example and introduces frequency division multiplexing.

Slide 38 compares analogue bandwidth with digital bitrate. Once a signal is sampled and quantized, the transmission requirement is often discussed in bits per second rather than only hertz.

Example from the lecture:
- $44.1\,\mathrm{kHz} \times 16\,\mathrm{bit} = 705.6\,\mathrm{kb/s}$ for mono PCM audio

## 7. Slides 39-68: Noise

This is one of the most important sections in the lecture.

Slides 40-43 define noise as unwanted disturbance added to the signal. In analogue systems it reduces quality directly; in digital systems it causes decision errors or retransmissions.

Slides 45-52 connect noise to physical electronics:
- current is charge flow
- conductors, insulators, and semiconductors behave differently
- semiconductor structure explains how modern devices work

Slides 53-55 describe major noise types:
- shot noise
- thermal noise
- burst noise
- flicker noise
- interference and contact-related noise

Important formula from the slides:
- $P = 4kTRB$

This shows thermal noise power depends on temperature, resistance, and bandwidth.

Slides 56-58 compare white noise and pink noise:
- white noise has flat power spectral density
- pink noise falls by `3 dB` per octave

Slides 59-63 explain how noise is analysed and measured:
- use time and frequency domains
- treat noise statistically
- use RMS for effective level
- use SNR to compare wanted signal to noise

Useful formulas:
- $\mathrm{SNR}(\mathrm{dB}) = 10\log_{10}\left(\frac{P_{\mathrm{signal}}}{P_{\mathrm{noise}}}\right)$
- $\mathrm{SNR}(\mathrm{dB}) = 20\log_{10}\left(\frac{V_{\mathrm{signal}}}{V_{\mathrm{noise}}}\right)$

Slides 64-68 apply these ideas to sensors and receivers:
- photoelectric conversion creates image signal
- dynamic range depends on signal floor and saturation limit
- noise factor and noise figure describe how much extra noise a device adds

## 8. Slides 69-81: Distortion

Noise is added to a signal; distortion changes the signal itself. That distinction matters.

Slides 69-73 introduce the main distortion types:
- frequency distortion
- phase distortion
- harmonic distortion
- intermodulation distortion
- transient response problems

Practical message:
- if a system is band-limited, fast waveform changes are rounded
- if a system is non-linear, new frequencies are created

Slides 74-75 focus on clipping and overload. This happens when gain and power-supply limits do not match the required output swing.

Slides 76-77 explain intermodulation distortion. When two frequencies pass through a non-linear device, extra frequencies appear at sums and differences.

Slides 78-81 explain harmonic distortion and THD. Harmonics are multiples of one original frequency, and THD compares total harmonic content with the wanted fundamental.

Students should remember:
- harmonic distortion comes from one tone becoming many multiples
- intermodulation distortion comes from several tones interacting
- equal THD values can still sound different because harmonic structure matters

## 9. Slides 82-89: From Analogue to Digital

This final section explains why digital systems dominate modern broadcast engineering.

Slide 84 contrasts analogue and digital:
- analogue allows a continuous range of values
- digital uses discrete states and threshold decisions

This is the main advantage of digital transmission: the receiver does not need the exact original waveform level, only the correct logical decision.

Slides 85-86 show that digital systems still suffer distortion and timing problems, especially if clock recovery is poor. Digital is more robust, not magically perfect.

Slides 87-89 present the practical digital chain:
- keep the signal digital through production and distribution when possible
- use ADC to enter the digital domain
- use DSP to process, store, and transmit
- use DAC only when analogue output is required

## 10. Final Revision Summary

Students should leave this lecture with seven main ideas:

1. Sine waves are the foundation of signal theory.
2. Signals are shaped not only by the source but by the channel.
3. Bandwidth limits how much signal detail can be carried.
4. Noise is random and must be measured statistically.
5. Distortion changes the waveform itself and often creates new frequency content.
6. Eye diagrams are a key way to judge digital pulse quality.
7. Digital systems are more robust because they use discrete decisions, coding, and timing recovery.
