From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: PowerNowd v.75
Date: 19 Jul 2003 01:35:14 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1058603714.22724.10.camel@ixodes.goop.org>
References: <Pine.LNX.4.44.0307171550430.2877-100000@pianoman.cluster.toy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.44.0307171550430.2877-100000@pianoman.cluster.toy>
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
To: John Clemens <john@deater.net>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Thu, 2003-07-17 at 12:58, John Clemens wrote:
> Yes, i released another cpufreq client daemon.  don't yell, i actually
> wrote it months ago when everyone else was just writing their's too :-).
> 
> It's simple, and just works very well for me.  I'm not trying to step on
> anyone's toes but i figured i wrote it so I may as well put it out there
> in case someone else finds it ueeful or wants to use some of the ideas in
> it.  not that it's rocket science...

This looks very similar in idea to speedfreq; my intention was to keep
things simple and make everyone else do the hard work of deciding what
policy to adopt.  It runs as a daemon, speedfreqd, but has a client
which can set new policies and also monitor state changes (either policy
changes or speed changes).  The client side is wrapped up into a
library, so it should be easy to use from other programs (gui interface,
etc).

For the "dynamic" policy, I simply calculate the amount of system idle
time by looking at /proc/uptime; I don't even bother looking at all the
processes.  It seems to work well enough, though it can't ignore niced
processes.

http://www.goop.org/~jeremy/speedfreq

	J
