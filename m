From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8033] New: CPU loses cpufreq link after offline/online
	transition
Date: Sun, 18 Feb 2007 04:18:28 -0800
Message-ID: <200702181218.l1ICIS71018051@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8033

           Summary: CPU loses cpufreq link after offline/online transition
    Kernel Version: 2.6.20
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: bernhard.bender@web.de


Most recent kernel where this bug did *NOT* occur: unknown
Distribution: openSuSE10.2 (probably irrelevant)
A previous descussion of this problem is here:
https://bugzilla.novell.com/show_bug.cgi?id=246525

Hardware Environment: hp compaq nx6325 (AMD Turion64 X2
Software Environment:

Problem Description:
After taking CPU1 offline and online again, the
/sys/devices/system/cpu/cpu1/cpufreq link is missing.
This also happens after suspend2disk and resume.

While the CPU will work normally, kpowersave will report it as disabled.

Steps to reproduce:
as root user:
# echo 0 >/sys/devices/system/cpu/cpu1/online
# echo 1 >/sys/devices/system/cpu/cpu1/online
# l /sys/devices/system/cpu/*
-rw-r--r-- 1 root root 4096 2007-02-16 23:12
/sys/devices/system/cpu/sched_mc_power_savings

/sys/devices/system/cpu/cpu0:
total 0
drwxr-xr-x 5 root root    0 2007-02-16 23:12 ./
drwxr-xr-x 4 root root    0 2007-02-16 23:12 ../
drwxr-xr-x 5 root root    0 2007-02-17 00:08 cache/
drwxr-xr-x 3 root root    0 2007-02-16 23:12 cpufreq/
-r-------- 1 root root 4096 2007-02-16 23:12 crash_notes
drwxr-xr-x 2 root root    0 2007-02-17 00:08 topology/

/sys/devices/system/cpu/cpu1:
total 0
drwxr-xr-x 4 root root    0 2007-02-16 23:13 ./
drwxr-xr-x 4 root root    0 2007-02-16 23:12 ../
drwxr-xr-x 5 root root    0 2007-02-16 23:13 cache/
-r-------- 1 root root 4096 2007-02-16 23:12 crash_notes
-rw------- 1 root root    0 2007-02-16 23:13 online
drwxr-xr-x 2 root root    0 2007-02-16 23:13 topology/
#

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
