From: Sebastian <sebastian_ml@gmx.net>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files
 = freeze
Date: Thu, 23 Dec 2004 14:17:17 +0100
Message-ID: <41CAC55D.10900@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Ok,

seems like attaching the output didn't really work. Here we go:

----------------------------------------------------------------
----------------------------------------------------------------

1. worked for the first time
2. freezing after 35 seconds
3. cpufreq.debug=1

dmesg output:

cpufreq-core: trying to register driver longhaul
cpufreq-core: adding CPU 0
longhaul: VIA C3 'Samuel 2' [C5B] CPU detected.  Longhaul v1 supported.
freq-table: table entry 0: 399000 kHz, 1 index
freq-table: table entry 1: 532000 kHz, 2 index
freq-table: table entry 2: 465000 kHz, 5 index
freq-table: table entry 3: 598000 kHz, 6 index
freq-table: setting show_table for cpu 0 to c1221e80
cpufreq-core: setting new policy for CPU 0: 399000 - 598000 kHz
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 399000 - 598000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 1
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 598000 kHz, relation 0
freq-table: request for target 598000 kHz (relation: 0) for cpu 0
freq-table: target is 3 (598000 kHz, 6)
cpufreq-core: notification 0 of frequency transition to 598000 kHz
cpufreq-core: saving 591872 as reference value for loops_per_jiffy; freq 
is 598000 kHz
cpufreq-core: notification 1 of frequency transition to 598000 kHz
cpufreq-core: initialization complete
cpufreq-core: driver longhaul up and running
SGI XFS with no debug enabled
ACPI: Power Button (FF) [PWRF]
cpufreq-core: updating policy for CPU 0
cpufreq-core: setting new policy for CPU 0: 399000 - 598000 kHz
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 399000 - 598000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 598000 kHz, relation 0
freq-table: request for target 598000 kHz (relation: 0) for cpu 0
freq-table: target is 3 (598000 kHz, 6)
ACPI: Processor [CPU0] (supports C1 C2)
ACPI: Processor [CPU0] (supports 2 throttling states)

Cutting a recording: froze after 5 seconds.

vdr root # speedfreq -m
New policy: dynamic 399-598 MHz
CPU new speed 399 MHz, 95.0027% idle
CPU new speed 532 MHz, 13.1302% idle
CPU new speed 598 MHz, 28.5787% idle
CPU new speed 532 MHz, 99.9924% idle
CPU new speed 399 MHz, 94.7394% idle
CPU new speed 532 MHz, 25.0019% idle
CPU new speed 598 MHz, 26.309% idle

tail -f /var/log/messages:

Dec 23 11:35:38 vdr cpufreq-core: setting new policy for CPU 0: 399000 - 
598000 kHz
Dec 23 11:35:38 vdr freq-table: request for verification of policy 
(399000 - 598000 kHz) for cpu 0
Dec 23 11:35:38 vdr freq-table: verification lead to (399000 - 598000 
kHz) for cpu 0
Dec 23 11:35:38 vdr freq-table: request for verification of policy 
(399000 - 598000 kHz) for cpu 0
Dec 23 11:35:38 vdr freq-table: verification lead to (399000 - 598000 
kHz) for cpu 0
Dec 23 11:35:38 vdr cpufreq-core: new min and max freqs are 399000 - 
598000 kHz
Dec 23 11:35:38 vdr cpufreq-core: governor: change or update limits
Dec 23 11:35:38 vdr cpufreq-core: __cpufreq_governor for CPU 0, event 3
Dec 23 11:35:38 vdr cpufreq-core: target for CPU 0: 598000 kHz, relation 0
Dec 23 11:35:38 vdr freq-table: request for target 598000 kHz (relation: 
0) for cpu 0
Dec 23 11:35:38 vdr freq-table: target is 3 (598000 kHz, 6)
Dec 23 11:35:38 vdr cpufreq-core: target for CPU 0: 498000 kHz, relation 0
Dec 23 11:35:38 vdr freq-table: request for target 498000 kHz (relation: 
0) for cpu 0
Dec 23 11:35:38 vdr freq-table: target is 1 (532000 kHz, 2)
Dec 23 11:35:38 vdr cpufreq-core: notification 0 of frequency transition 
to 532000 kHz
Dec 23 11:35:38 vdr cpufreq-core: notification 1 of frequency transition 
to 532000 kHz
Dec 23 11:35:38 vdr cpufreq-core: scaling loops_per_jiffy to 526548 for 
frequency 532000 kHz
Dec 23 11:35:38 vdr cpufreq-core: target for CPU 0: 399000 kHz, relation 0
Dec 23 11:35:38 vdr freq-table: request for target 399000 kHz (relation: 
0) for cpu 0
Dec 23 11:35:38 vdr freq-table: target is 0 (399000 kHz, 1)
Dec 23 11:35:38 vdr cpufreq-core: notification 0 of frequency transition 
to 399000 kHz
Dec 23 11:36:29 vdr printk: 2 messages suppressed.
Dec 23 11:36:29 vdr cpufreq-core: target for CPU 0: 499000 kHz, relation 0
Dec 23 11:36:29 vdr freq-table: request for target 499000 kHz (relation: 
0) for cpu 0
Dec 23 11:36:29 vdr freq-table: target is 1 (532000 kHz, 2)
Dec 23 11:36:29 vdr cpufreq-core: notification 0 of frequency transition 
to 532000 kHz
Dec 23 11:36:29 vdr cpufreq-core: scaling loops_per_jiffy to 526548 for 
frequency 532000 kHz
Dec 23 11:36:29 vdr cpufreq-core: notification 1 of frequency transition 
to 532000 kHz
Dec 23 11:36:30 vdr cpufreq-core: target for CPU 0: 598000 kHz, relation 0
Dec 23 11:36:30 vdr freq-table: request for target 598000 kHz (relation: 
0) for cpu 0
Dec 23 11:36:30 vdr freq-table: target is 3 (598000 kHz, 6)
Dec 23 11:36:30 vdr cpufreq-core: notification 0 of frequency transition 
to 598000 kHz

4. cpufreq.debug=2

dmesg:

longhaul: VIA C3 'Samuel 2' [C5B] CPU detected.  Longhaul v1 supported.
longhaul: MinMult:3.0x MaxMult:4.5x
longhaul: FSB:133MHz  Lowest speed: 399MHz   Highest speed:399MHz
longhaul: Setting to FSB:133MHz Mult:4.5x (598MHz)

Cutting a recording froze system after 1 minute 33 seconds.

vdr root # speedfreq -m
New policy: dynamic 399-598 MHz
CPU new speed 399 MHz, 100% idle
CPU new speed 532 MHz, 14.1518% idle
CPU new speed 399 MHz, 94.995% idle
CPU new speed 532 MHz, 14.9996% idle
CPU new speed 598 MHz, 25.0019% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 95.2336% idle
CPU new speed 532 MHz, 14.9996% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 95.2409% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.75948% idle
CPU new speed 532 MHz, 99.9924% idle
CPU new speed 399 MHz, 90.481% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 5.00458% idle
CPU new speed 532 MHz, 90.0053% idle
CPU new speed 399 MHz, 99.9924% idle
CPU new speed 532 MHz, 14.9996% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 90.4745% idle
CPU new speed 399 MHz, 100% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 89.9977% idle
CPU new speed 399 MHz, 95.2405% idle
CPU new speed 532 MHz, 5.00496% idle
CPU new speed 598 MHz, 10.0023% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 90.0053% idle
CPU new speed 532 MHz, 10.0023% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 95.2405% idle
CPU new speed 399 MHz, 90.0053% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 5.2602% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 89.9977% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 90.0053% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 94.9954% idle
CPU new speed 399 MHz, 85.0004% idle
CPU new speed 532 MHz, 14.9996% idle
CPU new speed 598 MHz, 15.7886% idle
CPU new speed 532 MHz, 95.2336% idle
CPU new speed 399 MHz, 95.0027% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.99695% idle
CPU new speed 532 MHz, 95.2409% idle
CPU new speed 399 MHz, 94.7318% idle
CPU new speed 532 MHz, 10.0015% idle
CPU new speed 598 MHz, 29.9992% idle
CPU new speed 532 MHz, 95.2336% idle
CPU new speed 399 MHz, 100% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 90.4745% idle
CPU new speed 532 MHz, 24.9924% idle
CPU new speed 598 MHz, 29.9992% idle
CPU new speed 532 MHz, 90.4745% idle
CPU new speed 399 MHz, 95.0027% idle
CPU new speed 532 MHz, 10.0023% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 90.0053% idle
CPU new speed 399 MHz, 89.9977% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 95.2336% idle
CPU new speed 532 MHz, 5.2602% idle
CPU new speed 598 MHz, 20.0046% idle
CPU new speed 532 MHz, 94.995% idle
CPU new speed 399 MHz, 95.0027% idle
CPU new speed 532 MHz, 29.9992% idle
CPU new speed 598 MHz, 5.26823% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 95.2405% idle
CPU new speed 532 MHz, 10.0023% idle
CPU new speed 598 MHz, 26.3171% idle
CPU new speed 532 MHz, 90.4745% idle
CPU new speed 399 MHz, 99.992% idle
CPU new speed 532 MHz, 4.99733% idle
CPU new speed 598 MHz, 20.0046% idle
CPU new speed 532 MHz, 94.9878% idle
CPU new speed 399 MHz, 95.0027% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 5.2602% idle
CPU new speed 532 MHz, 94.9954% idle
CPU new speed 399 MHz, 95.2405% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 5.00496% idle
CPU new speed 532 MHz, 90.481% idle
CPU new speed 399 MHz, 94.9954% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 89.9908% idle
CPU new speed 399 MHz, 100% idle
CPU new speed 532 MHz, 28.5766% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 89.9977% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.99695% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 90.481% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 95.2405% idle
CPU new speed 399 MHz, 89.9977% idle
CPU new speed 532 MHz, 4.7664% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 94.995% idle
CPU new speed 532 MHz, 19.9969% idle
CPU new speed 598 MHz, 20.0046% idle
CPU new speed 532 MHz, 94.7318% idle
CPU new speed 399 MHz, 95.2409% idle
CPU new speed 532 MHz, 5.26823% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 90.0053% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 90.0053% idle
CPU new speed 399 MHz, 95.0027% idle
CPU new speed 532 MHz, 28.5694% idle
CPU new speed 598 MHz, 4.76675% idle
CPU new speed 532 MHz, 94.7474% idle
CPU new speed 399 MHz, 90.4745% idle
CPU new speed 532 MHz, 14.9996% idle
CPU new speed 598 MHz, 29.9992% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 90.0053% idle
CPU new speed 532 MHz, 10.5284% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 89.9908% idle
CPU new speed 532 MHz, 28.5714% idle
CPU new speed 598 MHz, 5.26823% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 90.481% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 90.4738% idle
CPU new speed 399 MHz, 94.9954% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 95.2405% idle
CPU new speed 399 MHz, 90.4745% idle
CPU new speed 532 MHz, 9.9939% idle
CPU new speed 598 MHz, 20.0046% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 94.9954% idle
CPU new speed 532 MHz, 10.0015% idle
CPU new speed 598 MHz, 19.0452% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 94.7398% idle
CPU new speed 532 MHz, 15.0072% idle
CPU new speed 598 MHz, 4.75914% idle
CPU new speed 532 MHz, 95.0027% idle
CPU new speed 399 MHz, 90.4745% idle
CPU new speed 532 MHz, 20.0046% idle
CPU new speed 598 MHz, 25.0019% idle
CPU new speed 532 MHz, 90.4672% idle
CPU new speed 399 MHz, 95.0027% idle
CPU new speed 532 MHz, 19.9969% idle
CPU new speed 598 MHz, 21.0569% idle
CPU new speed 532 MHz, 94.7318% idle
CPU new speed 399 MHz, 89.9985% idle
CPU new speed 532 MHz, 25% idle
CPU new speed 598 MHz, 4.99733% idle
CPU new speed 532 MHz, 95.0099% idle
CPU new speed 399 MHz, 95.2405% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 95.2405% idle
CPU new speed 532 MHz, 19.0525% idle
CPU new speed 598 MHz, 4.75948% idle
CPU new speed 532 MHz, 94.7318% idle
CPU new speed 399 MHz, 95.2405% idle
CPU new speed 532 MHz, 15.0008% idle
CPU new speed 598 MHz, 14.9985% idle
CPU new speed 532 MHz, 95.2405% idle
CPU new speed 399 MHz, 94.9954% idle
CPU new speed 532 MHz, 5.2602% idle
CPU new speed 598 MHz, 20.0031% idle
CPU new speed 532 MHz, 90.0122% idle
CPU new speed 399 MHz, 89.9908% idle

tail -f /var/log/messages:

Dec 23 11:42:36 vdr sshd[6282]: Accepted publickey for root from 
192.168.0.2 port 32955 ssh2
Dec 23 11:43:31 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:43:31 vdr longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
Dec 23 11:43:47 vdr sshd[6355]: Accepted publickey for root from 
192.168.0.2 port 32956 ssh2
Dec 23 11:44:39 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:44:39 vdr longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
Dec 23 11:44:40 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:44:40 vdr longhaul: Setting to FSB:133MHz Mult:4.5x (598MHz)
Dec 23 11:44:41 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:44:41 vdr longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
Dec 23 11:44:41 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:44:42 vdr longhaul: Setting to FSB:133MHz Mult:4.5x (598MHz)
Dec 23 11:44:43 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:44:43 vdr longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
Dec 23 11:44:44 vdr printk: 2 messages suppressed.
Dec 23 11:44:44 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:44:49 vdr printk: 11 messages suppressed.
Dec 23 11:44:49 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:44:54 vdr printk: 10 messages suppressed.
Dec 23 11:44:54 vdr longhaul: Setting to FSB:133MHz Mult:4.5x (598MHz)
Dec 23 11:44:59 vdr printk: 10 messages suppressed.
Dec 23 11:44:59 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:04 vdr printk: 9 messages suppressed.
Dec 23 11:45:04 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:09 vdr printk: 11 messages suppressed.
Dec 23 11:45:09 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:15 vdr printk: 11 messages suppressed.
Dec 23 11:45:15 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:19 vdr printk: 8 messages suppressed.
Dec 23 11:45:19 vdr longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
Dec 23 11:45:24 vdr printk: 10 messages suppressed.
Dec 23 11:45:24 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:29 vdr printk: 11 messages suppressed.
Dec 23 11:45:29 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:34 vdr printk: 10 messages suppressed.
Dec 23 11:45:34 vdr longhaul: Setting to FSB:133MHz Mult:4.5x (598MHz)
Dec 23 11:45:39 vdr printk: 10 messages suppressed.
Dec 23 11:45:39 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:44 vdr printk: 10 messages suppressed.
Dec 23 11:45:44 vdr longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
Dec 23 11:45:49 vdr printk: 10 messages suppressed.
Dec 23 11:45:49 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:54 vdr printk: 9 messages suppressed.
Dec 23 11:45:54 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:45:59 vdr printk: 9 messages suppressed.
Dec 23 11:45:59 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:46:04 vdr printk: 11 messages suppressed.
Dec 23 11:46:04 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)

5. cpufreq.debug=3

dmesg:

cpufreq-core: trying to register driver longhaul
cpufreq-core: adding CPU 0
longhaul: VIA C3 'Samuel 2' [C5B] CPU detected.  Longhaul v1 supported.
longhaul: MinMult:3.0x MaxMult:4.5x
longhaul: FSB:133MHz  Lowest speed: 399MHz   Highest speed:399MHz
freq-table: table entry 0: 399000 kHz, 1 index
freq-table: table entry 1: 532000 kHz, 2 index
freq-table: table entry 2: 465000 kHz, 5 index
freq-table: table entry 3: 598000 kHz, 6 index
freq-table: setting show_table for cpu 0 to c1221e80
cpufreq-core: setting new policy for CPU 0: 399000 - 598000 kHz
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 399000 - 598000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 1
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 598000 kHz, relation 0
freq-table: request for target 598000 kHz (relation: 0) for cpu 0
freq-table: target is 3 (598000 kHz, 6)
cpufreq-core: notification 0 of frequency transition to 598000 kHz
cpufreq-core: saving 591872 as reference value for loops_per_jiffy; freq 
is 598000 kHz
longhaul: Setting to FSB:133MHz Mult:4.5x (598MHz)
cpufreq-core: notification 1 of frequency transition to 598000 kHz
cpufreq-core: initialization complete
cpufreq-core: driver longhaul up and running
SGI XFS with no debug enabled
ACPI: Power Button (FF) [PWRF]
cpufreq-core: updating policy for CPU 0
cpufreq-core: setting new policy for CPU 0: 399000 - 598000 kHz
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
freq-table: request for verification of policy (399000 - 598000 kHz) for 
cpu 0
freq-table: verification lead to (399000 - 598000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 399000 - 598000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 598000 kHz, relation 0
freq-table: request for target 598000 kHz (relation: 0) for cpu 0
freq-table: target is 3 (598000 kHz, 6)
ACPI: Processor [CPU0] (supports C1 C2)
ACPI: Processor [CPU0] (supports 2 throttling states)

Cutting a recording froze the computer after 3 seconds

vdr root # speedfreq -m
New policy: dynamic 399-598 MHz
CPU new speed 399 MHz, 94.995% idle
CPU new speed 532 MHz, 13.9999% idle
CPU new speed 399 MHz, 100% idle

tail -f /vag/log/messages:

Dec 23 11:50:26 vdr sshd[6323]: Accepted publickey for root from 
192.168.0.2 port 32964 ssh2
Dec 23 11:51:55 vdr cpufreq-core: setting new policy for CPU 0: 399000 - 
598000 kHz
Dec 23 11:51:55 vdr freq-table: request for verification of policy 
(399000 - 598000 kHz) for cpu 0
Dec 23 11:51:55 vdr freq-table: verification lead to (399000 - 598000 
kHz) for cpu 0
Dec 23 11:51:55 vdr freq-table: request for verification of policy 
(399000 - 598000 kHz) for cpu 0
Dec 23 11:51:55 vdr freq-table: verification lead to (399000 - 598000 
kHz) for cpu 0
Dec 23 11:51:55 vdr cpufreq-core: new min and max freqs are 399000 - 
598000 kHz
Dec 23 11:51:55 vdr cpufreq-core: governor: change or update limits
Dec 23 11:51:55 vdr cpufreq-core: __cpufreq_governor for CPU 0, event 3
Dec 23 11:51:55 vdr cpufreq-core: target for CPU 0: 598000 kHz, relation 0
Dec 23 11:51:55 vdr freq-table: request for target 598000 kHz (relation: 
0) for cpu 0
Dec 23 11:51:55 vdr freq-table: target is 3 (598000 kHz, 6)
Dec 23 11:51:55 vdr cpufreq-core: target for CPU 0: 498000 kHz, relation 0
Dec 23 11:51:55 vdr freq-table: request for target 498000 kHz (relation: 
0) for cpu 0
Dec 23 11:51:55 vdr freq-table: target is 1 (532000 kHz, 2)
Dec 23 11:51:55 vdr cpufreq-core: notification 0 of frequency transition 
to 532000 kHz
Dec 23 11:51:55 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)
Dec 23 11:51:55 vdr cpufreq-core: notification 1 of frequency transition 
to 532000 kHz
Dec 23 11:51:55 vdr cpufreq-core: scaling loops_per_jiffy to 526548 for 
frequency 532000 kHz
Dec 23 11:51:55 vdr cpufreq-core: target for CPU 0: 399000 kHz, relation 0
Dec 23 11:51:55 vdr freq-table: request for target 399000 kHz (relation: 
0) for cpu 0
Dec 23 11:51:55 vdr freq-table: target is 0 (399000 kHz, 1)
Dec 23 11:52:27 vdr printk: 4 messages suppressed.
Dec 23 11:52:27 vdr cpufreq-core: target for CPU 0: 499000 kHz, relation 0
Dec 23 11:52:27 vdr freq-table: request for target 499000 kHz (relation: 
0) for cpu 0
Dec 23 11:52:27 vdr freq-table: target is 1 (532000 kHz, 2)
Dec 23 11:52:27 vdr cpufreq-core: notification 0 of frequency transition 
to 532000 kHz
Dec 23 11:52:27 vdr cpufreq-core: scaling loops_per_jiffy to 526548 for 
frequency 532000 kHz
Dec 23 11:52:27 vdr longhaul: Setting to FSB:133MHz Mult:4.0x (532MHz)

6. cpufreq.debug=4

dmesg:

longhaul: VIA C3 'Samuel 2' [C5B] CPU detected.  Longhaul v1 supported.
userspace: managing cpu 0 started (399000 - 598000 kHz, currently 598000 
kHz)
userspace: limit event for cpu 0: 399000 - 598000 kHz, currently 598000 
kHz, last set to 598000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 598000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 598000 kHz

Cutting a recording froze the computer after 24 seconds.

vdr root # speedfreq -m
New policy: dynamic 399-598 MHz
CPU new speed 399 MHz, 94.9989% idle
CPU new speed 532 MHz, 29.0001% idle
CPU new speed 399 MHz, 90.0015% idle
CPU new speed 532 MHz, 23.8102% idle
CPU new speed 598 MHz, 5.00114% idle
CPU new speed 532 MHz, 90.0015% idle
CPU new speed 399 MHz, 100% idle
CPU new speed 532 MHz, 9.52191% idle
CPU new speed 598 MHz, 5.26421% idle
CPU new speed 532 MHz, 90.4745% idle
CPU new speed 399 MHz, 94.7358% idle
CPU new speed 532 MHz, 19.0452% idle
CPU new speed 598 MHz, 5.00114% idle
CPU new speed 532 MHz, 89.4828% idle
CPU new speed 399 MHz, 99.996% idle
CPU new speed 532 MHz, 28.573% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 90.0015% idle
CPU new speed 532 MHz, 9.99847% idle
CPU new speed 598 MHz, 29.9969% idle
CPU new speed 532 MHz, 95.2405% idle
CPU new speed 399 MHz, 100% idle
CPU new speed 532 MHz, 19.9992% idle
CPU new speed 598 MHz, 29.9992% idle
CPU new speed 532 MHz, 90.0015% idle
CPU new speed 399 MHz, 100% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 4.76277% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 90.481% idle
CPU new speed 532 MHz, 0% idle
CPU new speed 598 MHz, 5.00114% idle
CPU new speed 532 MHz, 100% idle
CPU new speed 399 MHz, 90.0015% idle
CPU new speed 532 MHz, 9.99847% idle
CPU new speed 598 MHz, 0% idle
CPU new speed 532 MHz, 99.996% idle
CPU new speed 399 MHz, 90.4745% idle

tail -f /var/log/messages:

Dec 23 11:57:20 vdr 0.7.0[5382]: accepted new client on /dev/lircd
Dec 23 11:58:21 vdr userspace: limit event for cpu 0: 399000 - 598000 
kHz, currently 598000 kHz, last set to 598000 kHz
Dec 23 11:58:22 vdr userspace: _cpufreq_set for cpu 0, freq 498000 kHz
Dec 23 11:58:22 vdr userspace: saving cpu_cur_freq of cpu 0 to be 532000 kHz
Dec 23 11:58:22 vdr userspace: saving cpu_cur_freq of cpu 0 to be 532000 kHz
Dec 23 11:58:22 vdr userspace: _cpufreq_set for cpu 0, freq 399000 kHz
Dec 23 11:58:22 vdr userspace: saving cpu_cur_freq of cpu 0 to be 399000 kHz
Dec 23 11:58:22 vdr userspace: saving cpu_cur_freq of cpu 0 to be 399000 kHz
Dec 23 11:58:55 vdr userspace: _cpufreq_set for cpu 0, freq 499000 kHz
Dec 23 11:58:55 vdr userspace: saving cpu_cur_freq of cpu 0 to be 532000 kHz
Dec 23 11:58:55 vdr userspace: saving cpu_cur_freq of cpu 0 to be 532000 kHz
Dec 23 11:58:55 vdr userspace: _cpufreq_set for cpu 0, freq 399000 kHz
Dec 23 11:58:55 vdr userspace: saving cpu_cur_freq of cpu 0 to be 399000 kHz
Dec 23 11:58:55 vdr userspace: saving cpu_cur_freq of cpu 0 to be 399000 kHz
Dec 23 11:58:55 vdr userspace: _cpufreq_set for cpu 0, freq 499000 kHz
Dec 23 11:58:55 vdr userspace: saving cpu_cur_freq of cpu 0 to be 532000 kHz
Dec 23 11:58:55 vdr userspace: saving cpu_cur_freq of cpu 0 to be 532000 kHz
Dec 23 11:58:56 vdr userspace: _cpufreq_set for cpu 0, freq 598000 kHz
Dec 23 11:59:00 vdr printk: 29 messages suppressed.
Dec 23 11:59:00 vdr userspace: _cpufreq_set for cpu 0, freq 399000 kHz
Dec 23 11:59:01 vdr Warning: CPU frequency is 399000, cpufreq assumed 
532000 kHz.
Dec 23 11:59:05 vdr printk: 32 messages suppressed.
Dec 23 11:59:05 vdr userspace: _cpufreq_set for cpu 0, freq 498000 kHz

---------------------------------------------------------------------------
---------------------------------------------------------------------------

Regards

Sebastian
