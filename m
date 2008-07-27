From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 11170] New: 2.6.24 w/ nohz=off runs cooler than 2.6.25 tickless
Date: Sun, 27 Jul 2008 05:09:05 -0700 (PDT)
Message-ID: <bug-11170-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=11170

           Summary: 2.6.24 w/ nohz=off runs cooler than 2.6.25 tickless
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.25.12-62.fc8
          Platform: All
        OS/Version: Linux
              Tree: Fedora
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: theholyettlz@googlemail.com


Latest working kernel version: 2.6.24.7-92.fc8

Earliest failing kernel version: 2.6.25

Distribution: Fedora 8

Hardware Environment: Intel Core 2 Duo T8100 on Clevo M720R notebook

Software Environment: i686

Problem Description:
Kernel 2.6.24.7 runs cooler on this machine, even when booted "nohz=off", than
Kernel 2.6.25.* in tickless mode. The difference, in both coretemp and ACPI
thermal zone, is typically 4-6 C. This is all the more odd since 2.6.25 seems
to better support ACPI features like the lid and sleep button, which were
detected under 2.6.24 but didn't generate events, and the "smart power" button
which limits the clock to 1.2 GHz. [I'm booting "nohz=off" due to another
problem whereby the machine seems to "pause" (*not* freeze) when there are few
interrupts happening.]

Under 2.6.24.7, powertop reports 100% "C0 (cpu running)" residency, just
altering the clock rate, and around 100-200 wups. With 2.6.25.12, it shows two
C0 states, "C0 (cpu running)" and just "C0"; the residency figures don't make
much sense, and I suspect powertop is reporting garbage in both cases
(sometimes things like 8 wups). Furthermore, I don't really understand what I
see in /proc/acpi/processor/*/power --- with 2.6.24.7, only C1 shows any usage,
and the number keeps resetting after a few seconds. With 2.6.25.12, C1--C3 show
some usage, again with the numbers resetting.

Another thing (I don't know if it's related) is that under 2.6.25.12, I get the
following in dmesg:

    ACPI Exception (thermal-0457): AE_ERROR, ACPI thermal trip point state
changed

I also see a lot of

    ACPI: Invalid passive threshold

in dmesg for 2.6.24.7 if I cold-boot 2.6.25.12 first. Furthermore, cold-booting
2.6.25.12 and then re-booting into 2.6.24.7 makes the lid work under the
latter.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
