# Samsung Galaxy S25 Ultra GCam Config (`AGC 9.6`)

Calibrated `.agc` configuration profile for **BigKaka AGC 9.6** (`AGC9.6.19_V7.0_samsung.apk`, package `com.samsung.agc.gcam96`) on the **Samsung Galaxy S25 Ultra** (Snapdragon 8 Elite, One UI 9.0 / Android 17).

Full setup walkthrough and troubleshooting guide: [Best GCam Port for Samsung Galaxy S25 Ultra (TechLoverHD)](https://techloverhd.com/2026/11/gcam-port-samsung-galaxy-s25-ultra-config-xml/)

## Direct Download
- [`S25U_ISOCELL_Pro_v7.agc`](https://raw.githubusercontent.com/techloverhd/production-configs/main/android/gcam-s25-ultra/S25U_ISOCELL_Pro_v7.agc)

## Mapped Camera2 API Sensors
| Lens Toggle | Physical Hardware Sensor | Camera2 API ID |
| :--- | :--- | :--- |
| `Main (1.0x)` | 200 MP Samsung ISOCELL HP2 (`1/1.3"`) | `0` |
| `Wide (0.6x)` | 50 MP Samsung ISOCELL JN3 (`1/2.5"`) | `2` |
| `Tele (3.0x)` | 10 MP Sony IMX754 (`1/3.52"`) | `3` |
| `Periscope (5.0x)` | 50 MP Sony IMX854 (`1/2.52"`) | `4` |
| `Front (1.0x)` | 12 MP Samsung ISOCELL 3LU (`1/3.2"`) | `1` |

## Installation
1. Install `AGC9.6.19_V7.0_samsung.apk` (`com.samsung.agc.gcam96`) and grant Camera, Microphone, Location, and All Files access.
2. Copy `S25U_ISOCELL_Pro_v7.agc` into `/Download/AGC.9.6/configs/` on internal storage (rename back to `.agc` if your browser appends `.xml` or `.txt`).
3. Open AGC 9.6, tap the **Profile** icon in the top-right viewfinder bar, choose **Load Configs**, select `S25U_ISOCELL_Pro_v7.agc`, and tap **Load**.
