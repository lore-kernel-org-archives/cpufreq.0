From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Pentium M and 2.4. kernel: does not work
Date: Sat, 16 Aug 2003 20:53:20 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030816185320.GA833@brodo.de>
References: <200308160043.30649.g_sauthoff@web.de> <20030815213028.GB1738@brodo.de> <200308161028.50976.g_sauthoff@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200308161028.50976.g_sauthoff@web.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georg Sauthoff <g_sauthoff@web.de>
Cc: cpufreq@www.linux.org.uk

On Sat, Aug 16, 2003 at 10:28:50AM +0200, Georg Sauthoff wrote:
> > So,
> > # echo -n "0%0%100%userspace" > /proc/cpufreq
>              ^^^^^^^^ What does this mean?

set the CPU 0  0%
to something between
                 0%
and                100%
and let the             userspace
governor decide which speed to use in between. It's much easier with the
2.6. sysfs interface -- one of the reasons I'm not really too excited about
the cpufreq backport for 2.4. [besides, I _only_ use 2.[56] kernels...]

> > first, then you can use the
> > /proc/sys/cpu/0/speed
> > file to set the CPU speed manually.
> 
> Hm, unfortunetly after I set the userspace governor (like above) the 
> /proc/sys/cpu/0/s* gives me 0 again ...
> 
> In the kernel logs I don't see any messages from cpufreq. Ok, after a very 
> quick look at the patch sources I don't see printk's there, too.

Probably a BUG I introduced in the latest backport. Hopefully I'll have
the time tomorrow to update it. In the meantime: what does /proc/cpufreq
tell?

	Dominik
