From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: PowerNowd v.75
Date: 20 Jul 2003 23:32:28 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1058769147.10397.8.camel@ixodes.goop.org>
References: <Pine.LNX.4.44.0307210029040.18644-100000@pianoman.cluster.toy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.44.0307210029040.18644-100000@pianoman.cluster.toy>
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

On Sun, 2003-07-20 at 21:58, John Clemens wrote:
> I still think parsing /proc/uptime to get a load average is the wrong
> heuristic to use.  load average is not cpu usage...

I know.  It isn't getting load average (which is in /proc/loadavg), but 
idle time.  The two numbers in /proc/uptime are seconds of uptime and
seconds of idle uptime.  By polling it, you can pretty easily work out
how idle the CPU was in your last poll interval.

>  That said i think you
> have a nice daemon there with some good ideas.  If you like, you are
> welcome to steal the /proc/stat parsing code from powernowd (which, in
> turn, was stolen mostly from procps).

I'll have a look at it.  It might be useful to do things like ignore
niced processes, but on the other hand, who runs seti@home on a battery
powered laptop?

>   It even supports SMP for when
> CPUfreq gets SMP capability... in theory :).

The cpufreq core supports SMP, but I don't know if any of the CPUs do. 
What is your policy for SMP?  Do you compute overall system use and then
set all the CPUs to some power state which can handle it, or try to work
out how busy each CPU is and power-control them separately?  

> I really don't have much of a desire or the time to make a complete
> product out of powernowd, but i thought it had some pretty cool ideas.  So
> I just cleaned it up a bit and released it.. to allow others like you to
> see those ideas and maybe get some use out of them.

I don't have much more to do with speedfreq, except I've been meaning to
hack of the existing gnome applets into extracting and displaying some
info.

	J
