From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: oops on resume
Date: Thu, 5 Aug 2004 23:09:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040805210916.GB23087@dominikbrodowski.de>
References: <20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com>
	<pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Aug 05, 2004 at 04:19:30PM -0400, Brian J. Murrell wrote:
>  > >  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:2200000 1200000

This means speedstep_get_processor_frequency() works in the beginning -- else 
it wouldn't export these two (sane) values here.

> Interesting. http://processorfinder.intel.com/scripts/list.asp?ProcFam=826
> shows that this has a 400MHz FSB. speedstep_get_processor_frequency()
> doesn't support that, so that *could* be it. Although that should have
> triggered this message..

it's the quad-pumped 100MHz FSB which is as effictive as a 400MHz, so this
shouldn't be the problem.

> Might be useful, though right now, my bets are on an unknown FSB.
What do I win ;-) ?


My bet is that speedstep_get_processor_frequency() returns something 
between one and 100000 kHz instead of the proper value _only_ _upon_
_resuming_. So it'd be great if you could enable SPEEDSTEP_DEBUG in both
files mentioned above, re-test the "resume process", and tell us what the
lines right before the oops say.

Thanks,
	Dominik
