From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Mon, 9 Aug 2004 22:49:40 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809204940.GA10802@dominikbrodowski.de>
References: <4114D272.6070808@versanet.de>
	<20040807131432.GA8934@dominikbrodowski.de>
	<4114E9C1.8070409@versanet.de>
	<20040808175726.GA15268@dominikbrodowski.de>
	<4116A003.600@versanet.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4116A003.600@versanet.de>
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
To: Christian Heimanns <heimanns@versanet.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Sun, Aug 08, 2004 at 11:49:55PM +0200, Christian Heimanns wrote:
> >oh yes, the patch contained a brown paper bag bug. This new version is
> >also tested by me, so maybe it helps now.
> 
> Hmm.... I've compiled kernel-2.6.8-rc3-bk3 with your new version but no 
> changes for me. I'm able to 'modprobe acpi' now, but I still cannot 
> change the frequencies when connected to the power supply. If running on 
> battery it is possible. Is it possible that this is purposed by the 
> manufacturer?

It might be, though it wouldn't really make sense. After all, you don't want
an overheating notebook or a noisy notebook even when you have access to AC
power.

> The output of dmesg tells me nothing new:
> cpufreq: CPU0 - ACPI performance management activated.
> cpufreq: *P0: 3059 MHz, 0 mW, 500 uS
> cpufreq:  P1: 1019 MHz, 0 mW, 500 uS

... and the P1 state really tells us that some BIOS writer made a mistake:
it will be, most likely, the SL77P CPU which supports 3.06 GHz and 1.60 GHz
as speeds, but not 1.019 MHz [that'd be a strange multiplier, 1.912 ...
won't say that it's technically impossible, but nobody will do it that way.]

> I still have the feeling that there is something wrong with the 
> implementation of hyperthreading(HT). I mentioned a time ago that I use 
> my notebook with HT diabled in the BIOS and no SMP support in the 
> kernel. With HT enabled and SMP + HT support in the kernel my notebook 
> will freeze randomly. Don't ask me why....
Don't ask me, either. Don't have HT or SMP hardware myself, and it is most
likely not related to cpufreq.

> But ACPI tells me a little difference when I enable/disable HT support 
> in the BIOS:
> HT enabled: ACPI: Processor [CPU0] (supports C1, 8 throttling states)
> HT disabled: ACPI: Processor [CPU0] (supports C1 C2, 8 throttling states)
> 
> Throttling works fine as far as I know under both conditions. When HT is 
> disabled CPU power management seems also to work (switching between C1 
> and C2).

No surprise here; power management becomes complicated in the SMP (even HT)
case. And as some legacy OSes have trouble with some variants, P-States are
usually disabled if HT is enabled...

> I've also checked the INTEL documentation (25302804.pdf), 
> Mobile Intel(R) Pentium(R) 4 Processor with 533 MHz System Bus 
> Datasheet. Is it possibele that the CPU reports as a Mobile CPU but 
> doesn't support frequency and voltage scaling?

Doubt it. Check 25317607.pdf instead, table 2 on page 8 contains your CPU, I
guess...

Back to the original problem: pstate_cnt doesn't work, disabling irqs
doesn't work... I'm running out of ideas at the moment. Hopefully new ideas
will appear soon... in the meantime, could you send a lspci [no additional 
options needed] again, please?

Thanks,
	Dominik
