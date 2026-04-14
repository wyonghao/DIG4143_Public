Here are **concise, exam-ready key takeaways for Session 4 (Modulation & Multiplexing)**:

---

## 1. Signal Transmission Pipeline

* End-to-end chain:
  **Source → Encoding → Modulation → Channel → Demodulation → Decoding** 
* Real channels introduce:

  * Noise, interference, attenuation, jitter
* Goal: minimise errors → approach Shannon limit

---

## 2. Why Modulation is Needed

* Baseband signals (low frequency) → **require large antennas (impractical)** 
* Solution:

  * Shift signal to **high-frequency carrier**
* Carrier parameters modified:

  * Amplitude (AM)
  * Frequency (FM)
  * Phase (PM)

---

## 3. Carrier & Frequency Concepts

* Carrier = sinusoidal wave
* Relationship:

  * Higher frequency → smaller wavelength → smaller antenna
* Enables:

  * Multiple channels on different frequencies (tuning)

---

## 4. Types of Modulation

### (a) Amplitude Modulation (AM)

* Signal changes **amplitude of carrier**
* Produces:

  * Carrier + Upper Sideband (USB) + Lower Sideband (LSB) 
* Weakness:

  * **Highly sensitive to noise** (noise affects amplitude) 

---

### (b) Frequency Modulation (FM)

* Signal changes **frequency of carrier**
* Advantage:

  * **Robust to noise** (amplitude noise ignored) 

---

### (c) Digital Modulation

* Cannot transmit raw bits → must use analogue carrier 
* Examples:

  * PSK (phase changes)
  * QAM (phase + amplitude)

---

## 5. QAM (Quadrature Amplitude Modulation)

* Combines amplitude + phase
* More constellation points → more bits per symbol:

  * 16-QAM → 4 bits
  * 64-QAM → 6 bits
  * 256-QAM → 8 bits 

Trade-off:

* ↑ data rate → ↓ robustness (more error-prone)

---

## 6. Inter-Symbol Interference (ISI)

* Cause:

  * Multipath propagation (signals arrive at different times) 
* Effects:

  * Signal overlap → decoding errors
* Seen in:

  * Radio (reflections)
  * Cables (delays, dispersion)

---

## 7. Multiplexing (Key Concept)

→ **Send multiple signals over one channel**

### (a) FDM (Frequency Division)

* Each signal uses a **different carrier frequency**
* Requires guard bands 

---

### (b) TDM (Time Division)

* Signals share channel **in time slots**
* Data interleaved into frames 

---

### (c) Statistical Multiplexing

* Dynamic allocation (Variable Bit Rate)
* More efficient use of bandwidth 

---

### (d) WDM (Optical Fibre)

* Each signal uses a **different wavelength**
* Used in fibre systems 

---

## 8. Key Trade-offs to Remember

* **AM vs FM**:

  * AM: simple but noisy
  * FM: complex but robust
* **QAM**:

  * High capacity vs low reliability
* **Multiplexing**:

  * Efficiency vs complexity

---

## 9. One-line Summary (good for students)

* **Modulation = move signal to carrier**
* **Multiplexing = share the channel**
* **Noise + interference = main limitation**
