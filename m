From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: 2.4.21 Isn't working for me....
Date: Thu, 28 Aug 2003 11:34:56 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030828093456.GC382@poupinou.org>
References: <1061872616.27076.47.camel@localhost>
	<1061926909.14523.5.camel@localhost>
	<20030827155503.GR10585@poupinou.org>
	<1062016225.3951.2.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1062016225.3951.2.camel@localhost>
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
To: AthlonRob <AthlonRob@axpr.net>
Cc: cpufreq@www.linux.org.uk

On Wed, Aug 27, 2003 at 01:30:25PM -0700, AthlonRob wrote:
> On Wed, 2003-08-27 at 08:55, Ducrot Bruno wrote:
> 
> > Try this:
> > 
> > --- linux/drivers/cpufreq/userspace.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
> > +++ linux/drivers/cpufreq/userspace.c	27 Aug 2003 15:51:42 -0000
> 
> It compiled like a charm....
> 
> I haven't actually tested it yet, though, to see if it actually worked. 
> :-)
> 

I can't tell you so much.  You are using preempt and low-latency in
a SMP box, btw?  If really you need SMP, I can't tell you it will
be OK, just that you may have some dead lock unless you get the latest
one (which is not yet released completely for 2.4 tree).  Therefore,
it may be usefull if you compile with spinlock debug.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
