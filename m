From: Christian Heimanns <heimanns@versanet.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Sun, 08 Aug 2004 23:49:55 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4116A003.600@versanet.de>
References: <4114D272.6070808@versanet.de>
	<20040807131432.GA8934@dominikbrodowski.de>
	<4114E9C1.8070409@versanet.de>
	<20040808175726.GA15268@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040808175726.GA15268@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>

> oh yes, the patch contained a brown paper bag bug. This new version is
> also tested by me, so maybe it helps now.

Hmm.... I've compiled kernel-2.6.8-rc3-bk3 with your new version but no=20
changes for me. I'm able to 'modprobe acpi' now, but I still cannot=20
change the frequencies when connected to the power supply. If running on=20
battery it is possible. Is it possible that this is purposed by the=20
manufacturer?

The output of dmesg tells me nothing new:
cpufreq: CPU0 - ACPI performance management activated.
cpufreq: *P0: 3059 MHz, 0 mW, 500 uS
cpufreq:  P1: 1019 MHz, 0 mW, 500 uS

I still have the feeling that there is something wrong with the=20
implementation of hyperthreading(HT). I mentioned a time ago that I use=20
my notebook with HT diabled in the BIOS and no SMP support in the=20
kernel. With HT enabled and SMP + HT support in the kernel my notebook=20
will freeze randomly. Don't ask me why....

But ACPI tells me a little difference when I enable/disable HT support=20
in the BIOS:
HT enabled: ACPI: Processor [CPU0] (supports C1, 8 throttling states)
HT disabled: ACPI: Processor [CPU0] (supports C1 C2, 8 throttling states)

Throttling works fine as far as I know under both conditions. When HT is=20
disabled CPU power management seems also to work (switching between C1=20
and C2). I've also checked the INTEL documentation (25302804.pdf),=20
Mobile Intel(R) Pentium(R) 4 Processor with 533 MHz System Bus=20
Datasheet. Is it possibele that the CPU reports as a Mobile CPU but=20
doesn't support frequency and voltage scaling? I won't open the notebook=20
to do a 100 percent check what kind of CPU really is build in....

I appreciate your support and help
thanks,

Christian

--=20
---
Christian Heimanns
heimanns@versanet.de

### Pinguine k=F6nnen nicht fliegen
- Pinguine st=FCrzen auch nicht ab! ###
