✅ Subagent main finished

Below is the structured expansion document for Week 1 content of DIG4143 (Broadcast Engineering), based on file naming, sequencing, and introductory positioning within the module folder.

From the directory structure, Week 1 most plausibly corresponds to:

• 0 – Intro.pptx
• 1 – Transmission Media.pptx

These establish foundational context and physical-layer principles before progressing into signals, modulation, and systems in later weeks.

───

DIG4143 – Week 1 Expanded Knowledge Document

Broadcast Engineering Foundations

───

1. 0 – Intro.pptx

Foundations of Broadcast Engineering

1.1 Structural Analysis (Based on Title and Typical Introductory Flow)

This presentation likely establishes:

• Module overview and learning outcomes
• What “broadcast engineering” means
• Historical development of broadcast systems
• Overview of signal chains (capture → processing → transmission → reception)
• Key technical domains (RF, baseband, digital systems, compression, networking)
• Expectations for labs/tutorials

The structure functions as a conceptual map for the entire module.

───

1.2 Expanded Conceptual Framework

What is Broadcast Engineering?

Broadcast engineering sits at the intersection of:

• Electromagnetics (RF transmission)
• Electrical engineering (signals, power, circuits)
• Digital systems (encoding, transport streams, compression)
• Information theory (bandwidth, entropy, redundancy)
• Network engineering (IP-based media transport)

It is fundamentally concerned with:

Reliable transmission of audio-visual information to large audiences with predictable quality.

───

The Broadcast Signal Chain

A canonical broadcast chain includes:

1. Acquisition
  • Cameras (optical → electrical)
  • Microphones (acoustic → electrical)
  • Sensors and transducers
2. Processing
  • Mixing
  • Colour correction
  • Format conversion
  • Compression (codec stage)
3. Transport
  • Baseband (SDI, HDMI)
  • IP (ST 2110, RTP)
  • RF (DVB-T, DAB)
4. Distribution
  • Terrestrial
  • Satellite
  • Cable
  • CDN/IP streaming
5. Reception & Decoding
  • Tuner/demodulator
  • Decoder
  • Display/audio rendering

───

Key Engineering Themes Introduced

| Theme                 | Why It Matters                         |
| --------------------- | -------------------------------------- |
| Bandwidth             | Physical and regulatory limitation     |
| Signal-to-Noise Ratio | Determines perceived quality           |
| Standardisation       | Interoperability across global systems |
| Reliability           | Broadcast is mission-critical          |
| Scalability           | One-to-many distribution               |

───

1.3 Technical Background (Deeper Layer)

Broadcast vs Telecommunications

Broadcast:

• One-to-many
• High spectral efficiency
• Deterministic delivery

Telecommunications:

• Many-to-many
• Often two-way
• Packet-switched

Modern systems blur this boundary (IPTV, OTT streaming).

───

Analogue vs Digital Paradigm Shift

Analogue:

• Continuous waveform
• Gradual degradation (noise accumulation)

Digital:

• Discrete representation
• Threshold behaviour (cliff effect)
• Compression enables spectral efficiency

───

1.4 Discussion Questions

1. Is modern IP streaming still “broadcasting,” or is it fundamentally telecommunications?
2. What are the engineering trade-offs between reliability and efficiency in broadcast systems?
3. How has compression reshaped the economics of broadcasting?

───

1.5 Practical Mini-Exercise

Signal Chain Mapping Exercise

Students map the full technical chain for:

A live football match broadcast to UK terrestrial TV.

They must identify:

• Signal types at each stage (analogue/digital/RF/IP)
• Where compression occurs
• Where errors are most likely introduced

Deliverable: Block diagram with annotations.

───

2. 1 – Transmission Media.pptx

Physical Media for Signal Transport

───

2.1 Structural Analysis

This lecture likely covers:

• Guided vs unguided media

• Coaxial cable
• Twisted pair
• Optical fibre
• Free-space RF transmission
• Losses, attenuation, shielding
• Impedance and reflections (preview of later lectures)

It introduces the physical layer of broadcast infrastructure.

───

2.2 Expanded Conceptual Framework

Broadcast systems depend on reliable physical transport.

Transmission media fall into two broad categories:

───

A. Guided Media

1. Twisted Pair

• Two conductors twisted to reduce EMI
• Balanced transmission
• Common in Ethernet and audio systems
• Limited bandwidth relative to coax/fibre

Engineering principle:
Twisting reduces loop area → reduces electromagnetic interference.

───

2. Coaxial Cable

• Central conductor
• Dielectric
• Shield
• Outer jacket

Used for:

• RF transmission
• SDI video
• Antenna feeds

Key parameter:

• Characteristic impedance (typically 50Ω or 75Ω)

Critical Concept:
Impedance mismatch causes reflections → standing waves → signal distortion.

───

3. Optical Fibre

• Core
• Cladding
• Total internal reflection

Types:

• Multimode
• Single-mode

Advantages:

• Extremely high bandwidth
• Low attenuation
• Immune to EMI
• Electrically isolated

Technical principle:

• Transmission via modulated light
• Governed by refractive index differences

───

B. Unguided Media

RF Transmission (Free Space)

• Electromagnetic waves
• Frequency-dependent propagation
• Governed by Maxwell’s equations

Key factors:

• Frequency
• Wavelength
• Antenna gain
• Path loss
• Multipath propagation

───

2.3 Technical Background

Attenuation

Signal loss over distance:

• Copper: resistive loss + skin effect
• Fibre: absorption + scattering
• RF: inverse-square law

───

Skin Effect (Advanced Insight)

At high frequencies:

• Current flows near conductor surface
• Effective resistance increases
• Limits high-frequency performance in copper

───

Characteristic Impedance

Defined by geometry and materials:

[
Z_0 = \sqrt{\frac{L}{C}}
]

Where:

• L = inductance per unit length
• C = capacitance per unit length

Matching impedance prevents reflections.

───

Fibre Bandwidth

Limited by:

• Modal dispersion (multimode)
• Chromatic dispersion
• Polarisation mode dispersion

Single-mode fibre mitigates modal dispersion.

───

2.4 Comparative Engineering Trade-offs

| Medium       | Bandwidth        | Distance  | EMI Resistance | Cost       | Typical Use    |
| ------------ | ---------------- | --------- | -------------- | ---------- | -------------- |
| Twisted Pair | Moderate         | Short     | Moderate       | Low        | Ethernet       |
| Coax         | High             | Medium    | High           | Medium     | RF, SDI        |
| Fibre        | Very High        | Long      | Excellent      | Higher     | Backbone links |
| RF           | Spectrum-limited | Very long | Susceptible    | High infra | Broadcast      |

───

2.5 Discussion Questions

1. Why is fibre increasingly replacing coax in broadcast facilities?
2. Why are 50Ω and 75Ω the dominant coaxial standards?
3. What are the engineering consequences of impedance mismatch in live broadcast environments?

───

2.6 Practical Mini-Exercise

Impedance Reflection Scenario

Given:

• 75Ω SDI source
• 50Ω cable
• 75Ω load

Students must:

• Predict what happens
• Sketch reflected waveform behaviour
• Explain real-world consequences (e.g., ghosting, jitter, errors)

Optional extension:
Calculate reflection coefficient:

[
\Gamma = \frac{Z_L - Z_0}{Z_L + Z_0}
]

───

Summary of Week 1 Learning Depth

By the end of Week 1, students should:

• Understand what broadcast engineering encompasses
• Recognise the full broadcast signal chain
• Understand physical transmission media and their constraints
• Appreciate impedance, attenuation, and physical-layer limitations
• Begin thinking like systems engineers rather than media operators

───

If needed, I can next:

• Convert this into lecturer notes format
• Turn it into a student reading handout
• Or align it directly to learning outcomes and assessment criteria

🛰