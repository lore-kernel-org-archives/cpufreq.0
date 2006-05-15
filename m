From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6558] New: Cpufreq reports nominal CPU speed instead of actual
Date: Mon, 15 May 2006 08:15:54 -0700
Message-ID: <200605151515.k4FFFst7009048@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6558

           Summary: Cpufreq reports nominal CPU speed instead of actual
    Kernel Version: 2.6.16
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: mstrobl2@yahoo.com


Most recent kernel where this bug did not occur: 2.6.15
Distribution: Gentoo-AMD64
Hardware Environment: 
Software Environment:
Problem Description: As of 2.6.16 the current CPU speed is reported as the
nominal speed instead of actual speed. On over or under clocked systems this
means that the true CPU speed is not shown. The problem is new as of 2.6.16. 

/proc/cpuinfo is where the incorrect speed is included and this file is then
used by various utilities to display current CPU speed. This means the wrong CPU
speed is displayed in utilities such as KDE's KSysguard etc. 

From GENTOO bug #131348, posted by Daniel Drake:

================= Start included text ================= 
What has happened is that as of 2.6.16, /proc/cpuinfo asks cpufreq for the
current frequency, and if that fails, it falls back on the old way (cpu_khz).

So your bug is that cpufreq does not show the real frequency -- you should be
able to confirm this by reading
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq"
================== End included text ================= 

Also see Gentoo bug 131348: http://bugs.gentoo.org/show_bug.cgi?id=131348
  

Steps to reproduce:

Change CPU speed by setting front side bus speed to any value except standard.
/proc/cpuinfo will show correct speed under 2.6.15 or earlier. Under 2.6.16 it
shows the incorrect nominal speed.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
