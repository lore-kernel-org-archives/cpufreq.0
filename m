From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9151] Something broke cpufreq on laptop with lid behavior
	between 2.6.17 and 2.6.23
Date: Fri, 14 Dec 2007 20:51:55 -0800 (PST)
Message-ID: <20071215045155.72C7E11D109@picon.linux-foundation.org>
References: <bug-9151-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9151-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9151


len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acpi-
                   |                            |bugzilla@lists.sourceforge.n
                   |                            |et
            Summary|Something broke cpufreq on  |Something broke cpufreq on
                   |laptop with lid behavior    |laptop with lid behavior
                   |                            |between 2.6.17 and 2.6.23




------- Comment #7 from len.brown@intel.com  2007-12-14 20:51 -------
> When AC power is unplugged, the system clocks to its lowest speed but it also
> throttles to 25%. I don't want the throttling and have to un-throttle it by
> hand.

I've seen this bug before in the SuSE user-space.
Somebody got the idea that T-states save energy,
so they enable them when on battery.
I thought that they fixed it, but apparently they only disabled
this nonsense on MP systems, and UP systems remain broken.

There should be a check box someplace in the powersaved GUI
to disable this.  The mystery is why you didn't see it also in 2.6.17.

Also, if the system is idle and running a sane governor
like ondemand, you should be in the lowest
P-state both before and after the transition from AC->DC.

> ... The governor switches to powersave. If the lid is closed
> on battery power, the CPU frequency begones the HIGHEST (2GHz).
> scaling_min_freq and scaling_max_freq report 600MHz but scaling_cur_freq
> reports 2GHz. 

This again sounds like broken user-space policy software.
See if this still happens when in single-user mode
and none of that junk is running.  But again, the mystery
is why you don't see the same issue with the same user-space
and the 2.6.17 kernel.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
