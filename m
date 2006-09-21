From: Dave Jones <davej@redhat.com>
Subject: Re: writing a cpufreq driver
Date: Thu, 21 Sep 2006 16:44:02 -0400
Message-ID: <20060921204402.GA26683@redhat.com>
References: <20060921184833.GC1216@dbz.icequake.net>
	<20060921193141.GE17065@redhat.com>
	<20060921200851.GF2364@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060921200851.GF2364@dbz.icequake.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Underwood <nemesis@icequake.net>
Cc: Cpufreq@lists.linux.org.uk

On Thu, Sep 21, 2006 at 03:08:51PM -0500, Ryan Underwood wrote:
 > 
 > On Thu, Sep 21, 2006 at 03:31:41PM -0400, Dave Jones wrote:
 > >  > 
 > >  > 1.  The first time cpufreq changes speed, I get the whole "Losing some
 > >  > ticks... checking if CPU frequency changed." then eventually "Losing too
 > >  > many ticks!" and timer switches to PIT.  This does not happen when I use
 > >  > the /dev/toshiba driver to change speeds from userspace.  Not sure what
 > >  > is going on here...  SMI handler latency is between 6 and 7 ms.
 > > 
 > > Is loops_per_jiffy being correctly scaled on a speed transition?
 > 
 > No, because only the firmware knows what the real CPU speeds are.  How
 > would I deal with this?

Actually, if your driver is correctly using cpufreq_notify_transition()
it should be doing this automagically for you.  If you turn on debugging with
cpufreq.debug=7 , you should see lines of the form.

scaling loops_per_jiffy to %lu for frequency %u kHz\n
 
	Dave
