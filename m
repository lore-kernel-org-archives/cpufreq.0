From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Fri, 30 Jan 2004 10:25:35 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040130092535.GD25416@poupinou.org>
References: <20040129051600.GA6087@visyz.net>
	<20040129105041.GV25416@poupinou.org>
	<20040129202824.GA7866@visyz.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040129202824.GA7866@visyz.net>
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
To: visyz@visyz.net
Cc: cpufreq@www.linux.org.uk

On Thu, Jan 29, 2004 at 03:28:24PM -0500, visyz@visyz.net wrote:
> >From Ducrot Bruno on Thu, Jan 29, 2004 at 11:50:41AM +0100:
> > On Thu, Jan 29, 2004 at 12:16:00AM -0500, visyz@visyz.net wrote:
> > > So, I think I'm one of the 3 people in the world who have a Mobile
> > > Pentium III (Coppermine).
> > 
> > I receive more emails on this topics than 'two'...
> 
> Pardon the attitude. I was getting a bit angry at my laptop for not
> working with your speedstep systems. I didn't mean to come across quite
> like i did.

No problem.  I was frustated as you some times ago.  Fingers have their
own live, typing some wordings without any more control.
That happens to everyone, to me as well.

> > > Heh. Yeah. anyways. I have an HP Omnibook 4150B, which amounts to the
> > > aforementioned coppermine (with speeds from 233-450mhz), on a
> > > 440BX/ZX/DX bridge. I tried out the test program to see if it's usable,
> > > and while 1 bit did change, it was in GOP 0x0034, not 0x0038. Or maybe
> > > that's the other way around. Basically, the one that was supposed to
> > > change didn't, and the one that wasn't, did.
> > 
> > What program?  Mine?  Also are you sure you looked in the web page.
> > It's up to the manufacturer to *decide* what GPO to use.  So there
> > is *no* possibility to know the correct GPO pin.
> 
> The one available at http://www.poupinou.org/cpufreq/
> and yes, while I was reading around the website, I got the impression
> that the dumped logs were /not/ to be emailed to you directly anymore.

The speedstep-smi is much more safe than the speedstep-piix4, but
unfortunately the former do not work for one or two persons, so the page
about speedstep-piix4 is still here, and I have to maintain it
somehow still.  Note that speedstep-piix4 also may not work, there
is no warranty, it work for some systems, not all.  And I don't know
why.  Only Intel can say why.

That do not mean, though, that you can not send me the output
of speedstep-detect, because this program may help you to configure
speedstep-piix4 *and* speedstep-smi...

> At this point, I'm thinking I mixed up the various cpufreq pages I've
> been looking at.
> 
> If you're still interested in a fairly old laptop's speedstep, I'll
> follow the instructions on your page and send you the results later.

Go on, I'm waiting your output,

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
