From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: how to get Pentium 4 multiplier
Date: Thu, 10 Jun 2004 17:19:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610151959.GA7973@dominikbrodowski.de>
References: <3ACA40606221794F80A5670F0AF15F8403BD553A@pdsmsx403>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3ACA40606221794F80A5670F0AF15F8403BD553A@pdsmsx403>
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
To: "Zhu, Yi" <yi.zhu@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Thu, Jun 10, 2004 at 05:24:45PM +0800, Zhu, Yi wrote:
> Dominik Brodowski wrote:
> > On Thu, Jun 10, 2004 at 01:55:13PM +0800, Zhu, Yi wrote:
> >> I compiled my 2.6.7-rc3 kernel with SPEEDSTEP_DEBUG and dmesg gives:
> >> 
> >> speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xa201f000 0x0
> >> speedstep-lib: P4 - FSB 100000 kHz; Multiplier 162
> >> 
> >> You can find more detailed information here:
> >> http://bugme.osdl.org/show_bug.cgi?id=2754
> > 
> > Hm, these are the first (two) reports of invalid entries in
> > MSR_EBC_FREQUENCY_ID for p4(m)s -- on many other systems
> > (including but not limited to my own) it works fine... 
> 
> The P4M machine in the bug report and my own P4 desktop have the
> problem. So the MSR method is broken.

... or there's the need for a workaround for these systems where the MSR is
broken.

> > maybe this is limited to the D stepping?
> 
> What's that?

D0 core stepping of Pentium 4 (desktop). AFAICS, that's the stepping of your
desktop CPU.

> > Problem is string parsing is ugly, some P4 processors print
> > their speed, IIRC, in MHz, others in GHz, etc.
> 
> String parsing is ugly, but it is better than doing it wrong. MHz and
> GHz won't be that big problem, right? And I saw recent patch tries
> to find Mobile P4 in the string...

... only because Intel decided to use the same CPUID for Celerons and
Pentium-4-Ms -- and, thus, does not provide for any way _without string
parsing_ to determine whether a CPU is speedstep-capable or not...

> > For the p4-clockmod case, we might go back using cpu_khz for
> > determining current CPU frequency
> 
> This is the case reported in the bugzilla. When will this happen?

Depends on the timeframe p4-clockmod will be removed from the kernel...

> >  -- and for speedstep-ich
> > and the p4-m problem reported in the bug, I'd like to get more debug
> > info 
> 
> Sure. I had the machine with me now. I can provide whatever you want.

On that bugreporter's system, some additional things are strange:

model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 1.70GHz
cpu MHz         : 2358.487

Other than that, it looks to me the speed being reported as 1.2 GHz might be
caused by an invalid detection of 400 MHz FSB instead of 533 MHz FSB?

	Dominik
