From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: 2.4.21 Isn't working for me....
Date: Wed, 27 Aug 2003 16:39:51 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030827143951.GP10585@poupinou.org>
References: <1061872616.27076.47.camel@localhost>
	<20030826064747.GE10585@poupinou.org>
	<1061927026.14523.9.camel@localhost>
	<20030826224727.GA14287@nsk.no-ip.org>
	<20030827111133.GK10585@poupinou.org>
	<20030827142908.GA5077@nsk.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030827142908.GA5077@nsk.no-ip.org>
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
To: Luciano Miguel Ferreira Rocha <strange@nsk.no-ip.org>
Cc: cpufreq@www.linux.org.uk, AthlonRob <AthlonRob@axpr.net>

On Wed, Aug 27, 2003 at 03:29:08PM +0100, Luciano Miguel Ferreira Rocha wrote:
> On Wed, Aug 27, 2003 at 01:11:33PM +0200, Ducrot Bruno wrote:
> > > I've been using that kernel, but can't get swsusp to work correctly and
> > > cpufreq doesn't work that well with my chipset, anyhow, (it's a 440BX,)
> > > so test it throughly.
> > 
> > What is the trouble with the 440BX?
> 
> Well, it's a lousy chipset, cpufreq wise.
> 
> I had it working with your help some time in the past, using a speedstep.c
> and playing with the GPO.
> 
> But that driver doesn't have the same interface as normal cpufreq and then
> 2.4.21 merged parts of the AC tree that makes my processor frequency very
> dynamic, so I end up not using it much.
> 
> But I tried the CVS version of cpufreq, but it still doesn't work.
> As it is, it doesn't have a speedstep.c, only a speedstep-ich, that
> fails to insert:
> cpufreq: Intel(R) SpeedStep(TM) for this chipset not (yet) available.

Oops, correct.  I forgot that one.  Sorry.
Should happens today.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
