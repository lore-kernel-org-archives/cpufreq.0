From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8581] acpi-cpufreq gets very confused on suspend to ram
Date: Mon,  8 Oct 2007 06:47:59 -0700 (PDT)
Message-ID: <20071008134759.61E42108014@picon.linux-foundation.org>
References: <bug-8581-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8581-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8581





------- Comment #5 from eo@nebensachen.de  2007-10-08 06:47 -------
[Sorry for the delay.]

There still are some issues. On 2.6.22 and 2.6.23-rc9-git6 I see this
behaviour:

Driver: acpi-cpufreq
Governor: conservative

When issuing
echo mem > /sys/power/state
and resuming afterwards, /proc/cpuinfo reports maximum frequency. It
stays that way during normal operation until a more demanding process
is being launched. For instance when starting to compile the kernel,
the cpu is switched to the but lowest frequency (after some threshold,
of course) and behaves as expected from now on. So, there are two odd
things:
1. cpu stays at highest frequency after a suspend/resume cycle;
2. once there is enough load to trigger a frequency switching event,
   the switching algorithm behaves as if the cpu had been at the
   lowest frequency all the time, i.e., it steps through all the
   possible frequencies starting at the low end of the scale.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
