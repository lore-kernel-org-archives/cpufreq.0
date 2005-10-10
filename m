From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5407] New: CPUFrequency driver for AMD K8 crashes PC with
	Sempron 3400+ CPU
Date: Sun, 9 Oct 2005 21:13:31 -0700
Message-ID: <200510100413.j9A4DVpP028129@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5407

           Summary: CPUFrequency driver for AMD K8 crashes PC with Sempron
                    3400+ CPU
    Kernel Version: 2.6.13.2
            Status: NEW
          Severity: blocking
             Owner: cpufreq@www.linux.org.uk
         Submitter: t.artem@mailcity.com


Most recent kernel where this bug did not occur: none
Distribution: Fedora Core 4 + Updates from RawHide
Hardware Environment:
. . . . CPU: AMD Sempron 3400+ CPU Palermo family 2000MHz frequency
. . . . MotherBoard: GigaByte K8NS Pro Bios F12 (latest published on the website)
Software Environment:
Problem Description: Every time when I modprobe cpufrequency module for my CPU
and adjust CPU policy the computer completely freezes.

Steps to reproduce:

        modprobe powernow-k8 >/dev/null 2>&1
        modprobe cpufreq_ondemand >/dev/null 2>&1
        modprobe cpufreq_powersave >/dev/null 2>&1
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

then computer hangs with no signs of kernel panic.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
