From: Gerald Britton <gbritton@alum.mit.edu>
Subject: Re: cpufreq doesn't keep over suspend/resume
Date: Mon, 14 Jun 2004 21:32:42 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040615013242.GA13338@fog.sekrit.org>
References: <20040614191225.GA1463@fog.sekrit.org>
	<20040614202539.GA10796@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040614202539.GA10796@dominikbrodowski.de>
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

On Mon, Jun 14, 2004 at 10:25:39PM +0200, Dominik Brodowski wrote:
> Hi!
> 
> On Mon, Jun 14, 2004 at 03:12:25PM -0400, Gerald Britton wrote:
> > Warning: CPU frequency out of sync: cpufreq and timing core thinks of
> > 600000, is 1600000 kHz.
> > 
> > Also, this warning is somewhat confusing since "of" appears to refer to
> > "old_freq" rather than actually being a use of the word "of" so it wasn't
> > entirely clear what it was trying to say at first.
> 
> As you seem to be a "native speaker": how should we rephrase this message so
> it is clear what it is trying to say?

"actual cpu speed 1600000 kHz, cpufreq assumed 600000 kHz" perhaps, I'm not
sure there's a good concise way to word this.  This is likely a normal state
on resume though, so screaming about a warning might not be the right solution
here.  Checking with things, it seems that my thinkpad may infact always resume
from ACPI S3 with the speed at 1.6Ghz.

> > To reproduce this:
> > 
> > 1. Plug in AC power
> > 2. echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> > 3. echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_speed
> > 4. echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> > 5. echo mem > /sys/power/state
> > 6. press power button to resume
> 
> It's not a bug, it's a feature: the BIOS decides at what speed to boot
> and/or to resume. Often this depends on whether the AC adapter is plugged in
> or not. If the system resumes, it tries to go back to the state it was when
> suspending -- but it's bad if the timing core thinks the CPU runs at full
> speed when it is only running at half speed, or otherwise. So, upon
> resuming, cpufreq tries to determine the current speed, and to adapt the
> timing core and other affected subsystems to the new speed. Once the system
> is "alive", the previous set _policy_ is restored.
> 
> This policy consists of the _governor_ (in your case: userspace) and the min 
> and max frequencies -- not the actual frequencies echo'ed into
> scaling_setspeed. So, if you indeed do step 3. above (but with
> scaling_max_freq not _speed), it should return to run at 600000 kHz (check
> /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
> ). If not, please say so, and I'll cook up a debug patch to zero in on a
> possible BUG.

Prior to suspend:

# cat scaling_cur_freq scaling_max_freq scaling_min_freq scaling_setspeed
600000
600000
600000
600000
# grep 'cpu MHz' < /proc/cpuinfo
cpu MHz         : 598.244

After resume:

# cat scaling_cur_freq scaling_max_freq scaling_min_freq scaling_setspeed
600000
600000
600000
600000
# grep 'cpu MHz' < /proc/cpuinfo
cpu MHz         : 1595.318

I was examining the value in /proc/cpuinfo on resume and noticing the
difference.

				-- Gerald
