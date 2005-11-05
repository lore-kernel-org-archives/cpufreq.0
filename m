From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] New: speedstep-smi fails to load if
	CONFIG_CPU_FREQ_DEBUG is not set
Date: Fri, 4 Nov 2005 16:19:13 -0800
Message-ID: <200511050019.jA50JDU3019363@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5553

           Summary: speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
                    not set
    Kernel Version: 2.6.14
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: tm@del.bg


Most recent kernel where this bug did not occur:
 2.6.14
Distribution:
 Debian GNU/Linux Etch
Hardware Environment:
 IBM ThinkPad T22, Pentium III (Coppermine), i440BX
Software Environment:
Problem Description:

cpufreq used to work with 2.6.8 and 2.6.11 kernels, but doesn't work with 2.6.12
and 2.6.14 for me. I've found that it actually works with 2.6.14 but only if
kernel is compiled with CONFIG_CPU_FREQ_DEBUG option set.

Steps to reproduce:

Compile kernel with all allmodconfig and clear the CONFIG_CPU_FREQ_DEBUG.

Then the following happens (otherwise it works):

# modprobe speedstep-lib relaxed_check=1
# modprobe speedstep-smi
FATAL: Error inserting speedstep_smi
(/lib/modules/2.6.14/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko): No
such device

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
