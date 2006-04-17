From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6382] Random lockups, no kernel panic just a compleate hang
Date: Mon, 17 Apr 2006 05:52:10 -0700
Message-ID: <200604171252.k3HCqAPe011490@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6382





------- Additional Comments From stanv@altlinux.ru  2006-04-17 05:52 -------
First of all: This bug does not depend from sata_nv (computer lockups without
any ATA driver)

Steps to reproduce lockups:
1. (optional) boot to init level 1
2. modprobe cpufreq_userspace
   modprobe powernow_k8
3. cd /sys/devices/system/cpu/cpu0/cpufreq
3. echo userspace > scaling_governor
4. while true; do echo 800000 > scaling_setspeed; sleep 4; echo 1800000 >
scaling_setspeed; sleep 4; done

Notebook will be hang in any way after few changes of frequency.

Bug is at:
powernow-k8.c -> 
Phase 3 (function core_voltage_post_transition) ->
function write_new_vid ->
wrmsr(MSR_FIDVID_CTL, lo, STOP_GRANT_5NS);

Switching from 800000 kHz to 1800000 kHz all time goes fine!
But in same cases switching from 1800000 kHz to 800000 kHz bring to compleate hang.

Also I mentioned strange behaviour:
If put printk("..."); right after wrmsr() no more lockups. (say: dmesg -n 9 on
console).

And last:
If define STOP_GRANT_5NS as 50000 (10 msec on 500 MHz bus) computer will be
locked at first switching from 1800000 kHz to 800000 kHz.


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
