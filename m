From: Dave Jones <davej@redhat.com>
Subject: Re: writing a cpufreq driver
Date: Thu, 21 Sep 2006 15:47:14 -0400
Message-ID: <20060921194714.GH17065@redhat.com>
References: <20060921193141.GE17065@redhat.com>
	<1449F58C868D8D4E9C72945771150BDF153669@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1449F58C868D8D4E9C72945771150BDF153669@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: Cpufreq@lists.linux.org.uk, nemesis@icequake.net

On Thu, Sep 21, 2006 at 02:38:22PM -0500, Langsdorf, Mark wrote:
 > >  > 1.  The first time cpufreq changes speed, I get the whole 
 > > "Losing some
 > >  > ticks... checking if CPU frequency changed." then 
 > > eventually "Losing too
 > >  > many ticks!" and timer switches to PIT.  This does not 
 > > happen when I use
 > >  > the /dev/toshiba driver to change speeds from userspace.  
 > > Not sure what
 > >  > is going on here...  SMI handler latency is between 6 and 7 ms.
 > > 
 > > Is loops_per_jiffy being correctly scaled on a speed transition?
 > > Hmm, powernow-k7.c seems to be the only driver that's calling 
 > > recalibrate_cpu_khz()
 > 
 > Do drivers need to be doing that?  I would have thought the
 > time could would do it after receiving the notification.

Looking at it again..
cpufreq_notify_transition() is calling adjust_jiffies()
which should be doing the same thing, so we should be good to go.

It looks like feasible that recalibrate_cpu_khz() could actually
be killed off.

	Dave
