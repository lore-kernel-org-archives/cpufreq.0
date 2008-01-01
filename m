From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9636] cpufreq reports too low max freq on Intel P4
Date: Tue,  1 Jan 2008 10:15:48 -0800 (PST)
Message-ID: <20080101181548.6B220108068@picon.linux-foundation.org>
References: <bug-9636-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9636-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9636





------- Comment #3 from trenn@suse.de  2008-01-01 10:15 -------
First, look out for a BIOS update.

If this does not help, do you see any acpi warnings/errors in dmesg:
dmesg |grep -i acpi

If the BIOS update does not help, pls attach apcidump output.

This sounds like wrongly exported BIOS values for this CPU, which often get
fixed up by BIOS upgrades or possibly an ACPI interpreter bug.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
