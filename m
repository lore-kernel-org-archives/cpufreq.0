From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7866] New: cpufreq fails to correctly identify Intel Conroe
	operating frequencies
Date: Tue, 23 Jan 2007 00:13:55 -0800
Message-ID: <200701230813.l0N8Dtuj027723@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7866

           Summary: cpufreq fails to correctly identify Intel Conroe
                    operating frequencies
    Kernel Version: 2.6.20-rc5
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: jared@jaredcam.net


Most recent kernel where this bug did *NOT* occur: none
Distribution:  Ubuntu Edgy (6.10)
Hardware Environment:
Abit AW9D-MAX motherboard
Intel 975x chipset
Intel Conroe E6660 @ 2.4ghz

cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
stepping        : 6
cpu MHz         : 600.000
cache size      : 4096 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2


Software Environment: 2.6.20-rc5
Problem Description:

cpufreq incorrectly identifies the operating frequencies of my processor as
600MHz and 900MHz.  Here is the output of cpufreq.debug=7:

[   15.007329] acpi-cpufreq: acpi_cpufreq_init
[   15.007331] acpi-cpufreq: acpi_cpufreq_early_init
[   15.007339] cpufreq-core: trying to register driver acpi-cpufreq
[   15.007341] cpufreq-core: adding CPU 0
[   15.007343] acpi-cpufreq: acpi_cpufreq_cpu_init
[   15.007462] acpi-cpufreq: SYSTEM IO addr space
[   15.007465] freq-table: table entry 0: 900000 kHz, 0 index
[   15.007466] freq-table: table entry 1: 600000 kHz, 1 index
[   15.007639] acpi-cpufreq: CPU0 - ACPI performance management activated.
[   15.007641] acpi-cpufreq:      *P0: 900 MHz, 88000 mW, 160 uS
[   15.007643] acpi-cpufreq:       P1: 600 MHz, 56000 mW, 160 uS
[   15.007645] freq-table: setting show_table for cpu 0 to f79c5e80
[   15.008496] cpufreq-core: setting new policy for CPU 0: 600000 - 900000 kHz
[   15.008498] acpi-cpufreq: acpi_cpufreq_verify
[   15.008500] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 0
[   15.008502] freq-table: verification lead to (600000 - 900000 kHz) for cpu 0
[   15.008504] acpi-cpufreq: acpi_cpufreq_verify
[   15.008506] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 0
[   15.008508] freq-table: verification lead to (600000 - 900000 kHz) for cpu 0
[   15.008513] cpufreq-core: new min and max freqs are 600000 - 900000 kHz
[   15.008514] cpufreq-core: governor switch
[   15.008516] cpufreq-core: __cpufreq_governor for CPU 0, event 1
[   15.008517] performance: setting to 900000 kHz because of event 1
[   15.008519] cpufreq-core: target for CPU 0: 900000 kHz, relation 1
[   15.008521] acpi-cpufreq: acpi_cpufreq_target 900000 (0)
[   15.008522] freq-table: request for target 900000 kHz (relation: 1) for cpu 0
[   15.008524] freq-table: target is 0 (900000 kHz, 0)
[   15.008526] acpi-cpufreq: Called after resume, resetting to P0
[   15.008527] cpufreq-core: notification 0 of frequency transition to 900000 kHz
[   15.008530] userspace: saving cpu_cur_freq of cpu 0 to be 900000 kHz
[   15.008679] cpufreq-core: notification 1 of frequency transition to 900000 kHz
[   15.008682] userspace: saving cpu_cur_freq of cpu 0 to be 900000 kHz
[   15.008684] cpufreq-core: governor: change or update limits
[   15.008686] cpufreq-core: __cpufreq_governor for CPU 0, event 3
[   15.008687] performance: setting to 900000 kHz because of event 3
[   15.008689] cpufreq-core: target for CPU 0: 900000 kHz, relation 1
[   15.008691] acpi-cpufreq: acpi_cpufreq_target 900000 (0)
[   15.008693] freq-table: request for target 900000 kHz (relation: 1) for cpu 0
[   15.008694] freq-table: target is 0 (900000 kHz, 0)
[   15.008696] acpi-cpufreq: Already at target state (P0)
[   15.008697] cpufreq-core: initialization complete
[   15.008699] cpufreq-core: adding CPU 1
[   15.008700] acpi-cpufreq: acpi_cpufreq_cpu_init
[   15.008812] acpi-cpufreq: SYSTEM IO addr space
[   15.008814] freq-table: table entry 0: 900000 kHz, 0 index
[   15.008815] freq-table: table entry 1: 600000 kHz, 1 index
[   15.008817] acpi-cpufreq: CPU1 - ACPI performance management activated.
[   15.008819] acpi-cpufreq:      *P0: 900 MHz, 88000 mW, 160 uS
[   15.008821] acpi-cpufreq:       P1: 600 MHz, 56000 mW, 160 uS
[   15.008823] freq-table: setting show_table for cpu 1 to f7aa34a0
[   15.008835] cpufreq-core: setting new policy for CPU 1: 600000 - 900000 kHz
[   15.008837] acpi-cpufreq: acpi_cpufreq_verify
[   15.008839] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 1
[   15.008841] freq-table: verification lead to (600000 - 900000 kHz) for cpu 1
[   15.008843] acpi-cpufreq: acpi_cpufreq_verify
[   15.008844] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 1
[   15.008846] freq-table: verification lead to (600000 - 900000 kHz) for cpu 1
[   15.008851] cpufreq-core: new min and max freqs are 600000 - 900000 kHz
[   15.008852] cpufreq-core: governor switch
[   15.008853] cpufreq-core: __cpufreq_governor for CPU 1, event 1
[   15.008855] performance: setting to 900000 kHz because of event 1
[   15.008857] cpufreq-core: target for CPU 1: 900000 kHz, relation 1
[   15.008858] acpi-cpufreq: acpi_cpufreq_target 900000 (1)
[   15.008860] freq-table: request for target 900000 kHz (relation: 1) for cpu 1
[   15.008862] freq-table: target is 0 (900000 kHz, 0)
[   15.008863] acpi-cpufreq: Called after resume, resetting to P0
[   15.008865] cpufreq-core: notification 0 of frequency transition to 900000 kHz
[   15.008867] userspace: saving cpu_cur_freq of cpu 1 to be 900000 kHz
[   15.009400] cpufreq-core: notification 1 of frequency transition to 900000 kHz
[   15.009402] userspace: saving cpu_cur_freq of cpu 1 to be 900000 kHz
[   15.009404] cpufreq-core: governor: change or update limits
[   15.009405] cpufreq-core: __cpufreq_governor for CPU 1, event 3
[   15.009407] performance: setting to 900000 kHz because of event 3
[   15.009409] cpufreq-core: target for CPU 1: 900000 kHz, relation 1
[   15.009410] acpi-cpufreq: acpi_cpufreq_target 900000 (1)
[   15.009412] freq-table: request for target 900000 kHz (relation: 1) for cpu 1
[   15.009414] freq-table: target is 0 (900000 kHz, 0)
[   15.009415] acpi-cpufreq: Already at target state (P0)
[   15.009417] cpufreq-core: initialization complete
[   15.009419] cpufreq-core: driver acpi-cpufreq up and running
[   17.396767] **WARNING** I2C adapter driver [NVIDIA I2C Device] forgot to
specify physical device; fix it!
[   17.397055] i2c_adapter i2c-1: SMBus Quick command not supported, can't probe
for chips
[   17.397229] **WARNING** I2C adapter driver [NVIDIA I2C Device] forgot to
specify physical device; fix it!
[   17.397437] i2c_adapter i2c-2: SMBus Quick command not supported, can't probe
for chips
[   17.397610] **WARNING** I2C adapter driver [NVIDIA I2C Device] forgot to
specify physical device; fix it!
[   17.397821] i2c_adapter i2c-3: SMBus Quick command not supported, can't probe
for chips
[   17.763899] apm: BIOS version 1.2 Flags 0x07 (Driver version 1.16ac)
[   17.763903] apm: disabled - APM is not SMP safe.
[   19.368646] cpufreq-core: setting new policy for CPU 0: 600000 - 900000 kHz
[   19.368650] acpi-cpufreq: acpi_cpufreq_verify
[   19.368652] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 0
[   19.368654] freq-table: verification lead to (600000 - 900000 kHz) for cpu 0
[   19.369082] acpi-cpufreq: acpi_cpufreq_verify
[   19.369084] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 0
[   19.369086] freq-table: verification lead to (600000 - 900000 kHz) for cpu 0
[   19.369390] cpufreq-core: new min and max freqs are 600000 - 900000 kHz
[   19.369392] cpufreq-core: governor switch
[   19.369393] cpufreq-core: __cpufreq_governor for CPU 0, event 2
[   19.369395] cpufreq-core: __cpufreq_governor for CPU 0, event 1
[   19.369769] cpufreq-core: governor: change or update limits
[   19.369771] cpufreq-core: __cpufreq_governor for CPU 0, event 3
[   19.369976] cpufreq-core: setting new policy for CPU 1: 600000 - 900000 kHz
[   19.369978] acpi-cpufreq: acpi_cpufreq_verify
[   19.369980] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 1
[   19.369982] freq-table: verification lead to (600000 - 900000 kHz) for cpu 1
[   19.370375] acpi-cpufreq: acpi_cpufreq_verify
[   19.370377] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 1
[   19.370379] freq-table: verification lead to (600000 - 900000 kHz) for cpu 1
[   19.370667] cpufreq-core: new min and max freqs are 600000 - 900000 kHz
[   19.370669] cpufreq-core: governor switch
[   19.370670] cpufreq-core: __cpufreq_governor for CPU 1, event 2
[   19.370672] cpufreq-core: __cpufreq_governor for CPU 1, event 1
[   19.371005] cpufreq-core: governor: change or update limits
[   19.371007] cpufreq-core: __cpufreq_governor for CPU 1, event 3
[   19.378934] cpufreq-core: setting new policy for CPU 0: 600000 - 900000 kHz
[   19.378937] acpi-cpufreq: acpi_cpufreq_verify
[   19.378938] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 0
[   19.378941] freq-table: verification lead to (600000 - 900000 kHz) for cpu 0
[   19.379390] acpi-cpufreq: acpi_cpufreq_verify
[   19.379392] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 0
[   19.379394] freq-table: verification lead to (600000 - 900000 kHz) for cpu 0
[   19.379682] cpufreq-core: new min and max freqs are 600000 - 900000 kHz
[   19.379684] cpufreq-core: governor switch
[   19.379686] cpufreq-core: __cpufreq_governor for CPU 0, event 2
[   19.379936] cpufreq-core: __cpufreq_governor for CPU 0, event 1
[   19.380032] userspace: managing cpu 0 started (600000 - 900000 kHz, currently
900000 kHz)
[   19.380034] cpufreq-core: governor: change or update limits
[   19.380035] cpufreq-core: __cpufreq_governor for CPU 0, event 3
[   19.380323] userspace: limit event for cpu 0: 600000 - 900000 kHz,currently
900000 kHz, last set to 900000 kHz
[   19.380326] cpufreq-core: target for CPU 0: 900000 kHz, relation 0
[   19.380327] acpi-cpufreq: acpi_cpufreq_target 900000 (0)
[   19.380329] freq-table: request for target 900000 kHz (relation: 0) for cpu 0
[   19.380331] freq-table: target is 0 (900000 kHz, 0)
[   19.380332] acpi-cpufreq: Already at target state (P0)
[   19.380951] cpufreq-core: setting new policy for CPU 1: 600000 - 900000 kHz
[   19.380953] acpi-cpufreq: acpi_cpufreq_verify
[   19.380955] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 1
[   19.380957] freq-table: verification lead to (600000 - 900000 kHz) for cpu 1
[   19.381351] acpi-cpufreq: acpi_cpufreq_verify
[   19.381354] freq-table: request for verification of policy (600000 - 900000
kHz) for cpu 1
[   19.381356] freq-table: verification lead to (600000 - 900000 kHz) for cpu 1
[   19.381644] cpufreq-core: new min and max freqs are 600000 - 900000 kHz
[   19.381645] cpufreq-core: governor switch
[   19.381647] cpufreq-core: __cpufreq_governor for CPU 1, event 2
[   19.381908] cpufreq-core: __cpufreq_governor for CPU 1, event 1
[   19.382002] userspace: managing cpu 1 started (600000 - 900000 kHz, currently
900000 kHz)
[   19.382004] cpufreq-core: governor: change or update limits
[   19.382006] cpufreq-core: __cpufreq_governor for CPU 1, event 3
[   19.382295] userspace: limit event for cpu 1: 600000 - 900000 kHz,currently
900000 kHz, last set to 900000 kHz
[   19.382297] cpufreq-core: target for CPU 1: 900000 kHz, relation 0
[   19.382299] acpi-cpufreq: acpi_cpufreq_target 900000 (1)
[   19.382301] freq-table: request for target 900000 kHz (relation: 0) for cpu 1
[   19.382303] freq-table: target is 0 (900000 kHz, 0)
[   19.382304] acpi-cpufreq: Already at target state (P0)
[   19.586176] Bluetooth: Core ver 2.11
[   19.586221] NET: Registered protocol family 31
[   19.586223] Bluetooth: HCI device and connection manager initialized
[   19.586225] Bluetooth: HCI socket layer initialized
[   19.604477] Bluetooth: L2CAP ver 2.8
[   19.604479] Bluetooth: L2CAP socket layer initialized
[   19.749634] Bluetooth: RFCOMM socket layer initialized
[   19.749641] Bluetooth: RFCOMM TTY layer initialized
[   19.749642] Bluetooth: RFCOMM ver 1.8
[   20.384539] userspace: cpufreq_set for cpu 0, freq 600000 kHz
[   20.384769] cpufreq-core: target for CPU 0: 600000 kHz, relation 0
[   20.384772] acpi-cpufreq: acpi_cpufreq_target 600000 (0)
[   20.384774] freq-table: request for target 600000 kHz (relation: 0) for cpu 0
[   20.384776] freq-table: target is 1 (600000 kHz, 1)
[   20.384778] cpufreq-core: notification 0 of frequency transition to 600000 kHz
[   20.384781] userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
[   20.386497] cpufreq-core: notification 1 of frequency transition to 600000 kHz
[   20.386499] userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
[   21.388132] userspace: cpufreq_set for cpu 1, freq 600000 kHz

(Sorry if that's too much information.)



Steps to reproduce:

Enable cpufreq on he 2.6.20-rc5 kernel with my hardware.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
