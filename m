From: Manfred Langthaller <manfred.langthaller@aon.at>
Subject: Can't lower vcore => "vid trans failed"
Date: Mon, 18 Jun 2007 13:06:05 +0200
Message-ID: <4676671D.30307@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi!

Mainboard: MSI K8MM3-V H (MSI-7181 Ver: 2.0) BIOS v3.1 (latest)
CPU: AMD mobile Sempron 3000+ (SMS3000BQX2LF, TDP 25W)
Debian 4.0
Kernel: 2.6.21.5

If I insert module powernow-k8 3 P-States are recognized, but the 
voltages are too high.

powernow-k8: Found 1 Mobile AMD Sempron(tm) Processor 3000+ processors 
(version 2.00.00)
powernow-k8:    0 : fid 0xa (1800 MHz), vid 0xa
powernow-k8:    1 : fid 0x8 (1600 MHz), vid 0xc
powernow-k8:    2 : fid 0x0 (800 MHz), vid 0x13
powernow-k8: ph2 null fid transition 0xa

0: VID = 0xa = 01010 = 1.3V
1: VID = 0xc = 01100 = 1.250V
2: VID = 0x13 = 10011 = 1.075V

So I dumped the DSDT, fixed some errors, patched the kernel with 
"acpi-dsdt-initrd-v0.8.4-2.6.21.patch" changed the _PSS values 
("control" and "status" fields) in DSDT.dsl and inserted the fixed 
dsdt.aml to the initrd.

Now after inserting module powernow-k8 dmesg says:

powernow-k8: Found 1 Mobile AMD Sempron(tm) Processor 3000+ processors 
(version 2.00.00)
powernow-k8:    0 : fid 0xa (1800 MHz), vid 0x13 => 1.075V
powernow-k8:    1 : fid 0x8 (1600 MHz), vid 0x16 => 1.000V
powernow-k8:    2 : fid 0x0 (800 MHz), vid 0x1d => 0.825V
powernow-k8: ph2 null fid transition 0xa

Changing the scaling_govenor to "ondemand" leads to following errors.

powernow-k8: vid trans failed, vid 0x1d, curr 0x13
powernow-k8: transition frequency failed
Time: acpi_pm clocksource has been installed.
Clocksource tsc unstable (delta = -277822049 ns)
(appending nohz=off highres=off to the kernel should fix the clocksource 
error)

All in all the vcore cannot be set lower than 0x13, even 0x13 at 1800MHz 
works perfectly.

Where is the problem?
Is it the board, the kernel, or me?

Thanks a lot,

Manfred
