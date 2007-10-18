From: Nebojsa Trpkovic <trx.lists@gmail.com>
Subject: acpi-cpufreq dissapires when FSB is changed
Date: Thu, 18 Oct 2007 17:45:51 +0200
Message-ID: <47177FAF.2070206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: cpufreq@www.linux.org.uk

kernel 2.6.23
intel p35 board
core2duo e6750 (6x333=2000MHz, 8x333=2667MHz)

when it runs on default FSB (333MHz) it looks like this:
uname -a
Linux tnt 2.6.23-gentoo #3 SMP Sun Oct 21 15:37:59 CEST 2007 x86_64
Intel(R) Core(TM)2 Duo CPU E6750 @ 2.66GHz GenuineIntel GNU/Linux
ls -lah /sys/devices/system/cpu/cpu0/cpufreq/
total 0
drwxr-xr-x 4 root root    0 Oct 18 17:19 .
drwxr-xr-x 6 root root    0 Oct 18 17:19 ..
-r--r--r-- 1 root root 4.0K Oct 18 17:24 affected_cpus
-r--r--r-- 1 root root 4.0K Oct 18 17:24 cpuinfo_max_freq
-r--r--r-- 1 root root 4.0K Oct 18 17:24 cpuinfo_min_freq
drwxr-xr-x 2 root root    0 Oct 18 17:24 ondemand
-r--r--r-- 1 root root 4.0K Oct 18 17:24 scaling_available_frequencies
-r--r--r-- 1 root root 4.0K Oct 18 17:24 scaling_available_governors
-r--r--r-- 1 root root 4.0K Oct 18 17:24 scaling_cur_freq
-r--r--r-- 1 root root 4.0K Oct 18 17:24 scaling_driver
-rw-r--r-- 1 root root    0 Oct 18 17:19 scaling_governor
-rw-r--r-- 1 root root 4.0K Oct 18 17:24 scaling_max_freq
-rw-r--r-- 1 root root 4.0K Oct 18 17:24 scaling_min_freq
drwxr-xr-x 2 root root    0 Oct 18 17:24 stats
cat /proc/cpuinfo |grep MHz
cpu MHz         : 2000.000
cpu MHz         : 2000.000

when FSB is changed (400MHz) it looks like this:
uname -a
Linux tnt 2.6.23-gentoo #3 SMP Sun Oct 21 15:37:59 CEST 2007 x86_64
Intel(R) Core(TM)2 Duo CPU E6750 @ 2.66GHz GenuineIntel GNU/Linux
ls -lah /sys/devices/system/cpu/cpu0/cpufreq/
ls: cannot access /sys/devices/system/cpu/cpu0/cpufreq/: No such file or
directory
cat /proc/cpuinfo |grep MHz
cpu MHz         : 3200.000
cpu MHz         : 3200.000

the only thing that was changed in BIOS is FSB freq. no power-saving
options were changed.

so, in other operating systems frequency scaling continue to work using
the same multiplier-voltage data (for e6750 it's 1.15V for 6x and 1.35V
for 8x). it leads to 2.4GHz @1.15V and 3.2GHz @1.35V and that is far
from unstable for this CPU (the one I own is rock stable at 2.4GHz
@1.01V and 3.2GHz @1.26V).

before this Intel CPU, I had experiance with Athlon64 CPUs and
powernow-k8 cpufreq driver. it has been using multiplier-voltage data no
matter what FSB freq was specified, just like windows does with core2duo
CPUs. that was much more flexibile and usefull.

here, I guess, acpi-cpufreq can not locate data for 2.4GHz and 3.2GHz
freqs and fails to work.

is there any way to make acpi-cpufreq use multiplier-voltage instead of
frequency-voltage pairs?
