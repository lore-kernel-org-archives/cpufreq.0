From: Lee Revell <rlrevell@joe-job.com>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Mon, 05 Dec 2005 10:32:27 -0500
Message-ID: <1133796748.21641.8.camel@mindpipe>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
	<20051204183239.GE14247@wotan.suse.de>
	<1133725767.19768.12.camel@mindpipe>
	<20051205011611.GA12664@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051205011611.GA12664@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, cpufreq <cpufreq@www.linux.org.uk>, Andi Kleen <ak@suse.de>, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, 2005-12-04 at 20:16 -0500, Dave Jones wrote:
> On Sun, Dec 04, 2005 at 02:49:26PM -0500, Lee Revell wrote:
>  > On Sun, 2005-12-04 at 19:32 +0100, Andi Kleen wrote:
>  > > On Sun, Dec 04, 2005 at 05:43:35PM +0100, Dominik Brodowski wrote:
>  > > > On Fri, Dec 02, 2005 at 10:43:20AM -0800, Venkatesh Pallipadi wrote:
>  > > > > The patch below changes this to:
>  > > > > Show the last known frequency of the particular CPU, when cpufreq is present. If
>  > > > > cpu doesnot support changing of frequency through cpufreq, then boot frequency 
>  > > > > will be shown. The patch affects i386, x86_64 and ia64 architectures.
>  > > > 
>  > > > Looks good to me -- however, might this affect userspace cpufreq tools? I'd
>  > > 
>  > > They normally use /sys anyways.
>  > 
>  > Wrong, lots of userspace programs that need to know the CPU speed get it
>  > from /proc/cpuinfo.  It would be nice if there were a better API.
> 
> I can't think of a single valid reason why a program would want
> to know the MHz rating of a CPU. Given that it's a) approximate,
> b) subject to change due to power management, c) completely nonsensical
> across CPU vendors, and d) only one of many variables regarding CPU
> performance, any program that bases any decision on the values found
> by parsing that field of /proc/cpuinfo is utterly broken beyond belief.

JACK needs to know the CPU speed in order to be able to use RDTSC for
timing.  Yes that might be "broken" but gettimeofday() is simply not
fast enough for our use, we can't afford the overhead of thousands of
system calls per second.  And until recently 99.999% of desktop machines
had a monotonic TSC so this worked very well.

I don't see how people can say that gettimeofday() is as fast as the
hardware allows, when gettimeofday() just uses RDTSC to interpolate
since the last timer tick but is ~40x slower than RDTSC on my system.

Lee
