From: Thomas Renninger <trenn@suse.de>
Subject: Re: ondemand as default governor
Date: Wed, 07 Mar 2007 10:20:39 +0100
Message-ID: <1173259239.12896.7.camel@g192.suse.de>
References: <1172770914.10619.587.camel@d36.suse.de>
	<200703070124.29058.lenb@kernel.org>
	<20070307070208.GB15453@redhat.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070307070208.GB15453@redhat.com>
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
Cc: cpufreq@lists.linux.org.uk

On Wed, 2007-03-07 at 02:02 -0500, Dave Jones wrote:
> On Wed, Mar 07, 2007 at 01:24:28AM -0500, Len Brown wrote:
>  > On Thursday 01 March 2007 12:41, Thomas Renninger wrote:
>  > > I just read in drivers/cpufreq/Kconfig:
>  > > 
>  > > # Note that it is not currently possible to set the other governors
>  > > (such as ondemand)
>  > > # as the default, since if they fail to initialise, cpufreq will be
>  > > # left in an undefined state.
>  > > 
>  > > Is this a bigger problem to solve?
>  > > Is there already someone working/thinking on/about a solution?
>  > > 
>  > > Allowing this would be convenient...
>  > 
>  > Yes, it would, then we could delete the other governors,
>  > and then delete the concept of multiple governors alltogether.
> 
> It's not feasible unless you have a way of making various
> older CPUs transition faster.  Ondemand on longhaul,powernow-k6,longrun,
> elanfreq, as well as lots of non-x86 implementations is just not
> a feasible option.
> 
> However.. conservative might be.  I'd still like to see conservative
> folded into ondemand sometime, and just be a module param.

I like the several governors concept in general, cpuidle also goes this
way now? I'd just like to see cpufreq working by simply loading the
drivers.
I thought I could just set ondemand as default and things work on most
machines, instead of fixing the setup in rescue, installation, whatever
environment.

Especially ThinkPads tend to run hot quite quickly...

   Thomas
