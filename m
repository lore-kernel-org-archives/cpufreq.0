From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10055] conservative governor doesn't increase frequency,
	just decrease. powernow-k7
Date: Tue, 29 Jul 2008 02:04:18 -0700 (PDT)
Message-ID: <20080729090418.D5E33108009@picon.linux-foundation.org>
References: <bug-10055-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10055-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10055





------- Comment #7 from art-kbt@broomstick.com  2008-07-29 02:04 -------
Created an attachment (id=17022)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=17022&action=view)
kern log for cpufreq scaling not working

Kernel log for cpufreq conservative scaling not working, cpufreq.debug=7.  For
the last few minutes of this log, the CPU was pegged at 95-100%, yet the
frequency stood still at the lowest possible value.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
