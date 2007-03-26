From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Mon, 26 Mar 2007 12:52:22 -0700
Message-ID: <200703261952.l2QJqMbV032239@fire-2.osdl.org>
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





------- Additional Comments From alphatrax@t-online.de  2007-03-26 12:52 -------
I'm unsure if Bug 8245 really is a duplicate as I'm was also using 6.10 Edgy 
and 6.06 Dapper and this bug was always present.
In Bug 8245 Daniel Swarbrick said:

> Under 2.6.17 (Ubuntu 6.10), speedstep-centrino loads successfully, and the
> frequency scales from 600MHz to 1.6GHz as it should. acpi-cpufreq fails to > 
> load
> with ENODEV.

For me it was the same problem as no - no scaling at all.

If there's any information needed please tell me. I don't have anything to do 
with kernels and stuff I'm just a normal Linux user. ;)

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
