From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5495] New: changing cpu frequency causes fatal USB errors
Date: Tue, 25 Oct 2005 14:10:45 -0700
Message-ID: <200510252110.j9PLAjim019657@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5495

           Summary: changing cpu frequency causes fatal USB errors
    Kernel Version: 2.6.14-rc5
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: masbock@us.ibm.com


Most recent kernel where this bug did not occur:
2.6.14-rc5 x86_64
Distribution:
SLES9 x86_64
Hardware Environment:
2 x Dual Core AMD Opteron 280
Software Environment:
Problem Description:
With PowerNow is enabled on the system, powernow_k8 and cpufreq_userspace loaded
and cpu frequency is changed Unrecoverable OHCI errors and fatal EHCI errors occur.

Steps to reproduce:
1) Either boot the system with powersaved turned on, the USB errors happen when
a load is put on the system that cause the cpu frequency to change.

2) Or boot the system with powersaved off and manually do:
modprobe powernow_k8
modprobe cpufreq_userspace
cd /sys/devices/system/cpu
echo userspace > cpu0/cpufreq/scaling_governor
echo userspace > cpu2/cpufreq/scaling_governor
echo 2200000 > cpu0/cpufreq/scaling_setspeed
echo 2200000 > cpu2/cpufreq/scaling_setspeed
sleep 1
echo 2000000 > cpu0/cpufreq/scaling_setspeed
echo 2000000 > cpu2/cpufreq/scaling_setspeed
sleep 1
echo 1800000 > cpu0/cpufreq/scaling_setspeed
echo 1800000 > cpu2/cpufreq/scaling_setspeed
sleep 1
echo 1000000 > cpu0/cpufreq/scaling_setspeed
echo 1000000 > cpu2/cpufreq/scaling_setspeed
sleep 1
echo 1800000 > cpu0/cpufreq/scaling_setspeed
echo 1800000 > cpu2/cpufreq/scaling_setspeed
sleep 1
echo 2000000 > cpu0/cpufreq/scaling_setspeed
echo 2000000 > cpu2/cpufreq/scaling_setspeed
sleep 1
echo 2200000 > cpu0/cpufreq/scaling_setspeed
echo 2200000 > cpu2/cpufreq/scaling_setspeed
sleep 1
echo 2400000 > cpu0/cpufreq/scaling_setspeed
echo 2400000 > cpu2/cpufreq/scaling_setspeed

The USB errors happen after one of the frequency changes.
The errors are:
ohci_hcd 0000:00:03.1: OHCI Unrecoverable Error, disabled
and
ehci_hcd 0000:00:03.2: fatal error

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
