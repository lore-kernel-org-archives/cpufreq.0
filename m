From: Hilbert Mostert <hilbert.mostert@tadis.nl>
Subject: Re: Processor speed way above specs
Date: Mon, 13 Dec 2004 11:16:09 +0100
Message-ID: <200412131116.09939.hilbert.mostert@tadis.nl>
References: <200412102342.58060.hilbert.mostert@tadis.nl>
	<200412122056.33929.hilbert.mostert@tadis.nl>
	<20041212225556.GA8182@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041212225556.GA8182@dominikbrodowski.de>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

So basicly when i fix my ACPI tables it should be ok....

Well then i'll dig into ACPI dsdt files etc :) It is an ACER notebook and i 
think that because of WindBlows they did not do a lot of work in it :(
maybe I'm able to fix the interrupt problems also.

Thanks!

-Hilbert

On Sunday 12 December 2004 23:55, Dominik Brodowski wrote:
> On Sun, Dec 12, 2004 at 08:56:33PM +0100, Hilbert Mostert wrote:
> > Hi,
> >
> > It was running the acpi-cpufreq driver, I have fixed the problem
> > yesterday by using an other driver which i found on the web yesterday, it
> > was a driver for the intel pentium M 745 (1800MHz) and capped it at 1500,
> > and i have also changed the voltages according to the specs from intel.
> >
> > I'll try to compile a few kernels tomorrow and send you the output of the
> > performance file.
> >
> > Are there other reports of this with Intel Pentium M 715 chips?
>
> Yes, there was one other, don't remember which CPU it was. However, it
> _ususally_ means the .frequency entry in the ACPI table is incorrect. The
> CPU isn't really overclocked in that case, only a "sleep 1" won't put the
> system to sleep for one second. In very most cases, this is only a nuisance
> and not a problem.
>
>  Dominik
