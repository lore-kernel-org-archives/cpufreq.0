From: Dominique De Munck <domin@ulyssis.org>
Subject: Re: Powernow-k7 hang on Acer Aspire 1304XC
Date: Sat, 26 Jul 2003 19:38:01 +0200 (CEST)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0307261921290.17801-100000@noa>
References: <Pine.LNX.4.44.0307261600280.15801-100000@noa>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.44.0307261600280.15801-100000@noa>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk


A little update :
my system seemed not to tolerate huge Frequency changes:
e.g. if going from 1666 MHz to 666MHz, system crashed.

So I wrote a script

http://domin.studentenweb.org/public/setPowerLevel.sh

that defines 5 PowerLevels for my XP 2000:

1 : 666  MHz
2 : 933  MHz
3 : 1199 Mhz
4 : 1466 Mhz
5 : 1666 Mhz

These frequency are the ones I could choose after some experiments with
the  "max-speed" sets.

The script only switches from one random frequency to the other in steps
of 1.
Using sudo and "xbindkeys", I can switch now by hand easy between
the different levels.


The powernow modules gets realy wrong information about my cpu however:

powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00e5100
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:0 (@c00e5110)
powernow:  cpuid: 0x781 fsb: 100        maxFID: 0x3     startvid: 0xb
powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xe (1.300V)
powernow:    FID: 0x8 (7.0x [700MHz])   VID: 0xe (1.300V)
powernow:    FID: 0xc (9.0x [900MHz])   VID: 0xe (1.300V)
powernow:    FID: 0x0 (11.0x [1100MHz]) VID: 0xc (1.400V)
powernow:    FID: 0x3 (12.5x [1250MHz]) VID: 0xb (1.450V)

2.4.21 kernel with  cpufreq-LINUX_2_4-20030628.tar.bz2 patch

but I got it working the way I wanted. Thanks for the nice work
on cpufreq everybody !


Dominique

PS : my sudo line:
koga    ALL = NOPASSWD : /home/koga/devel/scripts/setPowerLevel.sh



On Sat, 26 Jul 2003, Dominique De Munck wrote:

>
> I have and Aspire 1306LC with Athlon XP 2000 and got  the same problem
> as you. Whenever I use the "powersave" mode, my system immediatly
> hangs. But setting the max-freq, did the trick !
> Your experiences were incredibely helpfull to me !
>
> greets,
>
>
> Dominique
>
>
>
>
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
