From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [SPEEDSTEP] ALi shouthbridge.  alpha tester wanted.
Date: Tue, 11 Nov 2003 21:52:42 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031111205242.GP29175@poupinou.org>
References: <20031106140935.GC21970@poupinou.org>
	<20031111193200.GJ29175@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031111193200.GJ29175@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Tue, Nov 11, 2003 at 08:32:00PM +0100, Ducrot Bruno wrote:
> On Thu, Nov 06, 2003 at 03:09:35PM +0100, Ducrot Bruno wrote:
> > 
> > Can someone please test
> > ftp://ftp.poupinou.org/cpufreq/speedstep-ali.trunk.diff
> > 
> > Note that this is agaist 2.6.0-testX, not 2.4.
> > 
> 
> OK.  It do not work.  Sorry.
> 
> What it does is to turn on geyserville functionality on the PMU device,
> then, (I guess) we can use the geyserville IO register (at pmbase + 0x2f),
> as for the -ich case.  Unfortunately, that is wrong.  I don't
> know what to do next.  For people interrested in some registers that
> have to be looked, get ftp://ftp.poupinou.org/dont_use/README.ali

Grumble.  Just found a stupid bug.  Forget that email.  I still
don't know if that work, though.  Sorry for noise.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
