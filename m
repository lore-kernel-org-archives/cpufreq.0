From: John Clemens <john@deater.net>
Subject: Re: powernow-k7, something broke in -test3?
Date: Sat, 16 Aug 2003 01:24:58 -0400 (EDT)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0308160115110.27055-100000@pianoman.cluster.toy>
References: <Pine.LNX.4.44.0308102141570.4848-100000@pianoman.cluster.toy>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.44.0308102141570.4848-100000@pianoman.cluster.toy>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk


Hi Dave,

The following patch corrects a minor think-o in your powernow-k7 changes
that went into 2.6.0-test3, and was causing the behavior below.  I don't
think you meant to cache the cfid value before you actually read it in :)
this was causing all speed notifications to think my previous multiplier
was fid_codes[0] (11.0x), and thus screws up loops_per_jiffy, etc..

john.c

diff -urN linux-vanilla/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- linux-vanilla/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-08-16 01:05:54.000000000 -0400
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-08-16 01:12:09.000000000 -0400
@@ -230,8 +230,8 @@

 	freqs.cpu = 0;

-	cfid = fidvidstatus.bits.CFID;
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
+	cfid = fidvidstatus.bits.CFID;
 	freqs.old = fsb * fid_codes[cfid] * 100;
 	freqs.new = powernow_table[index].frequency;




On Sun, 10 Aug 2003, John Clemens wrote:

>
> powernow-k7's been running fine for me for a while... and it still seems
> to work, but /proc/cpuinfo seems to suddenly be reporting weird results
> since i upgraded from 2.5.75 to 2.6.0-test3 yesterday.  Any ideas? I'm
> guessing this is cosmetic as my system still runs, but running the UAE
> emulator seemed a bit sluggish today.. but that's probably my
> imagination.
>
> The numbers work out to something thinking i have ~77Mhz bus and not a
> 100Mhz one.
>
> john.c -- whose starting to believe he's seeing things.
>
> Here's a script output session:
>
> Script started on Sun Aug 10 21:37:51 2003
> root@diana:/usr/src# dmesg | grep powernow
> powernow: AMD K7 CPU detected.
> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: Found PSB header at c00f7ab0
> powernow: Table version: 0x12
> powernow: Flags: 0x0 (Mobile voltage regulator)
> powernow: Settling Time: 100 microseconds.
> powernow: Has 14 PST tables. (Only dumping ones relevant to this CPU).
> powernow: PST:1 (@c00f7ad2)
> powernow:  cpuid: 0x761 fsb: 100        maxFID: 0xb     startvid: 0xc
> powernow:    FID: 0x10 (3.0x [300MHz])  VID: 0x11 (1.250V)
> powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0x11 (1.250V)
> powernow:    FID: 0x6 (6.0x [600MHz])   VID: 0xd (1.350V)
> powernow:    FID: 0x8 (7.0x [700MHz])   VID: 0xc (1.400V)
> powernow:    FID: 0xb (8.5x [850MHz])   VID: 0xc (1.400V)
> powernow: Minimum speed 300 MHz. Maximum speed 850 MHz.
> root@diana:/usr/src# cat /proc/cpuinfo | grep MHz
> cpu MHz         : 656.600
> root@diana:/usr/src# cd /sys/devices/system/cpu/cpu0/cpufreq/
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_governor
> userspace
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_setspeed
> 850000
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# echo "300000" >
> scaling_setspeed
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_setspeed
> 300000
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# cat /proc/cpuinfo | grep
> MHz
> cpu MHz         : 231.741
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# echo "600000" >
> scaling_setspeed
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# cat /proc/cpuinfo | grep
> MHz
> cpu MHz         : 463.482
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# echo "850000" >
> scaling_setspeed
> root@diana:/sys/devices/system/cpu/cpu0/cpufreq# cat /proc/cpuinfo |grep
> MHz
> cpu MHz         : 656.600
> Script done on Sun Aug 10 21:41:14 2003
>
> john.c
>
>

-- 
John Clemens          http://www.deater.net/john
john@deater.net     ICQ: 7175925, IM: PianoManO8
      "I Hate Quotes" -- Samuel L. Clemens
