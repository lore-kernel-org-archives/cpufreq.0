From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8581] acpi-cpufreq gets very confused on suspend to ram
Date: Mon, 4 Jun 2007 05:38:01 -0700
Message-ID: <200706041238.l54Cc15b018513@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8581





------- Additional Comments From eo@nebensachen.de  2007-06-04 05:41 -------
Just for the record, speedstep-centrino which I've been using until
now still works as expected. In my configuration its switching the
cpufreq driver that triggers the problem. And there is another
difference although it might be known and considered a limitation
rather than a bug: Whereas the speedstep-centrino module apparently
can be unloaded during normal operation, the same does not apply to
acpi-cpufreq as the module is claimed to be in use even after
switching to the performance governor and setting everything to the
startup defaults.

Regards,

Elias

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
