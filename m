From: Hendrik Muhs <Hendrik.Muhs@web.de>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Mon, 17 Jan 2005 16:21:52 +0100
Message-ID: <200501171621.52998.Hendrik.Muhs@web.de>
References: <20050114114656.GA8185@smooth.piipiip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
In-Reply-To: <20050114114656.GA8185@smooth.piipiip.net>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: Jarkko Lavinen <jlavi@iki.fi>

Hi,

> On Fri Oct 15, 2004 at 08:05:07, Hendrik Muhs wrote:
> > A new corrected patch is attached to this mail
>
> Many thanks for the XP-M patch.  I am using it on 2.6.9 and running
> XP-M at 1.1Vcore. The max cpu clock at this Vcore is about 1200MHz
> or multiplier 9 on 133MHz FSB.
>
> The patch assumes the CPU is running at the highest normal multiplier,
> that would be 14 cpu running at around 1800MHz. It then calculates
> the FSB frquency from cpu clock and the assumed multiplier.  As a result,
> a wrong FSB and frequencies are calculated.

Strange. If I understand it correctly, your BIOS lets you set the start 
multiplier but does not report it correctly.

(In my BIOS I can also set a start multiplier, but that does not work at all. 
The CPU is always started with the highest multiplier (supplied by the CPU))

Which motherboard do you have?

>
> For a quick remedy, I added a new module option "multiplier_limit" which
> limits the queried multiplier to no higher than the given limit.
>

Why not let the user specify the FSB? I mean if this is the issue, why do you 
take the multiplier? I would add a module option "fsb" instead.

BTW. Wasn't there another report recently about broken FSB detection on the 
list?

The mailinglist archives are broken, so I can not check it. The links in the 
pages are still refering to www.linux.org.uk instead of lists.linux.org.uk.

>   overwrite_table=1 multiplier=3,4,5,6,7,8,9 debug=1 multiplier_limit=9
>
>   powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
>   powernow: FSB: 135.405 MHz
>   powernow: Overwriting PST table with manual settings
>   powernow: Settling Time: 200 microseconds.
>   powernow:    FID: 0x10 (3.0x [406MHz])  VID: 0xb (1.450V)
>   powernow:    FID: 0x12 (4.0x [541MHz])  VID: 0xb (1.450V)
>   powernow:    FID: 0x4 (5.0x [677MHz])   VID: 0xb (1.450V)
>   powernow:    FID: 0x6 (6.0x [812MHz])   VID: 0xb (1.450V)
>   powernow:    FID: 0x8 (7.0x [947MHz])   VID: 0xb (1.450V)
>   powernow:    FID: 0xa (8.0x [1083MHz])  VID: 0xb (1.450V)
>   powernow:    FID: 0xc (9.0x [1218MHz])  VID: 0xb (1.450V)
>   powernow: Minimum speed 406 MHz. Maximum speed 1218 MHz.
>
> With this modification the FSB and CPU frequencies are repoted correctly.
> It would be better if the currently used multiplier could be detected
> without resorting to setting manual limit, though.

Yes, but as I said, I assume that your BIOS does not report it correctly. So I 
do not see a way to do this.

Anyway, I miss your patch. You have forgotten to attach it!

Regards,

Hendrik
