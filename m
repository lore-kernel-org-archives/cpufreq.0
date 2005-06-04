From: John Belmonte <john@neggie.net>
Subject: powernow-k8 and stuck change-pending bit
Date: Sat, 04 Jun 2005 16:32:15 -0400
Message-ID: <42A20FCF.4070904@neggie.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_jvb.vm.bytemark.co.uk-20864-1117917144-0001-2"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_jvb.vm.bytemark.co.uk-20864-1117917144-0001-2
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

I'm having a problem with powernow-k8 intermittent failures and would
appreciate some help.

system:

  * Athlon 64 2800+, stepping 10
  * Chaintech K8M800 socket 754 (no Cool'n'Quiet support)
  * linux-2.6.12-rc5 (+ powernow-k8 1.40.2 patch)


symptoms:

    After working fine for a while (several minutes to several hours),
cpufreq seems to get into a bad state where:

     * change pending bit set / stuck kernel messages appear

     * cat of /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
hangs for a few seconds and finally returns "<unknown>".  However a cat
of /proc/cpuinfo works and seems to show the correct cpu MHz.

     * reloading powernow-k8 module fails, with "change pending bit stuck"

     * the problem can sometimes be provoked by stopping and starting
       powernowd

Attached is some kernel output with "cpufreq.debug=3".  The debug output
doesn't seem to provide much information at the point of failure.

--John

--=_jvb.vm.bytemark.co.uk-20864-1117917144-0001-2
Content-Type: text/x-log; name="powernow-k8_stuck_bit.log"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="powernow-k8_stuck_bit.log"

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.40.2)
cpufreq-core: trying to register driver powernow-k8
cpufreq-core: adding CPU 0
powernow-k8:    0 : fid 0xa, vid 0x2
powernow-k8:    1 : fid 0x2, vid 0x12
powernow-k8:    2 : fid 0x3f, vid 0x1f
powernow-k8: invalid freq 7100000 kHz, ignoring
powernow-k8:    3 : fid 0x3f, vid 0x1f
powernow-k8: invalid freq 7100000 kHz, ignoring
powernow-k8:    4 : fid 0x3f, vid 0x1f
powernow-k8: invalid freq 7100000 kHz, ignoring
powernow-k8:    0 : fid 0xa (1800 MHz), vid 0x2 (1500 mV)
powernow-k8:    1 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8: cpu0, init lo 0x20a, hi 0x1
powernow-k8: policy current frequency 1800000 kHz
freq-table: table entry 0: 1800000 kHz, 522 index
freq-table: table entry 1: 1000000 kHz, 4610 index
freq-table: table entry 2 is invalid, skipping
freq-table: table entry 3 is invalid, skipping
freq-table: table entry 4 is invalid, skipping
freq-table: setting show_table for cpu 0 to ffff81002b7cef40
cpu_init done, current fid 0xa, vid 0x2
cpufreq-core: setting new policy for CPU 0: 1000000 - 1800000 kHz
freq-table: request for verification of policy (1000000 - 1800000 kHz) for cpu 0
freq-table: verification lead to (1000000 - 1800000 kHz) for cpu 0
freq-table: request for verification of policy (1000000 - 1800000 kHz) for cpu 0
freq-table: verification lead to (1000000 - 1800000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 1000000 - 1800000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 1
cpufreq-core: target for CPU 0: 1800000 kHz, relation 1
powernow-k8: targ: cpu 0, 1800000 kHz, min 1000000, max 1800000, relation 1
powernow-k8: targ: curr fid 0xa, vid 0x2
freq-table: request for target 1800000 kHz (relation: 1) for cpu 0
freq-table: target is 0 (1800000 kHz, 522)
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0xa, giving vid 0x2
powernow-k8: target matches current values (fid 0xa, vid 0x2)
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 1800000 kHz, relation 1
powernow-k8: targ: cpu 0, 1800000 kHz, min 1000000, max 1800000, relation 1
powernow-k8: targ: curr fid 0xa, vid 0x2
freq-table: request for target 1800000 kHz (relation: 1) for cpu 0
freq-table: target is 0 (1800000 kHz, 522)
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0xa, giving vid 0x2
powernow-k8: target matches current values (fid 0xa, vid 0x2)
cpufreq-core: initialization complete
cpufreq-core: driver powernow-k8 up and running
cpufreq-core: updating policy for CPU 0
cpufreq-core: setting new policy for CPU 0: 1000000 - 1800000 kHz
freq-table: request for verification of policy (1000000 - 1800000 kHz) for cpu 0
freq-table: verification lead to (1000000 - 1800000 kHz) for cpu 0
freq-table: request for verification of policy (1000000 - 1800000 kHz) for cpu 0
freq-table: verification lead to (1000000 - 1800000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 1000000 - 1800000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 1800000 kHz, relation 1
powernow-k8: targ: cpu 0, 1800000 kHz, min 1000000, max 1800000, relation 1
powernow-k8: targ: curr fid 0xa, vid 0x2
freq-table: request for target 1800000 kHz (relation: 1) for cpu 0
freq-table: target is 0 (1800000 kHz, 522)
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0xa, giving vid 0x2
powernow-k8: target matches current values (fid 0xa, vid 0x2)
.
.
.
powernow-k8: targ: cpu 0, 1800000 kHz, min 1000000, max 1800000, relation 0
powernow-k8: targ: curr fid 0x2, vid 0x12
freq-table: request for target 1800000 kHz (relation: 0) for cpu 0
freq-table: target is 0 (1800000 kHz, 522)
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0xa, giving vid 0x2
powernow-k8: cpu 0, changing to fid 0xa, vid 0x2
cpufreq-core: notification 0 of frequency transition to 1800000 kHz
cpufreq-core: scaling loops_per_jiffy to 1765376 for frequency 1800000 kHz
powernow-k8: detected change pending stuck
powernow-k8: transition frequency failed

--=_jvb.vm.bytemark.co.uk-20864-1117917144-0001-2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--=_jvb.vm.bytemark.co.uk-20864-1117917144-0001-2--

