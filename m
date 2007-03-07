From: Len Brown <lenb@kernel.org>
Subject: Re: ondemand as default governor
Date: Wed, 7 Mar 2007 04:56:26 -0500
Message-ID: <200703070456.43347.lenb@kernel.org>
References: <1172770914.10619.587.camel@d36.suse.de>
	<20070307070208.GB15453@redhat.com>
	<20070307092506.GA20722@inskipp.digriz.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070307092506.GA20722@inskipp.digriz.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

On Wednesday 07 March 2007 04:25, Alexander Clouter wrote:
> Hi,
> 
> Dave Jones <davej@redhat.com> [20070307 02:02:08 -0500]:
> >
> > On Wed, Mar 07, 2007 at 01:24:28AM -0500, Len Brown wrote:
> >  > On Thursday 01 March 2007 12:41, Thomas Renninger wrote:
> >  > > I just read in drivers/cpufreq/Kconfig:
> >  > > 
> >  > > # Note that it is not currently possible to set the other governors
> >  > > (such as ondemand)
> >  > > # as the default, since if they fail to initialise, cpufreq will be
> >  > > # left in an undefined state.
> >  > > 
> >  > > Is this a bigger problem to solve?
> >  > > Is there already someone working/thinking on/about a solution?
> >  > > 
> >  > > Allowing this would be convenient...
> >  > 
> >  > Yes, it would, then we could delete the other governors,
> >  > and then delete the concept of multiple governors alltogether.
> > 
> > It's not feasible unless you have a way of making various
> > older CPUs transition faster.  Ondemand on longhaul,powernow-k6,longrun,
> > elanfreq, as well as lots of non-x86 implementations is just not
> > a feasible option.
> > 
> As a compromise I guess someone could make a patch that 'forces' 
> ondemand/conservative by default with a few '#ifdef's.  Slap a huge "we will 
> simply laugh at you if you complain this does not work" in the Kconfig help 
> section and everyones happy.  It should be a rather un-intrusive patch.
>
> > However.. conservative might be.  I'd still like to see conservative
> > folded into ondemand sometime, and just be a module param.
> > 
> This was originally touted as this but Dominik[1] suggested it would be a far 
> better use of the modular governor system if I forked a different governor 
> instead.  Also if you look at the current userland tools out there that tweak 
> the /sys/.../cpufreq/ settings you will find they really are all kitted out 
> to flip between completely different governors on system events rather than 
> sit on a particular one and tweak a few parameters when someone yanks the 
> power lead[2].

It isn't self-evident that AC/DC events merit swapping out the P-state policy.

> I would admit it looks and feel the kind of thing that should be run into a 
> single governor[3] but this would really muck around the userland tools as 
> they would have to be re-written to actually know the workings of each 
> particular governor rather than just being told "use this one when on AC and 
> this one when not".  It would clean up the kernel land forking, but the cost 
> to the userland side would be horrible.

The user-land tools are going to change over time anyway as
Linux actually gets a clue about run-time power management policies.

> [1] http://marc.theaimsgroup.com/?l=linux-kernel&m=109808470906084&w=2

Overdesigned for what it does.
There, I said it.
I'm not trying to offend, that is just how I see it.

> [2] this seems to be the main use for my governor, laptop users use ondemend 
> 	when on AC power and use something like the Debian laptop-mode-tools 
> 	package to flip to conservative when they unplug; I know I do

Why?
Have you measured better power and performance using conservative
vs ondemand.  Tools exist to give us hard data on this:

http://sourceforge.net/projects/bltk


> [3] as the conservative maintainer I just try to minimise the size of the 
> 	diff file produced between ondemand and conservative :)

good, that should make consolidating it easier.

thanks,
-Len
