From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8581] New: acpi-cpufreq gets very confused on suspend to ram
Date: Mon, 4 Jun 2007 04:45:24 -0700
Message-ID: <200706041145.l54BjOA7017413@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8581

           Summary: acpi-cpufreq gets very confused on suspend to ram
    Kernel Version: 2.6.21.3
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: eo@nebensachen.de


Most recent kernel where this bug did *NOT* occur: Only switched to
acpi-cpufreq now.
Distribution: Ubuntu 06.10
Hardware Environment: Thinkpad X40
Software Environment:
Problem Description:
After startup acpi-cpufreq works as expected either running the
ondemand or the conservative governor. When using the conservative
governor, the cpu frequency stays at full speed after a suspend to ram
/ resume cycle. Switching to performance and back to conservative
seems to restore the usual behaviour.

Even more strange are the symptoms when running the ondemand governor.
A s2ram / resume cycle automatically switches to conservative, for
some reason, and I made a rather thorough search in /etc to ensure
that this is not due to some acpi, laptop-mode or similar script. At
least, cpu frequency drops to the lowest frequency but after a second
s2ram/resume cycle there it shows the same behaviour as described
above, i.e., frequency stays at full speed.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
