From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Help! Cpufreq makes my laptop crash!
Date: Wed, 14 Jul 2004 14:09:44 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040714140944.g0k8c40swcskss8g@carlthompson.net>
References: <40F549D5.8030100@fuckup.homelinux.com>
	<20040714115717.4gsocksks0s8o4wc@carlthompson.net>
	<40F58B6C.60606@fuckup.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <40F58B6C.60606@fuckup.homelinux.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: olgaAr <olgaAr@fuckup.homelinux.com>
Cc: cpufreq@www.linux.org.uk


Try my CPUSpeed program and see if it works better for you:

    http://carlthompson.net/software/cpuspeed

Sometimes older mobile Athlons have problems.  Supposedly a workaround is
in CPUFreq but maybe it doesn't work right in your case. CPUSpeed has a
workaround that might work if this is the problem.

Carl Thompson

Quoting olgaAr <olgaAr@fuckup.homelinux.com>:

> Carl Thompson wrote:
>
>>
>> What type of computer is this?  Can you attach the relevant lines in dmesg
>> that begin with "powernow:" ?  Are you only manually setting the speed or
>> using a program such as cpuspeed, powernowd, etc?  at what speed(s) will
>> the computer crash?  All speeds except the max?  Only the lowest?
>>
>> Thanks,
>> Carl Thompson
>>
>>
>> Quoting olgaAr <olgaAr@fuckup.homelinux.com>:
>>
>>> Hello all,
>>>
>>> I hope someone out there can help me with my problem which I've been
>>> playing around for quite some time now:
>>> I have enabled cpufreq and powernow support in my 2.6.7-gentoo-r6
>>> kernel, and everything works fine so far. I can manually switch between
>>> different CPU frequencies, my battery all of a sudden lasts longer than
>>> 50 minutes, and I'm happy...
>>> After some time, however, the system will simply freeze! It can't even
>>> be pinged from outside any longer! The log files also don't give a hint
>>> about what might cause the lockups. If, however I tell cpufreq to run my
>>> cpu at maximum frequency, it runs fine for hours. So what's the deal?
>>> What causes my lappie to crash when trying to save power?
>>>
>>> cpuinfo says this:
>>> processor       : 0
>>> vendor_id       : AuthenticAMD
>>> cpu family      : 6
>>> model           : 8
>>> model name      : mobile AMD Athlon(tm) XP 1800+
>>> stepping        : 0
>>> cpu MHz         : 1526.282
>>> cache size      : 256 KB
>>> fdiv_bug        : no
>>> hlt_bug         : no
>>> f00f_bug        : no
>>> coma_bug        : no
>>> fpu             : yes
>>> fpu_exception   : yes
>>> cpuid level     : 1
>>> wp              : yes
>>> flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
>>> cmov pat p
>>> se36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
>>> bogomips        : 3006.46
>>>
>>> and here's lspci, just in case:
>>> 0000:00:00.0 Host bridge: VIA Technologies, Inc. P/KN266 Host Bridge
>>> 0000:00:01.0 PCI bridge: VIA Technologies, Inc. VT8633 [Apollo Pro266 AGP]
>>> 0000:00:09.0 CardBus bridge: ENE Technology Inc CB1410 Cardbus Controller
>>> 0000:00:0a.0 Network controller: Intel Corp.: Unknown device 1043 (rev 04)
>>> 0000:00:0b.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394 Host
>>> Controller (rev 80)
>>> 0000:00:10.0 USB Controller: VIA Technologies, Inc. USB (rev 80)
>>> 0000:00:10.1 USB Controller: VIA Technologies, Inc. USB (rev 80)
>>> 0000:00:10.3 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 82)
>>> 0000:00:11.0 ISA bridge: VIA Technologies, Inc. VT8235 ISA Bridge
>>> 0000:00:11.1 IDE interface: VIA Technologies, Inc. VT82C586/B/686A/B
>>> PIPC Bus Master IDE (rev 06)
>>> 0000:00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233
>>> AC97 Audio Controller (rev 50)
>>> 0000:00:11.6 Communication controller: VIA Technologies, Inc. Intel 537
>>> [AC97 Modem] (rev 80)
>>> 0000:00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102
>>> [Rhine-II] (rev 74)
>>> 0000:01:00.0 VGA compatible controller: S3 Inc. VT8751 [ProSavageDDR
>>> P4M266] VGA Controller
>>>
>>> Sorry for the lengty mail, I just wanted to provide all details needed
>>> in advance.
>>>
>>> Thank you very much in advance!
>>> Oliver Gmelch
>>>
>>>
>>> _______________________________________________
>>> Cpufreq mailing list
>>> Cpufreq@www.linux.org.uk
>>> http://www.linux.org.uk/mailman/listinfo/cpufreq
>>
>>
>>
>>
>>
>>
>> _______________________________________________
>> Cpufreq mailing list
>> Cpufreq@www.linux.org.uk
>> http://www.linux.org.uk/mailman/listinfo/cpufreq
>>
> Hello Carl,
> Thank you for your reply. Looks like I have forgotten the most important
> facts... Well, however, here they are:
>
> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: FSB: 132.720 MHz
> powernow: Found PSB header at c00f0e40
> powernow: Table version: 0x12
> powernow: Flags: 0x0 (Mobile voltage regulator)
> powernow: Settling Time: 100 microseconds.
> powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
> powernow: PST:0 (@c00f0e50)
> powernow:  cpuid: 0x780 fsb: 133        maxFID: 0x1     startvid: 0x9
> powernow:    FID: 0x4 (5.0x [663MHz])   VID: 0x19 (1.050V)
> powernow:    FID: 0x6 (6.0x [796MHz])   VID: 0x19 (1.050V)
> powernow:    FID: 0x7 (6.5x [862MHz])   VID: 0x17 (1.100V)
> powernow:    FID: 0x8 (7.0x [929MHz])   VID: 0x15 (1.150V)
> powernow:    FID: 0x9 (7.5x [995MHz])   VID: 0x13 (1.200V)
> powernow:    FID: 0xa (8.0x [1061MHz])  VID: 0x11 (1.250V)
> powernow:    FID: 0xb (8.5x [1128MHz])  VID: 0xe (1.300V)
> powernow:    FID: 0xc (9.0x [1194MHz])  VID: 0xd (1.350V)
> powernow:    FID: 0xd (9.5x [1260MHz])  VID: 0xc (1.400V)
> powernow:    FID: 0xe (10.0x [1327MHz]) VID: 0xb (1.450V)
> powernow:    FID: 0xf (10.5x [1393MHz]) VID: 0xa (1.500V)
> powernow:    FID: 0x1 (11.5x [1526MHz]) VID: 0x9 (1.550V)
> powernow: SGTC: 13333
> powernow: Minimum speed 663 MHz. Maximum speed 1526 MHz.
>
> So it is a AMD Athlon XP mobile 1800+
>
> I am currently using speedfreq to control the cpuspeed. As it seems, the
> only time it doesn't hang up after a certain period of time is when it
> is using max speed (speedfreq -p 1525 does the trick)
>
> Thanks,
> Oliver Gmelch
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
