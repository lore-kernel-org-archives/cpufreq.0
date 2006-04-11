From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6376] New: cpufreq wrongly reports "frequency should be within
	600 MHz and 600 MHz"
Date: Tue, 11 Apr 2006 11:14:56 -0700
Message-ID: <200604111814.k3BIEu2d030200@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6376

           Summary: cpufreq wrongly reports "frequency should be within 600
                    MHz and 600 MHz"
    Kernel Version: 2.6.16
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: stivani@gmail.com


Most recent kernel where this bug did not occur: Any 2.6.x kernel
Distribution: Gentoo Linux
Hardware Environment: Dell Latitude D800 Pentium M 1.70 GHz (Dothan)
Software Environment:
Problem Description:
Every time I unplug the ac adapter, cpufreq want go up to 1.70 GHz.
cpufreq-info reports wrongly "frequency should be within 600 MHz and 600 MHz"
If I plugin the ac adapter again and wait a couple of seconds, speedstepping 
works correct again. I have tried both with acpi-cpufreq and speedstep-centrino 
driver. It also happens with every governor.


Steps to reproduce:
1. unplug ac adapter
2. cpufreq-info displays wrong maximum frequency.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
