From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [fwd] CPUFreq chokes on Sempron
Date: Sun, 9 Jan 2005 23:15:43 +0100
Message-ID: <20050109221543.GC27515@dominikbrodowski.de>
References: <m1oefyv94d.fsf@muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <m1oefyv94d.fsf@muc.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@muc.de>
Cc: cpufreq@www.linux.org.uk


> From: Matthew Trent <t3rmin@gmail.com>
> Subject: CPUFreq chokes on Sempron
> Date: Sun, 9 Jan 2005 00:09:01 -0800
> 
> When loading the powernow-k8 module on any recent kernel (I've tried
> 2.6.8 through 2.6.10) on my Sempron laptop, I see:
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09e)
> powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
> powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
> cpu_init done, current fid 0x8, vid 0x4
> powernow-k8: vid trans failed, vid 0x3, curr 0x4
> powernow-k8: transition frequency failed
> powernow-k8: vid trans failed, vid 0x3, curr 0x4
> powernow-k8: transition frequency failed
> 
> ... and many more of those 'vid trans failed' errors (one every time
> there's an attempted freq change).
> 
> There is a small patch available at...
> http://ubuntuforums.org/archive/index.php/t-3585.html
> ...which seems to fix the problem. Should this be included into the
> kernel officially?

It is already "queued" in Dave Jones' cpufreq bitkeeper tree for inclusion
into the mainline kernel, and thus is already in 2.6.10-mm2.

Thanks,
	Dominik
