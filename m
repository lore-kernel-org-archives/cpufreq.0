From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 15:26:35 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129142635.GB25416@poupinou.org>
References: <20040129123955.GZ25416@poupinou.org>
	<20040129104119.5AFAB3F60@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040129104119.5AFAB3F60@latitude.mynet.no-ip.org>
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
To: Anders Eriksson <aeriksson2@fastmail.fm>
Cc: cpufreq@www.linux.org.uk

On Thu, Jan 29, 2004 at 11:40:59AM +0100, Anders Eriksson wrote:
> Ducrot Bruno <ducrot@poupinou.org> said:
> > > > If you allow a non-speedstep capable processor, and if
> > > > you use the speedstep-ich driver, this will likely
> > > > freeze the system no matter what.
> > > > 
> > > -ich. ? Do you mean -smi? That's the one I use...
> > 
> > And?  This code is shared with *all* speedstep drivers.
> > 
> 
> I know the detection code is shared. I assumed that the failure modes
> might be different for the different divers. I.e. a mis-detected cpu
> using the ich driver might cause a hang, while a mis-detected cpu on
> the -smi driver might cause a small fire, be undetected, whatever.
> Maybe that's a wromng assumption.

The fact that a mis-detected cpu in the ich case introduce a freeze
of a system is enough to not include your patch in this form, no matter
if it is safe (and I believe that it is the case) in the smi case.

> > > Anyway, I guess I can conclude that i do have a speedstep capable box.
> > > If we can get feedback from others (e.g. visyz) indicating that this
> > > test may need to be relaxed/fixed/whatever a bit for different boxes,
> > > would a CONFIG_CPUFREQ_ANCIENT_SPEEDSTEP patch & option which
> > > captures that be adopted?
> > 
> > Make sense, but I know that such system already exist...
> > 
> Not sure I follow here. Which system are you referring to?

Systems that support SMI call, but do not pass the speedstep capabilty
check.  There is even one that do not support the int15 check, that
do not pass the speedstep capabitility check, but speedstep-smi driver
work.

Therefore, there is no need to get feedback for this particular point,
because it is already well known (at least by me) and I must admit
that I should have fixed, and documented, this problem (my fault,
my big fault, sorry)...

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
