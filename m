From: Andrew Morton <akpm@osdl.org>
Subject: Fw: [Bugme-new] [Bug 2498] New: cpufreq fails to detect speedstep
 capability of some CPUs
Date: Mon, 12 Apr 2004 17:17:40 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040412171740.7e905d75.akpm@osdl.org>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk



Begin forwarded message:

Date: Mon, 12 Apr 2004 17:09:34 -0700
From: bugme-daemon@osdl.org
To: bugme-new@lists.osdl.org
Subject: [Bugme-new] [Bug 2498] New: cpufreq fails to detect speedstep capability of some CPUs


http://bugme.osdl.org/show_bug.cgi?id=2498

           Summary: cpufreq fails to detect speedstep capability of some
                    CPUs
    Kernel Version: 2.6.5
            Status: NEW
          Severity: normal
             Owner: platform_i386@kernel-bugs.osdl.org
         Submitter: bugzilla.kernel.org@CustomCDROM.de


Distribution: Debian, but vanilla kernel 
Hardware Environment: Acer Travelmate 612TX with Coppermine PIII Mobile 900 
MHz 
Software Environment: Debian GNU/Linux Unstable with vanilla kernel 
Problem Description: This notebook's CPU is not recognized as being cpufreq 
capable. Historic versions of cpufreq for 2.4.xer kernels had a kernel 
parameter to force speedstep for Coppermine CPUs, after its removal cpufreq 
ceased to work on this machine. Commenting out the test for speedstep in 
speedstep-lib.cm line 295, brings speedstep back to live: "if ((msr_hi & 
(1<<18)) /*&& (msr_hi & (3<<24))*/) {". After this modification cpufreqd is 
able to switch the speed between 700MHz and 900MHz again. However, the 
speed-min/speed-max entries in the legacy /proc interface still do both show 
"0" instead of the correkt frequencies while /proc/sys/cpu/0/speed shows the 
correct current frequency value. 
 
cpufreq: Coppermine: MSR_IA32_EBL_CR_POWERON is 0xcc080020, 0x0 
cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x550000 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcc080020 0x0 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcc080020 0x0 
cpufreq: read at pmbase 0x1000 + 0x50 returned 0x0 
cpufreq: writing 0x1 to pmbase 0x1000 + 0x50 
cpufreq: read at pmbase 0x1000 + 0x50 returned 0x1 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc6480020 0x0 
cpufreq: change to 700 MHz succeeded 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc6480020 0x0 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc6480020 0x0 
cpufreq: read at pmbase 0x1000 + 0x50 returned 0x1 
cpufreq: writing 0x0 to pmbase 0x1000 + 0x50 
cpufreq: read at pmbase 0x1000 + 0x50 returned 0x0 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcc080020 0x0 
cpufreq: change to 900 MHz succeeded 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcc080020 0x0 
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcc080020 0x0 
cpufreq: currently at high speed setting - 900 MHz 
speedstep-smi: signature:0x47534943, command:0x008000b2, event:0x000000b3, 
perf_level:0x07d00100. 
 
 
Steps to reproduce: Happens all by itself on the machine mentioned.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
