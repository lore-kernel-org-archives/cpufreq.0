From: Dietz Proepper <dietz@rotfl.franken.de>
Subject: "new" (aus of 2.6.20) acpi_cpufreq and thinkpad z61m
Date: Sun, 4 Feb 2007 11:57:14 +0100
Message-ID: <200702041157.15234.dietz@rotfl.franken.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi,

I've been playing around a lttle with a thikpad z61m (core 2 duo cpu,  945 
chipset) and acpi_cpufreq from 2.6.20-rc6 and found the follwoing strage 
behaviour:

Under "normal" circumstances, if I disconnect the ac power, the laptop 
pulls about 18W from the battery when idle (which nearly matchs idle 
consumption under Windows XP and is totally ok for the machine). 

But, every now and then, idle consumption goes up to about 25W, and goes 
down again only after a reboot (suspending to disk and resuming does not 
help). Needlessly to say that max/min frequencies are set to the right 
value and /sys/.../cpuinfo_cur_freq is at the min freq.

It seems that I can reproduce the above behaviour by setting the laptop 
under heavy load for some minutes (building a kernel seems to be 
sufficient).

Any idea?

thx alot,
	Dietz
