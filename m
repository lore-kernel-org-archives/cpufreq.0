From: Mike Galbraith <efault@gmx.de>
Subject: p4_clockmod broken in 2.6.16-rc? kernels
Date: Thu, 09 Mar 2006 07:11:48 +0100
Message-ID: <1141884708.7865.16.camel@homer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: davej@codemonkey.org.uk

Greetings,

As subject says, it appears to be broken for at least one single P4 HT
system, namely mine.  2.6.15 works fine.

With a UP compiled kernel, it fails completely, due to CPU0 failure to
initialize.  With an SMP compiled kernel, CPU0 fails, but the sibling
initializes.  Nothing good happens afterward though.  See debug
(cpufreq.debug=7) output below.

	Cheers,

	-Mike

cpufreq-core: trying to register driver p4-clockmod
cpufreq-core: adding CPU 0
p4-clockmod: has errata -- disabling frequencies lower than 2ghz
speedstep-lib: x86: f, model: 2
speedstep-lib: ebx value is 9, x86_mask is 9
speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xf12000f 0x0
speedstep-lib: P4 - FSB 200000 kHz; Multiplier 15; Speed 3000000 kHz
freq-table: setting show_table for cpu 0 to c14bd800
freq-table: table entry 0 is invalid, skipping
freq-table: table entry 1 is invalid, skipping
freq-table: table entry 2 is invalid, skipping
freq-table: table entry 3 is invalid, skipping
freq-table: table entry 4 is invalid, skipping
freq-table: table entry 5 is invalid, skipping
freq-table: table entry 6 is invalid, skipping
freq-table: table entry 7 is invalid, skipping
freq-table: table entry 8 is invalid, skipping
cpufreq-core: initialization failed
cpufreq-core: adding CPU 1
p4-clockmod: has errata -- disabling frequencies lower than 2ghz
speedstep-lib: x86: f, model: 2
speedstep-lib: ebx value is 9, x86_mask is 9
speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xf12000f 0x0
speedstep-lib: P4 - FSB 200000 kHz; Multiplier 15; Speed 3000000 kHz
freq-table: setting show_table for cpu 1 to c14bd800
freq-table: table entry 0 is invalid, skipping
freq-table: table entry 1: 375000 kHz, 1 index
freq-table: table entry 2: 750000 kHz, 2 index
freq-table: table entry 3: 1125000 kHz, 3 index
freq-table: table entry 4: 1500000 kHz, 4 index
freq-table: table entry 5: 1875000 kHz, 5 index
freq-table: table entry 6: 2250000 kHz, 6 index
freq-table: table entry 7: 2625000 kHz, 7 index
freq-table: table entry 8: 3000000 kHz, 8 index
cpufreq-core: setting new policy for CPU 1: 375000 - 3000000 kHz
freq-table: request for verification of policy (375000 - 3000000 kHz) for cpu 1
freq-table: verification lead to (375000 - 3000000 kHz) for cpu 1
freq-table: request for verification of policy (375000 - 3000000 kHz) for cpu 1
freq-table: verification lead to (375000 - 3000000 kHz) for cpu 1
cpufreq-core: new min and max freqs are 375000 - 3000000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 1, event 1
performance: setting to 3000000 kHz because of event 1
cpufreq-core: target for CPU 1: 3000000 kHz, relation 1
freq-table: request for target 3000000 kHz (relation: 1) for cpu 1
freq-table: target is 8 (3000000 kHz, 8)
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 1, event 3
performance: setting to 3000000 kHz because of event 3
cpufreq-core: target for CPU 1: 3000000 kHz, relation 1
freq-table: request for target 3000000 kHz (relation: 1) for cpu 1
freq-table: target is 8 (3000000 kHz, 8)
cpufreq-core: initialization complete
cpufreq-core: driver p4-clockmod up and running
p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available

[lack of events]
