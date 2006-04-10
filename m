From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6367] New: acpi-cpufreq: fancy CPUfreq values - can't load
	p4-clockmod anymore
Date: Mon, 10 Apr 2006 06:06:57 -0700
Message-ID: <200604101306.k3AD6vN4019231@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6367

           Summary: acpi-cpufreq: fancy CPUfreq values - can't load p4-
                    clockmod anymore
    Kernel Version: 2.6.16.1 + suspend2-2.2.4
            Status: NEW
          Severity: blocking
             Owner: cpufreq@www.linux.org.uk
         Submitter: oopla@users.sf.net


[P: blockng for me at least, as it prevents me to upgrade the kernel and benefit
 from certain fixes]

Most recent kernel where this bug did not occur: 2.6.15.5, Debian's 2.6.15-1.686
Distribution: Debian Sarge, official + custom/vanilla kernel

Hardware Environment:
# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Celeron(R) CPU 2.70GHz
stepping        : 9
cpu MHz         : 336.750
cache size      : 128 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid xtpr
bogomips        : 5389.63

# lspci
0000:00:00.0 Host bridge: Intel Corp. 82852/855GM Host Bridge (rev 02)
0000:00:00.1 System peripheral: Intel Corp. 855GM/GME GMCH Memory I/O Control
Registers (rev 02)
0000:00:00.3 System peripheral: Intel Corp. 855GM/GME GMCH Configuration Process
Registers (rev 02)
0000:00:02.0 VGA compatible controller: Intel Corp. 82852/855GM Integrated
Graphics Device (rev 02)
0000:00:02.1 Display controller: Intel Corp. 82852/855GM Integrated Graphics
Device (rev 02)
0000:00:1d.0 USB Controller: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M)
USB UHCI Controller #1 (rev 03)
0000:00:1d.1 USB Controller: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M)
USB UHCI Controller #2 (rev 03)
0000:00:1d.7 USB Controller: Intel Corp. 82801DB/DBM (ICH4/ICH4-M) USB 2.0 EHCI
Controller (rev 03)
0000:00:1e.0 PCI bridge: Intel Corp. 82801 PCI Bridge (rev 83)
0000:00:1f.0 ISA bridge: Intel Corp. 82801DBM LPC Interface Controller (rev 03)
0000:00:1f.1 IDE interface: Intel Corp. 82801DBM (ICH4) Ultra ATA Storage
Controller (rev 03)
0000:00:1f.3 SMBus: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) SMBus
Controller (rev 03)
0000:00:1f.5 Multimedia audio controller: Intel Corp. 82801DB/DBL/DBM
(ICH4/ICH4-L/ICH4-M) AC'97 Audio Controller (rev 03)
0000:00:1f.6 Modem: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) AC'97 Modem
Controller (rev 03)
0000:01:05.0 Ethernet controller: Atheros Communications, Inc. AR5212 802.11abg
NIC (rev 01)
0000:01:08.0 Ethernet controller: Intel Corp. 82801BD PRO/100 VE (MOB) Ethernet
Controller (rev 83)
0000:01:0b.0 CardBus bridge: Toshiba America Info Systems ToPIC95 PCI to Cardbus
Bridge with ZV Support (rev 33)

Software Environment:
Problem Description:
I've got a P4-celeron Toshiba notebook which used to work ok with the
cpufreq driver p4-clockmod, but that drivers doesn't load anymore in
2.6.16.1, while the acpi-cpufreq does, but offers wrong numbers:

#----OLD----#
# uname -r
2.6.14.7-se-ss2.2-rc15-p4.1
[ss2 stands for suspend2 patch]

with p4-clockmod:

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
337500 675000 1012500 1350000 1687500 2025000 2362500 2700000
# lsmod|grep cpu
cpufreq_userspace       5340  0
cpufreq_stats           6020  0
cpufreq_ondemand        6556  0
cpufreq_conservative     7460  0
freq_table              5636  2 cpufreq_stats,p4_clockmod
cpufreq_powersave       2176  0

and works ok.

#----NEW----#
$ uname -r
2.6.16.1-se-ss2.2.2-p4.1
p4-clockmod doesn't load anymore.

with acpi-cpufreq I get fancy CPUfreqs:

$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
2700000 65535000 65535000 65535000 65535000 65535000 65535000 65535000 65535000
+65535000 65535000 65535000 65535000 65535000 65535000

$ lsmod|grep cpu
acpi_cpufreq            7688  1
cpufreq_stats           5508  0
cpufreq_powersave       2304  0
cpufreq_userspace       4884  1
cpufreq_conservative     6820  0
cpufreq_ondemand        6044  0
cpuid                   3460  0
processor              38208  2 acpi_cpufreq,thermal
freq_table              5380  2 acpi_cpufreq,cpufreq_stats

also, cpufreq_stats won't unload anymore and suspend2 gets stuck there.

modprobe p4-clockmod results simply in: 'no such device' and nothing appears in
dmesg.

Steps to reproduce:

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
