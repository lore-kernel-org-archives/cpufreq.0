From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Thu, 26 Apr 2007 18:52:57 -0700
Message-ID: <200704270152.l3R1qvZq032562@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From dsd@gentoo.org  2007-04-26 18:52 -------
Created an attachment (id=11279)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=11279&action=view)
diagnostic patch

I'm not knowledgeable about any of this stuff, but here's an attempt to further
clarify what's going on: Please apply this patch and attach new dmesg output.

I think one important part of the issue is that powernow-k7 can't look up the
frequency tables on it's own (possibly broken BIOS), so it falls back on ACPI.

Also, sometimes the ACPI developers find acpidump output useful. You can emerge
pmtools to get this utility - I suggest you attach the output here.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
