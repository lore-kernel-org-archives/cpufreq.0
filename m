From: John Clemens <john@deater.net>
Subject: Re: PowerNowd v.75
Date: Mon, 21 Jul 2003 00:58:53 -0400 (EDT)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0307210029040.18644-100000@pianoman.cluster.toy>
References: <1058603714.22724.10.camel@ixodes.goop.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <1058603714.22724.10.camel@ixodes.goop.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>


Hi Jeremy,

I still think parsing /proc/uptime to get a load average is the wrong
heuristic to use.  load average is not cpu usage... That said i think you
have a nice daemon there with some good ideas.  If you like, you are
welcome to steal the /proc/stat parsing code from powernowd (which, in
turn, was stolen mostly from procps).  It even supports SMP for when
CPUfreq gets SMP capability... in theory :).

I really don't have much of a desire or the time to make a complete
product out of powernowd, but i thought it had some pretty cool ideas.  So
I just cleaned it up a bit and released it.. to allow others like you to
see those ideas and maybe get some use out of them.

john.c

On 19 Jul 2003, Jeremy Fitzhardinge wrote:

> ....

> For the "dynamic" policy, I simply calculate the amount of system idle
> time by looking at /proc/uptime; I don't even bother looking at all the
> processes.  It seems to work well enough, though it can't ignore niced
> processes.
>
> http://www.goop.org/~jeremy/speedfreq
> 	J

-- 
John Clemens          http://www.deater.net/john
john@deater.net     ICQ: 7175925, IM: PianoManO8
      "I Hate Quotes" -- Samuel L. Clemens
