From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq doesn't keep over suspend/resume
Date: Mon, 14 Jun 2004 22:25:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040614202539.GA10796@dominikbrodowski.de>
References: <20040614191225.GA1463@fog.sekrit.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040614191225.GA1463@fog.sekrit.org>
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
To: Gerald Britton <gbritton@alum.mit.edu>
Cc: cpufreq@www.linux.org.uk

Hi!

On Mon, Jun 14, 2004 at 03:12:25PM -0400, Gerald Britton wrote:
> I recently updated my FC2 kernel from the release kernel to 2.6.6-1.435,
> my cpu is a "Intel(R) Pentium(R) M processor 1600MHz" in a Thinkpad T40p.
> When I suspend and resume, the hardware does not always resume at the same
> speed it suspended at.  It often will resume at full speed regardless of
> the speed prior to suspend.  Occasionally it will resume at low speed while
> operating on battery.  In prior kernels, the cpufreq driver's resume would
> reassert the speed policy and reset the processor speed to what it was
> prior to suspend.  Now though, the driver prints a warning about the cpu
> speed not matching the expected speed:
> 
> Warning: CPU frequency out of sync: cpufreq and timing core thinks of
> 600000, is 1600000 kHz.
> 
> Also, this warning is somewhat confusing since "of" appears to refer to
> "old_freq" rather than actually being a use of the word "of" so it wasn't
> entirely clear what it was trying to say at first.

As you seem to be a "native speaker": how should we rephrase this message so
it is clear what it is trying to say?

> To reproduce this:
> 
> 1. Plug in AC power
> 2. echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> 3. echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_speed
> 4. echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> 5. echo mem > /sys/power/state
> 6. press power button to resume

It's not a bug, it's a feature: the BIOS decides at what speed to boot
and/or to resume. Often this depends on whether the AC adapter is plugged in
or not. If the system resumes, it tries to go back to the state it was when
suspending -- but it's bad if the timing core thinks the CPU runs at full
speed when it is only running at half speed, or otherwise. So, upon
resuming, cpufreq tries to determine the current speed, and to adapt the
timing core and other affected subsystems to the new speed. Once the system
is "alive", the previous set _policy_ is restored.

This policy consists of the _governor_ (in your case: userspace) and the min 
and max frequencies -- not the actual frequencies echo'ed into
scaling_setspeed. So, if you indeed do step 3. above (but with
scaling_max_freq not _speed), it should return to run at 600000 kHz (check
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
). If not, please say so, and I'll cook up a debug patch to zero in on a
possible BUG.

Thanks,
	Dominik
