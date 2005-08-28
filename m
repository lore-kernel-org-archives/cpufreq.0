From: bernd.westermann@it-west.de
Subject: Re: powernow-k8: overflow on vid write on AMD64 3000 Venice
Date: Sun, 28 Aug 2005 11:44:56 +0200
Message-ID: <200508281144.56972.bernd.westermann@it-west.de>
References: <200508271748.21052.bernd.westermann@it-west.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200508271748.21052.bernd.westermann@it-west.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hello List,

problem solved. I patch the linux-2.6.12.5 kernel with the latest powernow-k8 
driver from AMD. It will be in 2.6.13 by default.

Bernd

Am Samstag, 27. August 2005 17:48 schrieb bernd.westermann@it-west.de:
> Hello List,
>
> powernow-k8 does not run on my AMD 64 3000 Venice CPU. If I try to set
> performance governor, I get the following error:
>
> powernow-k8: internal error - overflow on vid write
> powernow-k8: internal error - overflow on vid write
>
> Reason: He wants to set VID=0x6 but he gets maxvid=0x4 from
> MSR_FIDVID_STATUS. So it changed reqvid to 0x4 a nd I get these error.
>
> At the beginning powernow-k8 tells:
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.40.4)
> powernow-k8:    0 : fid 0xa (1800 MHz), vid 0x6 (1400 mV)
> powernow-k8:    1 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
> cpu_init done, current fid 0x9, vid 0x6
>
> After I hardcoded the maxvid to 0x6 all govenors running fine. Is there an
> wrong value in the processor core? Can we change something in powernow-k8?
>
> My System:
> CPU: AMD64 3000 Venice
> Mainboard: ECS nforce4-939
> Linux: Gentoo 2005.1 64bit
> Kernel: 2.6.12.5 (2.6.12-gentoo-r9)
>
>
> Best regards
>
> Bernd
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
