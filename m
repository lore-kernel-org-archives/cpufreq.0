From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8423] New: "powernow-k8: Processor cpuid 70ff1 not supported"
	on Athlon64 3800+ AM2 which supports Cool'n'Quiet
Date: Thu, 3 May 2007 03:10:49 -0700
Message-ID: <200705031010.l43AAnnf013974@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8423

           Summary: "powernow-k8: Processor cpuid 70ff1 not supported" on
                    Athlon64 3800+ AM2 which supports Cool'n'Quiet
    Kernel Version: 2.6.21.1
            Status: NEW
          Severity: low
             Owner: cpufreq@www.linux.org.uk
         Submitter: tometzky@prhn.dnsalias.org


Most recent kernel where this bug did *NOT* occur: unknown
Distribution: vanilla kernel copiled with FC6 gcc-4.1.1-51.fc6
Hardware Environment: AMD Athlon64 3800+ AM2 on Gigabyte GA-M61PM-S2, latest BIOS
Software Environment: Fedora Core 6

Problem Description:
Powernow-k8 driver does not load - it shows a message
    powernow-k8: Processor cpuid 70ff1 not supported
on my new AMD Athlon64 3800+ on AM2 connector (Family: 15 Model: 15 Stepping:
1), which does support Cool'n'Quiet. Because of this I cannot use cpufreq in my
system.

I think it triggers a check
    (eax & CPUID_XMOD) > CPUID_XMOD_REV_G)
from row 524 in arch/i386/kernel/cpu/cpufreq/powernow-k8.c.

Macros CPUID_XMOD and CPUID_XMOD_REV_G are defined in
./arch/i386/kernel/cpu/cpufreq/powernow-k8.h:
    #define CPUID_XMOD                      0x000f0000      /* extended model */
    #define CPUID_XMOD_REV_G                0x00060000

Steps to reproduce:
1. compile kernel with powernow-k8 support
2. boot on Athlon64 3800+ AM2

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
