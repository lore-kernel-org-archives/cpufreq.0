From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7420] New: cpufreq/powernowd limiting CPU frequency on kernels
	>=2.6.16
Date: Thu, 26 Oct 2006 03:05:02 -0700
Message-ID: <200610261005.k9QA52Yb006487@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7420

           Summary: cpufreq/powernowd limiting CPU frequency on kernels
                    >=2.6.16
    Kernel Version: 2.6.16/17/18
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: interfc@jumpy.it


Most recent kernel where this bug did not occur:2.6.15
Distribution:Ubuntu64bit
Hardware Environment: X2 3800+, DFI NF4 Ultra-D, X800GT
Software Environment:
Problem Description: I overclocked via bios my cpu (factory: 200x10) to 2565mhz
(285x9), and I haven't any problems 'til 2.6.15, it goes down to 285x5 in idle
and up to 285x9 in full load. If I upgrade to a newer kernel, it says 1ghz in
idle and 1,8ghz in full load (I wonder it takes the fsb value, that is 200mhz,
directly form cpu and not from the bios, so it assumes 200x5 in idle and 200x9
in full load)
flapane@a64:~$ cpufreq-info
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: powernow-k8
  CPUs which need to switch frequency at the same time: 0 1
  hardware limits: 1000 MHz - 1.80 GHz
  available frequency steps: 1.80 GHz, 1000 MHz
  available cpufreq governors: userspace, powersave, ondemand, conservative,
performance
  current policy: frequency should be within 1000 MHz and 1.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1000 MHz.
analyzing CPU 1:
  driver: powernow-k8
  CPUs which need to switch frequency at the same time: 0 1
  hardware limits: 1000 MHz - 1.80 GHz
  available frequency steps: 1.80 GHz, 1000 MHz
  available cpufreq governors: userspace, powersave, ondemand, conservative,
performance
  current policy: frequency should be within 1000 MHz and 1.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1000 MHz.


Steps to reproduce:
simply compile a kernel >=2.6.16 and try to overclock your cpu from the bios
raising the FSB (or HT)

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
