From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16436] ath5k (AR5001) does not work after resume and fails with
 "ath5k phy0: gain calibration timeout"
Date: Mon, 14 May 2012 22:46:45 +0000 (UTC)
Message-ID: <20120514224645.B26BB11FCE7@bugzilla.kernel.org>
References: <bug-16436-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16436-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16436





--- Comment #43 from Stoian Ivanov <sdr@mail.bg>  2012-05-14 22:46:45 ---
Managed to grabb a ath_info with "broken" state of the driver. This is with
cpufreq completely disabled from menuconfig. 

sdr@hristo ~/tmp/ath_info $ cat info_in_error.log 
 -==Device Information==-
MAC Revision: 2413  (0x78)
Device type:  2
2GHz PHY Revision: 2413  (0x56)

/============== EEPROM Information =============\
| EEPROM Version:   5.3 | EEPROM Size:  16 kbit |
| EEMAP:              2 | Reg. Domain:     0x809C |
|================= Capabilities ================|
| 802.11a Support:  no  | Turbo-A disabled: no  |
| 802.11b Support:  yes | Turbo-G disabled: yes |
| 802.11g Support:  yes | 2GHz XR disabled: no  |
| RFKill  Support:  no  | 5GHz XR disabled: no  |
| 32kHz   Crystal:  no  |                       |
\===============================================/

/=========================================================\
|          Calibration data common for all modes          |
|=========================================================|
|          CCK/OFDM gain delta:             1             |
|          CCK/OFDM power delta:           251             |
|          Scaled CCK delta:                5             |
|          2GHz Antenna gain:               1             |
|          5GHz Antenna gain:               0             |
|          Turbo 2W maximum dBm:           38             |
|          Target power start:          0x17c             |
|          EAR Start:                   0x1d6             |
\=========================================================/

/=========================================================\                     
|          Calibration data for 802.11b operation         |                     
|=========================================================|                     
| I power:              0x00 | Q power:              0x00 |                     
| Use fixed bias:       0x00 | Max turbo power:      0x00 |                     
| Max XR power:         0x00 | Switch Settling Time: 0x23 |                     
| Tx/Rx attenuation:    0x1c | TX end to XLNA On:    0x00 |                     
| TX end to XPA Off:    0x00 | TX end to XPA On:     0x07 |                     
| 62db Threshold:       0x1c | XLNA gain:            0x0c |                     
| XPD:                  0x01 | XPD gain:             0x0a |                     
| I gain:               0x00 | Tx/Rx margin:         0x19 |                     
| False detect backoff: 0x00 | Noise Floor Threshold:  -1 |                     
| ADC desired size:      -38 | PGA desired size:      -80 |                     
|=========================================================|                     
| Antenna control   0:  0x00 | Antenna control   1:  0x02 |                     
| Antenna control   2:  0x25 | Antenna control   3:  0x25 |                     
| Antenna control   4:  0x21 | Antenna control   5:  0x21 |                     
| Antenna control   6:  0x01 | Antenna control   7:  0x26 |                     
| Antenna control   8:  0x26 | Antenna control   9:  0x22 |                     
| Antenna control  10:  0x22 | Antenna control  11:  0x00 |                     
|=========================================================|                     
| Octave Band 0:           0 | db 0:                    0 |                     
| Octave Band 1:           3 | db 1:                    5 |                     
| Octave Band 2:           0 | db 2:                    0 |                     
| Octave Band 3:           0 | db 3:                    0 |
\=========================================================/
/============== Per rate power calibration ===========\
| Freq |   1Mbit/s  | 2Mbit/s  | 5.5Mbit/s | 11Mbit/s |
|======|============|==========|===========|==========|
| 2412 |    19.01   |  19.01   |   19.01   |  19.01   |
|======|============|==========|===========|==========|
| 2484 |    19.01   |  19.01   |   19.01   |  19.01   |
\=====================================================/
/====================== Per channel power calibration ===================\
| Freq |  pwr_i  |    pwr_0    |    pwr_1    |    pwr_2    |    pwr_3    |
|      | pddac_i |   pddac_0   |   pddac_1   |   pddac_2   |   pddac_3   |
|======|=========|=============|=============|=============|=============|
| 2412 |         |             |             |             |             |
|------|---------|-------------|-------------|-------------|-------------|
|      |     0   |     4.00    |     8.50    |    13.00    |     0.00    |
|      |     7   |       16    |       37    |       75    |        0    |
|------|---------|-------------|-------------|-------------|-------------|
|      |    10   |    14.00    |    18.00    |    22.00    |    25.00    |
|      |    12   |       22    |       41    |       69    |      101    |
|======|=========|=============|=============|=============|=============|
| 2472 |         |             |             |             |             |
|------|---------|-------------|-------------|-------------|-------------|
|      |     0   |     4.00    |     8.50    |    13.00    |     0.00    |
|      |     9   |       19    |       44    |       89    |        0    |
|------|---------|-------------|-------------|-------------|-------------|
|      |    10   |    14.00    |    18.50    |    22.50    |    25.00    |
|      |    14   |       25    |       47    |       79    |      111    |
\========================================================================/

/=========================================================\
|          Calibration data for 802.11g operation         |
|=========================================================|
| I power:              0x00 | Q power:              0x10 |
| Use fixed bias:       0x01 | Max turbo power:      0x26 |
| Max XR power:         0x26 | Switch Settling Time: 0x31 |
| Tx/Rx attenuation:    0x1c | TX end to XLNA On:    0x00 |
| TX end to XPA Off:    0x00 | TX end to XPA On:     0x0e |
| 62db Threshold:       0x1c | XLNA gain:            0x0c |
| XPD:                  0x01 | XPD gain:             0x0a |
| I gain:               0x00 | Tx/Rx margin:         0x19 |
| False detect backoff: 0x00 | Noise Floor Threshold:  -1 |
| ADC desired size:      -38 | PGA desired size:      -80 |
|=========================================================|
| Antenna control   0:  0x00 | Antenna control   1:  0x02 |
| Antenna control   2:  0x25 | Antenna control   3:  0x25 |
| Antenna control   4:  0x21 | Antenna control   5:  0x21 |
| Antenna control   6:  0x01 | Antenna control   7:  0x26 |
| Antenna control   8:  0x26 | Antenna control   9:  0x22 |
| Antenna control  10:  0x22 | Antenna control  11:  0x02 |
|=========================================================|
| Octave Band 0:           0 | db 0:                    0 |
| Octave Band 1:           3 | db 1:                    5 |
| Octave Band 2:           0 | db 2:                    0 |
| Octave Band 3:           0 | db 3:                    0 |
\=========================================================/
/==================== Turbo mode infos ===================\
| Switch Settling time: 0x62 | Tx/Rx margin:         0x19 |
| Tx/Rx attenuation:    0x1c | ADC desired size:      -32 |
| PGA desired size:      -80 |                            |
\=========================================================/
/============== Per rate power calibration ===========\
| Freq | 6-24Mbit/s | 36Mbit/s |  48Mbit/s | 54Mbit/s |
|======|============|==========|===========|==========|
| 2412 |    19.00   |  18.00   |   17.00   |  16.00   |
|======|============|==========|===========|==========|
| 2437 |    19.00   |  18.00   |   17.00   |  16.00   |
|======|============|==========|===========|==========|
| 2462 |    19.00   |  18.00   |   17.00   |  16.00   |
\=====================================================/
/====================== Per channel power calibration ===================\
| Freq |  pwr_i  |    pwr_0    |    pwr_1    |    pwr_2    |    pwr_3    |
|      | pddac_i |   pddac_0   |   pddac_1   |   pddac_2   |   pddac_3   |
|======|=========|=============|=============|=============|=============|
| 2412 |         |             |             |             |             |
|------|---------|-------------|-------------|-------------|-------------|
|      |     0   |     4.00    |     8.50    |    13.00    |     0.00    |
|      |     6   |       12    |       31    |       68    |        0    |
|------|---------|-------------|-------------|-------------|-------------|
|      |    10   |    14.00    |    18.00    |    21.50    |    24.00    |
|      |    11   |       20    |       35    |       61    |       86    |
|======|=========|=============|=============|=============|=============|
| 2437 |         |             |             |             |             |
|------|---------|-------------|-------------|-------------|-------------|
|      |     0   |     4.00    |     8.50    |    13.00    |     0.00    |
|      |     1   |       11    |       29    |       68    |        0    |
|------|---------|-------------|-------------|-------------|-------------|
|      |    10   |    14.00    |    18.50    |    21.50    |    24.50    |
|      |    12   |       22    |       37    |       62    |       94    |
|======|=========|=============|=============|=============|=============|
| 2472 |         |             |             |             |             |
|------|---------|-------------|-------------|-------------|-------------|
|      |     0   |     4.00    |     8.50    |    13.00    |     0.00    |
|      |     3   |       11    |       29    |       66    |        0    |
|------|---------|-------------|-------------|-------------|-------------|
|      |    10   |    14.00    |    18.00    |    22.00    |    24.50    |
|      |    11   |       22    |       38    |       65    |       97    |
\========================================================================/

GPIO registers: CR 0x00000003, DO 0x00000001, DI 0x00000011
STA_ID0: 74:ea:3a:d9:a5:c4
STA_ID1: 0x1000c4a5, AP: 0, IBSS: 0, KeyCache Disable: 0
TIMER0: 0x00000030, TBTT:    48, TU: 0x00010030
TIMER1: 0x0007ffff, DMAb: 65535, TU: 0x0000ffff (-49)
TIMER2: 0x01ffffff, SWBA: 65535, TU: 0x003fffff (+4128719)
TIMER3: 0x00000031, ATIM:    49, TU: 0x00010031 (+1)
TSF: 0x00000000001e0162, TSFTU:  1920, TU: 0x00000780
BEACON: 0x00000000
LAST_TSTP: 0xda8c7183

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
