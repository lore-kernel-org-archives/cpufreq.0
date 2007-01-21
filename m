From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7859] New: Frequency can't switch on a dual Turion 64
Date: Sun, 21 Jan 2007 08:01:14 -0800
Message-ID: <200701211601.l0LG1EHq027033@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7859

           Summary: Frequency can't switch on a dual Turion 64
    Kernel Version: 2.6.19.2
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: roms@lievin.net
                CC: trenn@suse.de


Most recent kernel where this bug did *NOT* occur:
Distribution: Debian testing 64-bits
Hardware Environment: Laptop Fujistu-Siemens Amilo Pa 1538
Software Environment: vanilla kernel 2.6.19.2 SMP w/ ACPI
Problem Description: while the driver correctly detects the two available
frequencies (800 & 1600 MHz), any governor will always use the lowest one.
Sometimes, it enables the highest frequency. In this case, my laptop switches
well between lowest and highest frequencies on power insertion/removal.
But, most of the time, I can switch between 800 and 800MHz, sic!

It looks like the powernow-k8 driver correctly constructs a two entry frequency
table and verifies it, and then reverifies a second frequency table with only 1
entry in it. But, I feel very strange that frequency range can vary ("request
for verification of policy") between 2 calls of cpufreq_driver->verify() on
the same CPU (cpufreq.c: 1386 & 1400). First call returns 800000-1600000MHz
while the second one returns 800000-800000. Moreover, both calls are done before
calling set_policy() at line 1413.

I have attached:
- dmesg output
- sysfs files
- cpufreq-info output
- ACPI dump

Romain.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
