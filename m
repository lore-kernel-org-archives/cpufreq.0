From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 4 Nov 2003 08:16:38 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031104071638.GA4126@brodo.de>
References: <BF1FE1855350A0479097B3A0D2A80EE0CC87F7@hdsmsx402.hd.intel.com>
	<m24qxk4y4h.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <m24qxk4y4h.fsf@tnuctip.rychter.com>
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
To: Jan Rychter <jan@rychter.com>
Cc: Mukesh Rajan <megabyte1024@hotmail.com>, cpufreq@www.linux.org.uk, linux-acpi <linux-acpi@intel.com>

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
dependand on the frequency setting. So even if it is no measurable effect on
one processor, this theory isn't true for all processors. And dynamic
power management should work best _for all processors_.

	Dominik
