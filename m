From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Mon, 26 Mar 2007 13:07:01 -0700
Message-ID: <200703262007.l2QK71Dn032763@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8228





------- Additional Comments From alphatrax@t-online.de  2007-03-26 13:06 -------
Created an attachment (id=10951)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=10951&action=view)
dmesg log with current kernel with linux-phc

Oh I forgot to mention - the Kernel I'm using now is another one than the one I
was using when I first reported this Bug. The one I'm using now is the one with
Ubuntu's fix (about the linux-phc tables).
The one I'm using now is: 
2.6.20-13-generic #2 SMP
and I was using 2.6.20-12.

What I want to say is, the dmesg.log and cpuinfo.log where from another kernel
without the phc stuff.

I've attached the new dmesg output as dmesg2.log - maybe that explains the
differences. But as you know I absolutely don't know anything about kernel
stuff and how all that stuff works.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
