From: Mukesh Rajan <mrajan@ics.uci.edu>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
 P-state driver
Date: Wed, 5 Nov 2003 13:12:56 -0800 (PST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.SOL.4.20.0311051249350.23805-100000@dilbert.ics.uci.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@brodo.de, jan@rychter.com, venkatesh.pallipadi@intel.com, len.brown@intel.com
Cc: cpufreq@www.linux.org.uk, linux-acpi@intel.com

>> one processor, this theory isn't true for all processors. And dynamic
>> power management should work best _for all processors_.

This is too much of a generalization. By simply reducing the frequency
there only will be reduction in instantaneous power consumed by the
processor. There is no arguing that. But objective is to save energy.
Whether there will be energy savings or not, does not depend much on
processor, but _also_ on the underlying OS, the scheduler, the nature of
application etc etc or in other words the system as a whole.

I think i did see some good numbers in the past for mpeg decoder on XScale
patform with eCOS (static scheduling). But on arm-linux on an IPAQ I saw
nothing when I tried varying the processor voltage with load changes.
Maybe my modeling of load, frequency selection algorithm were not sound
enough, I dunno. I did'nt work on that project long enough.

Comments like "Noted that frequency changed" and "date sheet said so and
so" are not much convincing as actual numbers would.

Regards,
Mukesh


On Mon, Nov 03, 2003 at 07:21:34PM -0800, Jan Rychter wrote:
> >>>>> "Len" == Len Brown writes:
>  >> I have done some measurements on a Toshiba S7/290LNKW, which has a
>  >> 900MHz Pentium-M. The results have been posted to this list a while
>  >> ago -- the most surprising one being that the Pentium-M in that
>  >> machine seemed to always consume the same amount of power when idle,
>  >> independent of operating frequency.  The frequency only made a
>  >> difference when the CPU was actually doing something (or when I made
>  >> it not use the C3 state by loading usb-uhci).
> 
>  Len> Probably the cpu is running HLT in the idle loop, so the power
>  Len> consumption there would not vary with MHz.
> 
> Oh -- well, that's exactly what I wanted to check. It seems it does vary
> for speedstepped Pentium-III Mobile, according to my measurements,
> that's why I was surprised.
> 
> This should influence the design of dynamic power management -- if the
> CPU is already idle, there is no point in slowing it down. It only makes
> sense to change the frequency when we're actually doing something.

This assumption is at least partly wrong. Pentium-III Mobile datasheets
clearly show that the power usage when doing nothing varies up to 50%
dependand on the frequency setting. So even if it is no measurable effect
on
one processor, this theory isn't true for all processors. And dynamic
power management should work best _for all processors_.

	Dominik
