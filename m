From: Davin Carter <davin.carter@wallst.com>
Subject: RE: Manual PST settings for "unrecognized CPUs"
Date: Tue, 17 Aug 2004 12:38:55 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <FE0E4E3EC4669A46A5D2E835957A9FFF169A0699@uranus.wallst.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: 'GoatZilla' <goatzilla@gmail.com>, "'cpufreq@www.linux.org.uk'" <cpufreq@www.linux.org.uk>

I was able to get a Mobile Athlon 2400 down to ~300 MHZ (the lowest
multiplier) without any problem.  Unfortuantely, my core voltage is 1.44
volts, there did not seem to be any power savings below 1000 MHZ with my
machine.

-----Original Message-----
From: GoatZilla [mailto:goatzilla@gmail.com] 
Sent: Tuesday, August 17, 2004 12:30 PM
To: cpufreq@www.linux.org.uk
Subject: Re: Manual PST settings for "unrecognized CPUs"

Ah, I just found your patch back in June; looks like good stuff.  I'll
give it a try when I get Linux onto my machine.

It's odd that you couldn't get below 9x on the multipliers.  With
CPUMSR I was able to take my Duron all the way down to 3x (I
underclocked the FSB as well to 100MHz).  The curious thing was it was
stable at 3x, locked up at 4x, and was stable again at 5x.  I would
think the core voltage that runs the CPU at full speed should be
acceptable at the lower speeds.

As far as the max FID is concerned, you've probably figured it out by
now, but the max FID that can be set by software is controlled by the
L6 bridges on the CPU package.








On Tue, 17 Aug 2004 08:26:34 +0200 (CEST), Harald Milz
<milz@seneca.muc.de> wrote:
> GoatZilla <goatzilla@gmail.com> wrote:
> > I saw a patch fly by a short while ago where a user added some
> > settings for an unrecognized config.  Is this the only way to hack in
> > a PST?
> 
> Actually there were (at least) two patches - Bruno's patch which
> implemented additional /proc fs entries to send frequency settings to, and
> mine which uses command line parameters for the powernow-k7 module. You
can
> find them in the ML archive. Internally, they do basically the same thing.
> Mine is a little inferior as far as sanity checks. But It Works For Me
> [TM].
> 
> Please be advised that you _could_ potentially fry your CPU if you use
them
> :-) But IMHO it's quite unlikely.
> 
> What these patches can't do is set the VID on most (?) desktop boards
> because of a lack of hardware support. But you should be able to lower the
> FID to a certain extent, and the power consumption is linearly
proportional
> to the frequency, after all.
> 
> --
> "Proper Preparation Prevents Poor Performance."
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq
