From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] speedstep-centrino: Avoid returning zero freq on
	transient MSR values
Date: Fri, 10 Dec 2004 15:47:55 +0100
Message-ID: <20041210144754.GA8259@dominikbrodowski.de>
References: <20041209172436.A3337@unix-os.sc.intel.com>
	<1102673495.18051.9.camel@minilith.goop.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1102673495.18051.9.camel@minilith.goop.org>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: davej@redhat.com, cpufreq list <cpufreq@www.linux.org.uk>

On Fri, Dec 10, 2004 at 02:11:35AM -0800, Jeremy Fitzhardinge wrote:
> On Thu, 2004-12-09 at 17:24 -0800, Venkatesh Pallipadi wrote:
> > 
> > 
> > On some CPUs, we can see transient MSR values (which are not present in _PSS) in
> > IA32_PERF_STATUS MSR, while CPU is doing some automatic P-state transition 
> > (like TM2). 
> > Current code will return frequency as 0 in such cases. Fix it by retrying the 
> > get after a delay and use lowest possible frequency as the current frequency 
> > in worst case.
> > 
> > Thanks to Matt Domsch for identifying and root-causing this failure.
> 
> Doesn't this suggest there's a more subtle problem?  If the CPU is
> changing speeds autonomously, then it means the TSC calibration will be
> broken.  Is there some way of finding out about these transitions?

The TSC runs at a fixed frequency on these CPUs [Venki will submit a patch
for that soon], so it isn't a problem for the kernel AFAICS.

> Also, why not just report the actual MSR frequency, rather than looking
> for a table/_PSS match?  Are the MSR values meaningfully encoded?

AFAIK, the encoding may be very chip specific.

Thanks,
	Dominik
