From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 17:48:52 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813154852.GK1372@poupinou.org>
References: <20030813135836.GA28615@via.ecp.fr> <20030813140443.GE1372@poupinou.org> <20030813141141.GB28615@via.ecp.fr> <20030813143221.GF1372@poupinou.org> <20030813145631.GA28850@via.ecp.fr> <20030813150357.GH1372@poupinou.org> <20030813152646.GA28995@via.ecp.fr> <20030813153043.GI1372@poupinou.org> <20030813153343.GJ1372@poupinou.org> <20030813154615.GA29077@via.ecp.fr>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030813154615.GA29077@via.ecp.fr>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Bilien <jobi@via.ecp.fr>
Cc: cpufreq@www.linux.org.uk

On Wed, Aug 13, 2003 at 05:46:15PM +0200, Johan Bilien wrote:
> On Wed, Aug 13, 2003, Ducrot Bruno wrote:
> > > Try this:
> > > 
> > > 
> > > --- linux-2.6.0-test3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003/08/13 15:27:22	1.1
> > > +++ linux-2.6.0-test3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003/08/13 15:28:36
> > > @@ -200,7 +200,7 @@
> > >  		 */
> > >  		rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
> > >  		dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", msr_lo, msr_hi);
> > > -		if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
> > > +		if ((msr_lo & (1<<18)) && (msr_lo & (3<<24))) {
> > >  			if (c->x86_mask == 0x01)
> > >  				return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
> > >  			else
> > > 
> > 
> > Grumble.  I should be tired or what..
> > 
> > Could you try to remove the if () actually?
> > I'm not sure if the latter is correct anyway.
> 
> Do you mean the whole if () {}, or just the if() ?
> And the if ((msr_hi ... )) or the (c->x86 ...) ?

I should be more precise.  Just the first if().  The
	if (c->x86_mask == 0x01)
		return ...
	else
		return ...

is needed..

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
