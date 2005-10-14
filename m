From: Andrew Morton <akpm@osdl.org>
Subject: Fw: [Bugme-new] [Bug 5435] New: Powernow code has random CPU speed
Date: Thu, 13 Oct 2005 21:42:05 -0700
Message-ID: <20051013214205.200583c1.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk



Begin forwarded message:

Date: Thu, 13 Oct 2005 20:24:07 -0700
From: bugme-daemon@kernel-bugs.osdl.org
To: bugme-new@lists.osdl.org
Subject: [Bugme-new] [Bug 5435] New: Powernow code has random CPU speed


http://bugzilla.kernel.org/show_bug.cgi?id=5435

           Summary: Powernow code has random CPU speed
    Kernel Version: 2.6.14-rc4
            Status: NEW
          Severity: normal
             Owner: johnstul@us.ibm.com
         Submitter: Larry.Finger@lwfinger.net


Most recent kernel where this bug did not occur: 2.6.13 ?
Distribution: SuSE 10.0
Hardware Environment: HP ze1115 notebook with 1100 MHz clock
Software Environment:
Problem Description: Processor speed determined at startup seems to be random

Steps to reproduce: Just boot and look at 'dmesg' output.

========================================================================
When it works correctly:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
Detected 1100.247 MHz processor.
powernow: SGTC: 10000
powernow: Minimum speed 500 MHz. Maximum speed 1100 MHz.

=========================================================================
When it fails, speeds are random:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
Detected 7352.734 MHz processor.
powernow: No PST tables match this cpuid (0x771)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: Minimum speed 3342 MHz. Maximum speed 7352 MHz.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
