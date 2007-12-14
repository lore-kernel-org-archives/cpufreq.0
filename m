From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9558] AE_AML_PACKAGE_LIMIT,
	Evaluating _PSS - Frequency scaling not working after BIOS upgrade on
	Asus F3jc
Date: Fri, 14 Dec 2007 14:49:34 -0800 (PST)
Message-ID: <20071214224934.68CBA11D108@picon.linux-foundation.org>
References: <bug-9558-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9558-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9558


len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acpi-
                   |                            |bugzilla@lists.sourceforge.n
                   |                            |et
         AssignedTo|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
             Status|NEEDINFO                    |NEW
          Component|cpufreq                     |Power-Processor
            Product|Power Management            |ACPI
            Summary|Frequency scaling not       |AE_AML_PACKAGE_LIMIT,
                   |working after BIOS upgrade  |Evaluating _PSS - Frequency
                   |on Asus F3jc                |scaling not working after
                   |                            |BIOS upgrade on Asus F3jc




------- Comment #6 from len.brown@intel.com  2007-12-14 14:49 -------
please attach the output from acpidump.
if possible, it would be great to get it when running
both the new broken BIOS, and again with the old working BIOS.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
