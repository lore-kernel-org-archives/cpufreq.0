From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9851] New: cpufreq is not works with Intel Celeron 420
Date: Wed, 30 Jan 2008 07:05:10 -0800 (PST)
Message-ID: <bug-9851-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9851

           Summary: cpufreq is not works with Intel Celeron 420
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: sanarin@nikiet.ru


Hardware Environment: Intel G33 chipset, Intel Celeron 420 
Problem Description: I got Intel G33-based motherboard and 2 processors - Intel
Core 2 Duo E6300 and Intel Celeron 420. Then I put E6300 into motherboard,
cpufreq works fine. But with Celeron 420 and same hardware ans software,
spufreq is not works. I tried ACPI Processor P-States driver and  Pentium 4
clock modulation driver. Both drivers are not works with Celeron 420. If I use
p4-clockmod, I got following message : "Unknown p4-clockmod-capable CPU. Please
send an e-mail to <cpufreq@lists.linux.org.uk>". ACPI Processor P-States driver
simple not works. No any error messages.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
