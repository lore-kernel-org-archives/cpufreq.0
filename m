From: "Saiello@Jentoo.com" <Saiello@Jentoo.com>
Subject: Longhaul: 'Samuel 2' [C5B]
Date: Tue, 9 Dec 2003 08:43:19 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <11947.3642007963$1070977506@news.gmane.org>
Reply-To: Saiello@Jentoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hello,

I am using the 2.6.0-test11 kernel. My cpuinfo is as follows:
processor       : 0
vendor_id       : CentaurHauls
cpu family      : 6
model           : 7
model name      : VIA Samuel 2
stepping        : 3
cpu MHz         : 533.577
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu de tsc msr cx8 mtrr pge mmx 3dnow
bogomips        : 1048.57

My dmesg, reports:
longhaul: VIA C3 'Samuel 2' [C5B] CPU detected. Longhaul v1 supported.
longhaul: MinMult=3.0x MaxMult=4.0x
longhaul: FSB: 133MHz Lowestspeed=399MHz Highestspeed=532MHz

My /sys/devices/system/cpu/cpu0/cpufreq/ contains the following files with:
cpuinfo_max_freq
-------
532

cpuinfo_min_freq
-------
399

scaling_available_governors
-------
powersave userspace performance

scaling_driver
-------
longhaul

scaling_governor
-------
userspace

scaling_max_freq
-------
532

scaling_min_freq
-------
399

scaling_setspeed
-------
532

When I do the following command "cat scaling_min_freq > scaling_setspeed", 
nothing really seems to happen.  if I "cat scaling_setspeed" it still has 532 
in it. Please advise.

Thank you,
  Steven
