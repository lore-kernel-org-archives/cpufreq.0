From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] Eliminate cpufreq_userspace scaling_setspeed deadlock
Date: Wed, 21 Nov 2007 21:02:45 +0900
Message-ID: <20071121120245.GA4609@inferi.kami.home>
References: <20071026171821.GA20924@linux-os.sc.intel.com>
	<08DF4D958216244799FC84F3514D70F0B5555C@pdsmsx415.ccr.corp.intel.com>
	<20071107125638.GB27092@inferi.kami.home>
	<924EFEDD5F540B4284297C4DC59F3DEE15F13A@orsmsx423.amr.corp.intel.com>
	<20071120234132.GA9882@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20071120234132.GA9882@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: "Yu, Fenghua" <fenghua.yu@intel.com>, "Yu, Luming" <luming.yu@intel.com>, cpufreq <cpufreq@www.linux.org.uk>

On Tue, Nov 20, 2007 at 06:41:33PM -0500, Dave Jones wrote:
> On Wed, Nov 07, 2007 at 10:45:35PM -0800, Venki Pallipadi wrote:
>  >  
>  > 
>  > >-----Original Message-----
>  > >From: Mattia Dongili [mailto:malattia@linux.it] 
>  > >Sent: Wednesday, November 07, 2007 4:57 AM
>  > >To: Yu, Luming
>  > >Cc: Pallipadi, Venkatesh; Dave Jones; Yu, Fenghua; cpufreq
>  > >Subject: Re: [PATCH] Eliminate cpufreq_userspace 
>  > >scaling_setspeed deadlock
>  > >
>  > >On Mon, Nov 05, 2007 at 04:58:18PM +0800, Yu, Luming wrote:
>  > >> Based on my current testing results, this patch fixes my problem.
>  > >> Please help push it upstream.
>  > >
>  > >BTW, this will break some userspace apps. I can think of cpufrequtils
>  > >and some deamons that use the userspace governor to set frequencies.
>  > >
>  > 
>  > Yes. But, this is the only solution we have for the deadlock right now
>  > and I think it should goto upstream as soon as possible, unless we have
>  > some better alternative. Userspace breakage is better bargain than a
>  > kernel deadlock. Isn't it :-).
> 
> I'm torn over this patch.  I don't see a better way to fix this either,
> but the potential for breaking userspace is there. I think I'm going to
> merge this, and see how things go in -mm for a while.

I have to reconsider my words actually.
It's probably not breaking anything (AFAICT) as the scaling_setspeed
file will just sit there forever. In the beginning I thought the file
would move somewhere else but that is not the case.

No userspace chould rely on the presence of the file as an indicator of
which governor is being used so hopefully the patch will do much more
good than bad ;)

cheers
-- 
mattia
:wq!
