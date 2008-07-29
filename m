From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10055] conservative governor doesn't increase frequency,
	just decrease. powernow-k7
Date: Tue, 29 Jul 2008 01:37:02 -0700 (PDT)
Message-ID: <20080729083702.D531210800B@picon.linux-foundation.org>
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


art-kbt@broomstick.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |art-kbt@broomstick.com




------- Comment #6 from art-kbt@broomstick.com  2008-07-29 01:37 -------
Still a problem with 2.6.25

Alex:  This is NOT the same bug as with conservative climbing extremely slowly
due to a high scaling_min value.  In this case, it will not climb AT ALL --
even hours pegged at 100%, and it will stay at the same frequency.  The bug you
reference also appeared much earlier -- this one appeared with 2.6.24, and
2.6.23 is fine.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
