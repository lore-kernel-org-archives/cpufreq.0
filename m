From: GoatZilla <goatzilla@gmail.com>
Subject: Re: cpu-freq question
Date: Sat, 4 Sep 2004 12:11:26 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <39e3484804090410116708afef@mail.gmail.com>
References: <Pine.LNX.4.60.0409041421450.18816@alpha.polcom.net>
Reply-To: GoatZilla <goatzilla@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.60.0409041421450.18816@alpha.polcom.net>
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
To: cpufreq@www.linux.org.uk

There a patch by Harald Milz somewhere in the mailing list which you
can apply to manually specify a PST entry.  It still needs a little
extra modification if your bios is COMPLETELY lacking in any support.

As far as voltage changes, you probably won't be able to change
voltage on the fly because this requires a little extra circuitry on
the motherboard.  Also, you have to be careful about the startup
voltage because the VID values between desktop and mobile CPU's do not
mean the same thing.  For example, the VID code for a mobile athlon
for 1.45V is 01011.  But on a desktop VRM, 01011 will produce 1.575V.





On Sat, 4 Sep 2004 14:22:59 +0200 (CEST), Grzegorz Kulewski
<kangur@polcom.net> wrote:
> [Please CC me]
> 
> Hi,
> 
> I have desktop board KG7-Lite with Athlon Thunderbird 1.0GHz. It has AMD 761
> northbidge that probably supports PowerNow. I want to upgrade the CPU to Athlon
> Barton Mobile 2400+ (1.45V). But unfortunatelly the last BIOS for this board
> does not support "officially" mobile processors. So I do not know if it has any
> "BIOS supplied tables to obtain frequency". But I know what voltage and
> multiplier I need (want to set). Is there any way to set this without BIOS
> support? Is there any way to add support to the BIOS?
> 
> I want to do this because of the following reasons:
> - this board officially supports only 13x and bellow multipliers so 2000+
> normal desktop Athlons (out of the market in Poland)
> - Mobile Bartons have 512 KB L2 :) and FSB 266 and unlocked multiplier - I can
> set it to 13x or 12x in BIOS and then scale from Linux
> - 1.45V instead of 1.65V - less heat
> - I want to be able to dynamically scale the speed and power consumption and
> heat to meet the current needs of CPU power in my system
> 
> Is there any way to make it work?
> 
> Thanks,
> 
> Grzegorz Kulewski
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
