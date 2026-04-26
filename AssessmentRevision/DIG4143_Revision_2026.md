# DIG4143 – Revision Knowledge List (Official)

_Last updated: 2026-04-26_

1. Understand amplitude, frequency, and sampling frequency
    - Be able to extract these values from a signal expression
    - Understand signal period and sampling period and their relationship
    - Understand sampling as time discretisation

2. Understand CD-quality audio format (44.1 kHz, 16-bit, stereo)
    - Be able to calculate bit rate in bps / Mbps
    - Be able to estimate storage for long durations (bit → byte → MB/GB)
    - Understand relationship between bit rate and transmission bandwidth

3. Understand band-limited signals and sampling (Nyquist concept)
    - Be able to calculate bit rate for PCM voice channels
    - Understand how Time Division Multiplexing (TDM) works using time slots and frames
    - Be able to calculate total bit rate for multiplexed systems

4. Understand structured digital audio transport (e.g. frame, subframe concepts)
    - Be able to calculate transmission rate including overhead
    - Understand:
        - link utilisation (transmission rate vs link capacity)
        - payload utilisation (useful data vs total transmission)
        - Be able to estimate maximum channel capacity for different links

5. Understand why transmission performance degrades with distance in cables
    - Signal distortion due to cable properties (R, L, C, G)
    - Interference between signals (e.g. crosstalk)
    - Reduction in signal quality (e.g. SNR and error rates)

6. Understand amplitude modulation (AM) and frequency modulation (FM)
    - Understand how information is represented in a carrier
    - Be able to sketch AM spectrum (carrier + sidebands)

7. Understand jitter as timing variation in digital signals
    - Understand causes (clock instability, transmission effects)
    - Understand impact on sampling and decoding errors
    - Relate jitter to eye diagram behaviour

8. Understand Frequency Division Multiplexing (FDM)
    - Understand Time Division Multiplexing (TDM)
    - Compare with packet-based transmission

9. Understand statistical multiplexing
    - Understand variable bit rate (VBR) vs constant bit rate (CBR)
    - Understand buffering and packet formation
    - Understand efficiency gains from dynamic bandwidth allocation

10. Understand gamma as a non-linear brightness mapping
    - Understand impact of incorrect gamma (washed-out, overly dark/bright images)
    - Understand need for matching capture and display characteristics

11. Understand HDR transfer functions
    - Understand perceptual mapping of luminance
    - Understand characteristics of two HDR approaches (e.g. perceptual vs hybrid/log-based)
    - Understand application contexts (broadcast vs display systems)

12. Understand RGB vs YCbCr representation
    - Understand separation of luminance and chrominance
    - Understand human visual sensitivity differences
    - Understand why this enables compression

13. Understand chroma subsampling structures (e.g. 4:4:4 vs 4:2:2)
    - Be able to calculate bits per pixel for different formats
    - Be able to calculate percentage data reduction
    - Understand trade-off between data rate and colour resolution

14. Understand the difference between MPEG Programme Stream (PS) and Transport Stream (TS)
    - Understand that TS uses fixed-size packets (188 bytes) for robustness, while PS uses variable-length packets for efficiency
    - Understand the trade-off between error robustness (TS) and transmission efficiency (PS)
    - Understand typical applications: TS for broadcast/streaming, PS for storage/file-based media

15. Understand adaptive streaming over IP (e.g. MPEG-DASH)
    - Understand segmentation of video into chunks and bitrate switching based on network conditions
    - Understand how adaptive streaming maintains playback under varying bandwidth
    - Understand trade-off between buffering (smooth playback) and latency

16. Understand how human vision influences compression
    - Understand spatial redundancy  (similar pixels within a frame)
    - Understand temporal redundancy (similar frames over time)
    - Understand perceptual coding (higher importance of luma over chroma)

17. Understand different media distribution architectures
    - Understand terrestrial, satellite, cable, and IP delivery models
    - Compare these in terms of coverage, bandwidth, latency, and scalability
    - Understand the transition from traditional broadcast systems to IP-based delivery

18. Understand the purpose of Content Distribution Networks (CDN)
    - Understand roles of origin servers and edge servers
    - Understand caching and content delivery from geographically close nodes
    - Understand how CDNs reduce latency and improve scalability

19. Understand limitations of subjective signal assessment (visual judgement)
    - Understand need for objective measurement tools
    - Understand use of waveform monitors, vectorscopes, and eye diagrams
    - Understand importance of repeatability and standardised testing

20. Understand the transition from SDI to IP-based media transport
    - Understand advantages of IP systems (flexibility, scalability, cost)
    - Understand challenges of packet-based transport (packet loss, buffering, routing)
    - Understand sources of latency in IP systems
    - Understand need for synchronisation (e.g. PTP) in IP-based media systems
