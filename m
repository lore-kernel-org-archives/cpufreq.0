From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: little system-hang when switching frequencies
Date: Wed, 9 Jun 2004 17:59:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040609155946.GB9482@dominikbrodowski.de>
References: <1086717641.4311.30.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1086717641.4311.30.camel@localhost>
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
To: Thomas Breitner <mail@tombreit.de>
Cc: cpufreq@www.linux.org.uk

Hi,

On Tue, Jun 08, 2004 at 08:00:41PM +0200, Thomas Breitner wrote:
> using speedstep_smi, i get little "cpu-hangs" when frequency is
> switching from a high (here: 1 ghz) to a low (here: 730 mhz) value. for
> a trickle of a second the systems stops responding (mouse hangs etc),
> which i noticed especially when listening to music.

This doesn't really surprise me. speedstep-smi is "1st generation
speedstep", which was neither intended for dynamic frequency scaling nor to
be fast. It works by telling the BIOS to change the frequency, which will
stop all other activity on the system, then set the new frequency, and then
return to the OS. Obviously, this is much slower than a write to a processor
MSR, such as the new "Centrino" Pentium-M processors do.

> this does not occur when switching from low to high frequency.

In some cases, the BIOS returns an error. Then, empirical testing has shown,
delaying for some time and re-trying helps: in the first re-try, the system
is stopped for 50 ms, in the second re-try, it's 100 ms, and the third 150
ms, fourth 200 ms, fifth 250 ms -- so it may take up to 750 ms plus the time
the BIOS takes until the system becomes responsive again. To determine
whether this is the case on your system, uncomment the line
//#define SPEEDSTEP_DEBUG
in arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
use your system as usual, and check whether there are messages like
cpufreq: retry 1, previous result 1
in the kernel log

> sorry, i'm not sure if this belongs to the kernel-related 
> cpu-frequency-scaling-drivers...

It does -- though cpufreqd might consider not to load on speedstep-smi
driven systems.

> especially, because the speedstep_ich-module *should* be right for my 
> chipset:
>  >theo@theoschlepp:~$ lspci
>  >0000:00:00.0 Host bridge: Intel Corp. 82815 815 Chipset 
>  >Host Bridge and Memory Controller Hub (rev 04)

Currently, everything which is revision 4 or lower is not handled by
speedstep-ich because:

                /* speedstep.c causes lockups on Dell Inspirons 8000 and
                 * 8100 which use a pretty old revision of the 82815
                 * host brige. Abort on these systems.
                 */

If you want to try it out on your system, change the line
                if (rev < 5) {
in arch/i386/kernel/cpu/cpufreq/speedstep-ich.c to
		if (rev < 4) {
re-compile, and test -- but be advised that this might cause lockups!

If it works on your system, then I'll submit a patch which will check for
Dell Inspiron 8x00 and only disallow speedstep-ich for them, not for the
notebook you're using.

	Dominik
