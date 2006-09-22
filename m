From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: writing a cpufreq driver
Date: Fri, 22 Sep 2006 09:39:54 -0500
Message-ID: <20060922143954.GF24439@dbz.icequake.net>
References: <20060921184833.GC1216@dbz.icequake.net>
	<20060921193141.GE17065@redhat.com>
	<20060921200851.GF2364@dbz.icequake.net>
	<20060921204402.GA26683@redhat.com>
	<20060921210329.GA16590@dbz.icequake.net>
	<20060921211343.GG26683@redhat.com>
	<20060922141318.GE24439@dbz.icequake.net>
Reply-To: nemesis@icequake.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060922141318.GE24439@dbz.icequake.net>
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
To: Ryan Underwood <nemesis-lists@icequake.net>
Cc: Dave Jones <davej@redhat.com>, Ryan Underwood <nemesis@icequake.net>, Cpufreq@lists.linux.org.uk


On Fri, Sep 22, 2006 at 09:13:18AM -0500, Ryan Underwood wrote:
> 
> I have a question, how critical is it that I have exactly the correct
> CPU MHz for the scaling to work properly?  Unfortunately, for the slow
> speed there is no way for me to know what it actually is on a particular
> system due to limitations of the firmware, so the best I could do is a
> RDTSC timing to try to figure it out.  I wonder if skew between the
> actual CPU speed and what cpufreq thinks it is would be the source of
> the problem.

Hmm, this might have been the problem.  On my machine, the fast and slow
MHz (as measured by my TSC routine) are the same.  However, the machine
is noticeably slower at the 'slow' firmware setting.  I thought maybe
they were disabling L1 cache, but that is not the case.  The CPU is a
Pentium VRT 120MHZ so I'm not sure what is going on.... maybe down
clocking the system bus or memory or inserting wait states somewhere.

In any case, since the fast and slow MHZ are the same, cpufreq does
nothing.  But cpufreq should still do "something" in this case, since
something else that my driver does is to disable the L2 cache when going
to the slow state, which is a decent power savings even on my laptop
that doesn't have an actual slow MHZ.  But since the fast and slow mhz
are the same, cpufreq performs no actions.

-- 
Ryan Underwood, <nemesis@icequake.net>
