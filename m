From: Thomas Renninger <trenn@suse.de>
Subject: Re: [stable] [PATCH] Make acpi-cpufreq more robust against BIOS
	freq changes behind our back
Date: Wed, 11 Jun 2008 16:33:14 +0200
Message-ID: <1213194794.6978.91.camel@queen.suse.de>
References: <482DCF52.6030307@awtrey.com>
	<20080519000810.GA11313@codemonkey.org.uk>
	<1211279939.21269.403.camel@queen.suse.de>
	<48341AB8.3090401@awtrey.com>
	<1211375286.29901.7.camel@queen.suse.de> <483443BE.9000002@awtrey.com>
	<20080602223617.GO30402@sequoia.sous-sol.org>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080602223617.GO30402@sequoia.sous-sol.org>
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
To: Chris Wright <chrisw@sous-sol.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk, Greg KH <gregkh@suse.de>, Stable <Stable@kernel.org>

On Mon, 2008-06-02 at 15:36 -0700, Chris Wright wrote:
> * Anthony L. Awtrey (tony@awtrey.com) wrote:
> > On 05/21/2008 09:08 AM, Thomas Renninger wrote:
> > > commit e56a727b023d40d1adf660168883f30f2e6abe0a
> > > Author: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
> > > Date:   Mon Apr 28 15:13:43 2008 -0400
> > > 
> > >     [CPUFREQ] Make acpi-cpufreq more robust against BIOS freq changes behind our back.
> > >     
> > >     We checked the hardware freq with OS cached freq value in get_cur_freqon_cpu().
> > >     
> > >     Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
> > >     Signed-off-by: Thomas Renninger <trenn@suse.de>
> > >     Signed-off-by: Dave Jones <davej@redhat.com>
> > > 
> > > diff --git a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
> > > index e2d870d..8db8f73 100644
> > > --- a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
> > > +++ b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
> > > @@ -339,6 +339,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
> > >  {
> > >  	struct acpi_cpufreq_data *data = per_cpu(drv_data, cpu);
> > >  	unsigned int freq;
> > > +	unsigned int cached_freq;
> > >  
> > >  	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
> > >  
> > > @@ -347,7 +348,16 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
> > >  		return 0;
> > >  	}
> > >  
> > > +	cached_freq = data->freq_table[data->acpi_data->state].frequency;
> > >  	freq = extract_freq(get_cur_val(&cpumask_of_cpu(cpu)), data);
>                                        -^-
> This does not apply cleanly to 2.6.25.4 (doesn't have commit: fc0e4748).
> 
> > I worked! This patch applied to 2.6.25.4 fixed the CPU stepping problem 
> > on the Panasonic CF-18 (Pentium M) I was having.
> 
> I suppose you manually applied the patch?
> 
> Anyway, I backported and will add to -stable, please holler if this is
> wrong.

Not sure where this one comes from, it was my original approach and
should only exist in the bugzilla entry, the git commit no. points to
another patch, the one you sent one hour later.
It is functionally the same, this can be ignored, the good one got
queued, everything should be fine.

   Thomas

P.S.: The patch got slightly cleaned up by Venkatesh.., I wonder whether
this justifies the author tag, but I do not care for this one, probably
was not intended or overseen when Dave committed the patch...
