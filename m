From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 10:59:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041018085910.GB26364@dominikbrodowski.de>
References: <20041017222916.GA30841@inskipp.digriz.org.uk>
	<20041018072045.GA17164@dominikbrodowski.de>
	<20041018082508.GB3311@inskipp.digriz.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041018082508.GB3311@inskipp.digriz.org.uk>
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
To: Alexander Clouter <alex-kernel@digriz.org.uk>
Cc: cpufreq@www.linux.org.uk

On Mon, Oct 18, 2004 at 09:25:08AM +0100, Alexander Clouter wrote:
> > > 2. controllable through 
> > > 	/sys/.../ondemand/ignore_nice, you can tell it to consider 'nice' 
> > > 	time as also idle cpu cycles.  Set it to '1' to treat 'nice' as cpu 
> > > 	in an active state.
> > 
> > Interesting bit, IIRC some userspace tool also does that.
> > 
> if I recall they have to munch through the whole of /proc to get this 
> information; then again there is probably a clean and fast way of pulling 
> those time values from /proc that I do not know of.

cat /proc/stat should be sufficient to get _all_ nice ticks, if you want to
only be aware of nice>SOME_THRESHOLD it gets much trickier, and that would
be even worse in kernel space, AFAICS.

> > > 6. debugging (with 'watch -n1 cat /sys/.../ondemand/requested_freq') and 
> > > 	backwards 'compatibility' to act like the 'userspace' governor is 
> > > 	avaliable with /sys/.../ondemand/requested_freq if 
> > > 	'freq_step_percent' is set to zero
> > 
> > Please don't do that. Userspace is the governor for userspace frequency
> > setting; if you want it, switch to userspace, if you want dynamic frequency
> > selection, use the original ondemand or your governor.
> > 
> I thought a few people would grumble about that.  I needed a way to store the 
> variable speed knob and that struct was the best place for it; looks like me 
> tarting it up as a 'debugging' feature was not good enough :)

No, definitely not :-)

	Dominik
