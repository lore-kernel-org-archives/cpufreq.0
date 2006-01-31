From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5985] New: speedstep-smi not detecting speedstep-capability
	with early Pentium 3 Coppermine
Date: Tue, 31 Jan 2006 09:03:47 -0800
Message-ID: <200601311703.k0VH3lb3024765@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5985

           Summary: speedstep-smi not detecting speedstep-capability with
                    early Pentium 3 Coppermine
    Kernel Version: 2.6.15.1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: zarhan@cs.tut.fi


Distribution:Gentoo
Hardware Environment:
# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 1
cpu MHz         : 500.125
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat
pse36 mmx fxsr sse
bogomips        : 1000.68

Problem Description:

  Speedstep capability is not detected. However, I know that the hardware is
capable of changing clock speeds because I can set it in BIOS. Also, suspending
and then resuming with or without the AC attached changes clock frequency.

Steps to reproduce:
  Attempts so far:
  Boot with cpufreq.debug=7
  modprobe speedstep-lib relaxed_check=1
  modprobe speedstep-smi, which gives "no such device".

  dmesg reports
speedstep-lib: x86: 6, model: 8
speedstep-lib: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x4c080020, 0x0
speedstep-lib: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x540000
speedstep-lib: early PIII version
speedstep-smi: signature:0x00008680, command:0x0000e6f5, event:0x00000000,
perf_level:0x47534943.

  Looking at speedstep-smi.c, starting at line 379, there is a check

        /* Error if no IST-SMI BIOS or no PARM
                 sig= 'ISGE' aka 'Intel Speedstep Gate E' */
        if ((ist_info.signature !=  0x47534943) && (
            (smi_port == 0) || (smi_cmd == 0)))
                return -ENODEV;

  which is the one that fails, I guess.

  Anyway, what seems to happen is that the SIGNATURE (the field being tested) is
not 0x47534943. However, perf_level does get that value - so, could it be that
the CPU detection reads the values from wrong places? Could this be fixed with
something as simple as an offset change with some CPUs?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
