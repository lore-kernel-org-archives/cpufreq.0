From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10194] New: cpufreq P-state tables can change during runtime,
	handle it
Date: Fri,  7 Mar 2008 09:35:30 -0800 (PST)
Message-ID: <bug-10194-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10194

           Summary: cpufreq P-state tables can change during runtime, handle
                    it
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.25-rc4
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: Matt_Domsch@dell.com
                CC: wwlinuxengineering@dell.com


ACPI now allows a BIOS to change the P-state tables during runtime.  This can
happen as the result of a power cord being plugged in or out, of a thermal
alarm of some sort which BIOS catches, of a "green" power savings mode set in
BIOS, or possibly other situations.

When BIOS wants to change the tables, it issues an SCI.

acpi-cpufreq does not presently have a way to catch that SCI.  It does not
re-read the P-state tables.  And it does not inform userspace that the values
have changed.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
