From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: speedstep capability checks
Date: Tue, 16 Mar 2004 16:01:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040316150148.GG28592@poupinou.org>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315210950.GC15243@redhat.com>
	<20040316073847.GA7597@dominikbrodowski.de>
	<20040316130114.GA13713@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040316130114.GA13713@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Arjan van de Ven <arjanv@redhat.com>, aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

On Tue, Mar 16, 2004 at 01:01:14PM +0000, Dave Jones wrote:
> On Tue, Mar 16, 2004 at 08:38:47AM +0100, Dominik Brodowski wrote:
> 
>  > So, Anders' CPU reports itself to be non-SpeedStep-capable. However,
>  > SpeedStep runs fine on his CPU. We can't enable SpeedStep on all CPUs [even
>  > of the same stepping (model/brand are the same anyway)] as we don't know if
>  > all of them work fine if running SpeedStep on them -- or if it causes
>  > (permanent) hardware failure! Some, who know it works from running a
>  > different OS, and possibly a specific vendor-provided driver on their
>  > notebook, might want to skip this test and try out their luck. But then they
>  > know what they're doing, and that they're risking their own hardware.
> 
> We've already seen quite a few confused users who thought that throttling == speedstep.
> This sounds like handing someone a gun and saying 'point it at your head,
> pull the trigger, it might miss'.
> 
>  > A few SpeedStep-capable systems don't perform according to specification: the
>  > CPUID and/or some MSRs don't tell us the CPU is SpeedStep capable even though
>  > it definitely is.
> 
> Is there nothing in the errata documents about this ?

There is nothing in any data sheets for the check anyway, other than
it's not possible to distinguish a PIII (coppermine) with Speedstep
technology from one without Speedstep technology.  There is nothing
in any spec update I'm aware.

There is only one solution from technical support from intel at
http://www.intel.com/support/processors/cs-003779-prd24.html and I'm not
sure how to get that page other than by searching it via the search
functionality of intel site.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
