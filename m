From: Jeroen van der Vegt <A.J.vanderVegt@ITS.TUDelft.nl>
Subject: Re: Dynamic frequency governor
Date: Sun, 19 Oct 2003 23:34:58 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1066599298.1401.13.camel@localhost>
References: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
	<1066453236.7590.4.camel@ixodes.goop.org>  <3F90D694.5020702@uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3F90D694.5020702@uci.edu>
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
To: Vivek Haldar <vhaldar@uci.edu>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, cpufreq list <cpufreq@www.linux.org.uk>

And I just wrote a first public version of yet another similar tool,
Slowmotion: http://atlas.et.tudelft.nl/ajvdvegt/laptop/slowmotion.tgz

It only uses speeds available on your platform. It the algorithm tries
to match CPU-speed to CPU-load: at 0% load, it'll go to lowest speed, at
full load to highest speed. At e.g. 50% cpu-load, it'll go to the speed
right in the middle between min. speed and max. speed.
It hasn't really surpassed the 'works for me' phase though. ;)

I didn't know about the other two programs mentioned either :(

Jeroen.

Op za 18-10-2003, om 07:58 schreef Vivek Haldar:
> Jeremy Fitzhardinge wrote:
> 
> >On Fri, 2003-10-17 at 14:14, Moore, Robert wrote:
> >  
> >
> >>Hi all,
> >>
> >>I've been chartered to implement a multi-state algorithm for Linux;
> >>this will be a new governor that adjusts the CPU frequency based upon
> >>percent CPU utilization as reported from the kernel idle handler.
> >>
> >>Has any work been done (or is being done) in this area?  I don't want to
> >>rewrite the wheel.
> >>    
> >>
> >
> >Speedfreq (http://www.goop.org/~jeremy/speedfreq) does this in
> >userspace.  I'm not sure there's much win in putting it into the kernel,
> >but a better idle measurement would be nice (I use /proc/uptime, which
> >can only be reliably polled a couple of times a second).
> >
> I have a very similar tool called LAMP - 
> http://gandalf.ics.uci.edu/~haldar/lamp/ . I didn't know about your 
> program until this post.
> 
> I agree with you that this should be in user-space, not in kernel space.
> 
> Vivek.
> 
