From: Gerald Britton <gbritton@alum.mit.edu>
Subject: cpufreq doesn't keep over suspend/resume
Date: Mon, 14 Jun 2004 15:12:25 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040614191225.GA1463@fog.sekrit.org>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I recently updated my FC2 kernel from the release kernel to 2.6.6-1.435,
my cpu is a "Intel(R) Pentium(R) M processor 1600MHz" in a Thinkpad T40p.
When I suspend and resume, the hardware does not always resume at the same
speed it suspended at.  It often will resume at full speed regardless of
the speed prior to suspend.  Occasionally it will resume at low speed while
operating on battery.  In prior kernels, the cpufreq driver's resume would
reassert the speed policy and reset the processor speed to what it was
prior to suspend.  Now though, the driver prints a warning about the cpu
speed not matching the expected speed:

Warning: CPU frequency out of sync: cpufreq and timing core thinks of
600000, is 1600000 kHz.

Also, this warning is somewhat confusing since "of" appears to refer to
"old_freq" rather than actually being a use of the word "of" so it wasn't
entirely clear what it was trying to say at first.

To reproduce this:

1. Plug in AC power
2. echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
3. echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_speed
4. echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
5. echo mem > /sys/power/state
6. press power button to resume

				-- Gerald
