From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Sun,  6 Jul 2003 10:43:05 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1057513385.41339271e1388@carlthompson.net>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr>
	<20030706012114.GW7796@poupinou.org>
	<1057511460.d2cf9bc12efe7@carlthompson.net>
	<20030706172809.GA10482@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030706172809.GA10482@localhost.localdomain>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

Quoting Jay Goodman Tamboli <jay@tamboli.cx>:

> ...

> Yeah, I found this in 2.4.21-ac4, too, and was having
> crashes.  Fixing this bug still causes lockups if I change
> the cpufreq too drastically.  Going from one setting to the
> next (i.e. not skipping any available speeds) seems to work
> ok, though.  This is a Sony FR130, so is this the effect of
> the PST problems discussed earlier?

No.  This is a problem I discovered a while back during testing of my CPU
speed setting daemon (see the list archives).  It's just that some CPUs /
chipsets require smooth rather than drastic transitions.  (In other words,
when switching from speed X to speed Y, you should switch to every speed in
between during the transition instead of directly.)  I believe only Mobile
AMD chips have this behavior.  I believe 2.5 has a fix in for this?  Also,
yy program automatically handles this for you when switching speeds; I will
definitely post a version today.

> /jgt

Carl Thompson
