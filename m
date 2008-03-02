From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10144] Wrong cpufreq speeds detected when overclocking (speeds
	reported using stock FSB, not overclocked)
Date: Sun,  2 Mar 2008 11:52:57 -0800 (PST)
Message-ID: <20080302195257.3378E108067@picon.linux-foundation.org>
References: <bug-10144-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10144-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10144


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |corentincj@iksaif.net




------- Comment #5 from trenn@suse.de  2008-03-02 11:52 -------
This ACPI device looks quite powerful, it seems to be a new ASUS specific ACPI
device we do not support yet:
Device (ASOC)
{
     Name (_HID, "ATK0110")
Maybe Corentin knows more about this machine, do you know about this device?
There also overclocking data and much more is included...

The cpufreq tables are included in another table that gets loaded at runtime.
Hopefully you can fetch them via:
acpidump --addr 0x7FF8E0D0 --length 0x0214 >ssdt_table_cpu0.dump
acpidump --addr 0x7FF8E2F0 --length 0x0143 >ssdt_table_cpu2.dump

Two should be enough..., can you attach these (best each and as plain text,
that's easier to handle).

Hmm before you attach new tables, you should make sure you run the latest BIOS.
If not and you still have problems, better re-attach acpidump.
CPUfreq problems often get resolved with a BIOS update on rather new machines.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
