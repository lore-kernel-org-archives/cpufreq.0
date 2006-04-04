From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6331] New: cpu frequency gets lowered by kernel when cord is
	pulled(init=bin/sh)
Date: Tue, 4 Apr 2006 13:03:43 -0700
Message-ID: <200604042003.k34K3hOf014836@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6331

           Summary: cpu frequency gets lowered by kernel when cord is
                    pulled(init=bin/sh)
    Kernel Version: 2.6.16 from kernel.org
            Status: NEW
          Severity: low
             Owner: cpufreq@www.linux.org.uk
         Submitter: mike@palczewski.net


Most recent kernel where this bug did not occur: unknown
Distribution: ubuntu dapper
Hardware Environment: Dell inspiron 9300 Inetl Pentium M 1.73 using
centrino-speedstep
Software Environment: ubuntu dapper gcc 4.0.3 
Problem Description:

when ac cord is pulled (even in single user mode, or with init=/bin/sh)  
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
get's set to the scaling_min_freq automatically
any scripts that run and try to set scaling_max_freq to something else end up
instead making sure that this gets reverted back to min freq
this is using the performance governor. 

Steps to reproduce:
boot kernel with flag init=/bin/sh and ac plugged in (to make sure no other
scripts of anything could possibly be changing this)
# mount /sys
pull plug

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
repeat last step until it eventually goes back to the full frequency and stays
there.  

a workaround for scrits that normally control these things is to have them sleep
for a while after an AC event has occured.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
