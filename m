From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: wrong frequencies reported
Date: Sun, 25 Jul 2004 23:56:52 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040725215652.GA8746@dominikbrodowski.de>
References: <mailman.0.1090369064.29286.cpufreq@www.linux.org.uk>
	<Pine.LNX.4.60.0407251752390.1202@cobra.turtle.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0407251752390.1202@cobra.turtle.fr>
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
To: peetah_ml@club-internet.fr
Cc: cpufreq@www.linux.org.uk

On Sun, Jul 25, 2004 at 06:00:45PM +0200, peetah_ml@club-internet.fr wrote:
> Hello,
> 
> During my migration to a 2.6.7 kernel, I've selected the speedstep-smi 
> driver for my laptop (Nec versa Vxi) with a pentium III 750Mhz ( sspec 
> SL53P) and a 440MX chipset. But the frequencies reported in 
> /sys/devices/system/cpu/cpu0/cpufreq are wrong: max frequency is 4Mhz 
> whereas min frequency is 0 Mhz
> 
> I googled a bit to find out why this is happenning, but i didn't find any 
> explanations or solutions. Therefore, I'm coming to the source.
> 
> Is this a known issue with old speedstep processors ?

No, definitely not. Can you uncomment  "//#define SPEEDSTEP_DEBUG" by
removing "//" in both 
arch/i386/kernel/cpu/cpufreq/speedstep-smi.c and
arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
, recompile, reboot, and send me the resulting dmesg, please?

Thanks,
	Dominik
