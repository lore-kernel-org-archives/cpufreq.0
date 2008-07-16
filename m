From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 11094] acpi-cpufreq does not recognize pentium-D 3Ghz on
	intel-D945GCZ board
Date: Tue, 15 Jul 2008 21:34:45 -0700 (PDT)
Message-ID: <20080716043445.3ED7E10800B@picon.linux-foundation.org>
References: <bug-11094-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-11094-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=11094





------- Comment #1 from jmalacho@gmail.com  2008-07-15 21:34 -------
So that chart is misleading, as I keep looking there is a chance my processor
doesn't support speedstep.  I cannot figure out parse the cpuid 

cpu family: 15, model: 6, stepping: 5

The four that match the information I understand are:
http://processorfinder.intel.com/details.aspx?sSpec=SL94Rx
http://processorfinder.intel.com/details.aspx?sSpec=SL9D9
http://processorfinder.intel.com/details.aspx?sSpec=SL95X
http://processorfinder.intel.com/details.aspx?sSpec=SL9KA

1 of them doesn't support speedstep, the other 3 do (if that information is
accurate).  How can I figure out which stepping matches which processor?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
