From: Thomas Renninger <trenn@suse.de>
Subject: Re: Core2Duo locked at 800MHz
Date: Tue, 27 Nov 2007 11:47:28 +0100
Message-ID: <1196160448.23251.21.camel@queen.suse.de>
References: <474A6C62.3070103@reinelt.co.at>
	<20071126190929.GE15764@redhat.com>  <474BB4F2.9040604@reinelt.co.at>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <474BB4F2.9040604@reinelt.co.at>
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
To: Michael Reinelt <michael@reinelt.co.at>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

On Tue, 2007-11-27 at 06:10 +0000, Michael Reinelt wrote:
> Hi Dave,
> 
> thanks for your answer!
> 
>  >  > When I boot the notebook into single-user mode
> >  > (using vanilla 2.6.23 or 2.6.24-rc3), with no modules loaded, the cpu 
> >  > runs at 2.4GHz. As soon as I laod the acpi-cpufreq module, the upper 
> >  > limit falls in some steps (2 GHz, 1200MHz) to 800 MHz. Note that there 
> >  > is neither acpid nor any powersave daemon running!
> > 
> > Do you have CONFIG_CPU_FREQ_GOV_ONDEMAND enabled in your kernel ?
> 
> Yes, but as a module.
> 
> >  > At the moment my workaround is *not* to load acpi-cpufreq, so the CPU 
> >  > stays at 2.4GHz all the time, but I really want to use powersaving with 
> >  > the machine....
> > 
> > I'm confused.  It sounds like you _are_ using power saving.
> > The whole purpose of cpufreq is to lower the cpu speed when idle.
> I _want_ to use powersaving, but I can't, because I'd be stuck at 800 MHz.
> 
> > If you run some cpu intensive load like a big compile, does the
> > speed go back up ?
> No, it does not.
> 
> > the cpufreq.debug=7 logs would be a good start.

It is probably limited through _PPC again.
Dave, Len: Can you please add the patch that _PPC changes are printed
with cpufreq.debug, pls.
I posted this a while ago on the cpufreq list:
Subject: [PATCH] Print _PPC changes via cpufreq debug layer
http://article.gmane.org/gmane.linux.kernel.cpufreq/5642

Thanks,

   Thomas
