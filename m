From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9475] jiffies counter leaps on CPU frequency changes
Date: Tue,  4 Dec 2007 13:28:25 -0800 (PST)
Message-ID: <20071204212825.38EDE108069@picon.linux-foundation.org>
References: <bug-9475-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9475-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9475





------- Comment #3 from davej@codemonkey.org.uk  2007-12-04 13:28 -------
we've been doing adjust_jiffies() on cpu speed transitions forever, so this
isn't a regression in that sense.  Why it's causing a problem now is a mystery
though.

Even more puzzling, on lkml, Stefano commented out the adjust_jiffies() code,
and still saw leaping counters, so I'm really at a loss to explain what's going
on.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
