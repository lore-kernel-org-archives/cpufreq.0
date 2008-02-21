From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10055] conservative governor doesn't increase frequency,
	just decrease. powernow-k7
Date: Wed, 20 Feb 2008 16:44:36 -0800 (PST)
Message-ID: <20080221004436.55103108010@picon.linux-foundation.org>
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


davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de




------- Comment #2 from davej@codemonkey.org.uk  2008-02-20 16:44 -------
Most obvious candidate for a problematic diff would be this patch I guess..

commit 1c2562459faedc35927546cfa5273ec6c2884cce
Author: Thomas Renninger <trenn@suse.de>
Date:   Tue Oct 2 13:28:12 2007 -0700

    [CPUFREQ] allow ondemand and conservative cpufreq governors to be used as
default

    Depending on the transition latency of the HW for cpufreq switches, the
    ondemand or conservative governor cannot be used with certain cpufreq
    drivers.  Still the ondemand should be the default governor on a wide range
    of systems.  This patch allows this and lets the governor fallback to the
    performance governor at cpufreq driver load time, if the driver does not
    support fast enough frequency switching.

    Main benefit is that on e.g.  installation or other systems without
    userspace support a working dynamic cpufreq support can be achieved on most
    systems by simply loading the cpufreq driver.  This is especially essential
    for recent x86(_64) laptop hardware which may rely on working dynamic
    cpufreq OS support.



Looking through it though, I'm not entirely clear how it could be at fault.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
