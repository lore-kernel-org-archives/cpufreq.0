From: Anders Eriksson <aeriksson2@fastmail.fm>
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 11:40:59 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129104119.5AFAB3F60@latitude.mynet.no-ip.org>
References: <20040129123955.GZ25416@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Your message of "Thu, 29 Jan 2004 13:39:55 +0100."
	<20040129123955.GZ25416@poupinou.org> 
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
To: Ducrot Bruno <ducrot@poupinou.org>, visyz@visyz.net, cpufreq@www.linux.org.uk

Ducrot Bruno <ducrot@poupinou.org> said:
> > > If you allow a non-speedstep capable processor, and if
> > > you use the speedstep-ich driver, this will likely
> > > freeze the system no matter what.
> > > 
> > -ich. ? Do you mean -smi? That's the one I use...
> 
> And?  This code is shared with *all* speedstep drivers.
> 

I know the detection code is shared. I assumed that the failure modes
might be different for the different divers. I.e. a mis-detected cpu
using the ich driver might cause a hang, while a mis-detected cpu on
the -smi driver might cause a small fire, be undetected, whatever.
Maybe that's a wromng assumption.


> > Anyway, I guess I can conclude that i do have a speedstep capable box.
> > If we can get feedback from others (e.g. visyz) indicating that this
> > test may need to be relaxed/fixed/whatever a bit for different boxes,
> > would a CONFIG_CPUFREQ_ANCIENT_SPEEDSTEP patch & option which
> > captures that be adopted?
> 
> Make sense, but I know that such system already exist...
> 
Not sure I follow here. Which system are you referring to?

/Anders
