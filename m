From: Holger Macht <hmacht@suse.de>
Subject: Re: ondemand as default governor
Date: Wed, 7 Mar 2007 22:09:11 +0100
Message-ID: <20070307210910.GC4872@homac2>
References: <1172770914.10619.587.camel@d36.suse.de>
	<200703070124.29058.lenb@kernel.org>
	<20070307070208.GB15453@redhat.com>
	<20070307092506.GA20722@inskipp.digriz.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20070307092506.GA20722@inskipp.digriz.org.uk>
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
To: Alexander Clouter <alex-kernel@digriz.org.uk>
Cc: cpufreq@lists.linux.org.uk

On Wed 07. Mar - 09:25:06, Alexander Clouter wrote:
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
> 
> I would admit it looks and feel the kind of thing that should be run into a 
> single governor[3] but this would really muck around the userland tools as 
> they would have to be re-written to actually know the workings of each 
> particular governor rather than just being told "use this one when on AC and 
> this one when not".  It would clean up the kernel land forking, but the cost 
> to the userland side would be horrible.

Well, but there are also userland tools which are heading into another
direction. The quite new CPUFreq addon which comes along with HAL tries to
go away from the modular governor system. It doesn't limit anyone to set
whichever governor is available, but ideally it encourages applications to
set one dynamic scaling governor such as ondemand. After setting the
governor, you have a scale between 1 and 100 which in turn just tweaks the
different settings of this one governor set. And in the long run,
distributions will have to use this mechanism if they like to use the most
common power management desktop applets out there (gnome-power-manager,
kpowersave, etc.).

[...]

Regards,
	Holger
