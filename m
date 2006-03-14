From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: Re: p4_clockmod broken in 2.6.16-rc? kernels
Date: Tue, 14 Mar 2006 09:55:51 -0800
Message-ID: <20060314095551.A4913@unix-os.sc.intel.com>
References: <88056F38E9E48644A0F562A38C64FB60077E8338@scsmsx403.amr.corp.intel.com>
	<20060310054723.GC5600@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060310054723.GC5600@redhat.com>;
	from davej@redhat.com on Fri, Mar 10, 2006 at 12:47:23AM -0500
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, Mike Galbraith <efault@gmx.de>

On Fri, Mar 10, 2006 at 12:47:23AM -0500, Dave Jones wrote:
> On Thu, Mar 09, 2006 at 08:07:44PM -0800, Pallipadi, Venkatesh wrote:
>  > 
>  > Great to hear that the patch helped. I had a typo in the patch header
>  > and attaching an updated patch. 
>  > 
>  > Dave: Please push this patch towards base. This was a bug in one of the
>  > recent changes in p4-clockmod.c
> 
> Applied, thanks.  I fixed this one up by hand, but next time can you
> inline the patch instead of attaching it ?

Sorry for all the hassle. I wanted to send that patch out quick, before 2.6.16. 
And hence ended up sending it as an attachment using the dump mail client.

> btw, should acpi-cpufreq/speedstep-ich also have those errata workarounds?

No. These two errats seem specific to clock modulation and not speedstep. So,
no changes required for speedstep.

Looking at the workarounds in p4-clockmod.c again...
Seems like some more work is needed on this. The current workaround doesn't 
seem to cover all the affected steppings and also it is using int [NR_CPUS] 
array to store a single bit (whether error is present or not). I will send a 
follow-on cleanup patch, which I think can wait until 2.6.16.

Thanks,
Venki
> 
> Thanks.
> 
> 		Dave
> 
> [1] Actually this was even longer. Due to me missing chopping a MIME
> mailheader, it still confused git-apply, and I scratched my head
> for some time until Linus clued me in.  MIME- just say no!
> 
> -- 
> http://www.codemonkey.org.uk
