From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 19:38:28 +0200
Message-ID: <20050427173828.GC2298@poupinou.org>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<46736.141.228.156.225.1114600117.squirrel@www.difo.com>
	<426F85F5.7010700@alumni.clemson.edu>
	<20050427140711.GA2298@poupinou.org>
	<426FBBB1.7000001@alumni.clemson.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <426FBBB1.7000001@alumni.clemson.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Cc: cpufreq@lists.linux.org.uk

On Wed, Apr 27, 2005 at 12:20:01PM -0400, Mark Bidewell wrote:
> Bruno Ducrot wrote:
> 
> >On Wed, Apr 27, 2005 at 08:30:45AM -0400, Mark Bidewell wrote:
> > 
> >
> >>You are correct, The primary differences are that
> >>1)  the clock modulation only cuts in after dangerous temperatures have 
> >>been detected.  This code prevents those high temperatures.
> >>2)  This code uses the OS Scheduler to make targeted performance cuts on 
> >>certain applications.  This reduces the performance impact of throttling 
> >>to non-interactive processes.
> >>   
> >>
> >
> >I disagree.  If processors are under an overheat situation, we should
> >not consider performance anymore.
> >
> > 
> >
> I am in agrement that performance doesn't matter in a CPU thermal 
> emergency.  In fact no software throttling would be reliable enough (or 
> fast enough) to prevent problems consistently.  I see this governor as a 
> preventative measure to reduce day-to-day thermal stress not as an an 
> emergency stopgap.  The possible advantages of the governor I see are:
> 
> 1)  The higher the temperature at which a CPU runs the lower its life.  
> A common rule of thumb is that increasing operating temperature by 10C 
> cuts CPU life in half.  CPU throttling does not cut in until an 
> emergency occurs (which can be often on a laptop).  It would be useful 
> to reduce this stress
> 2)  Quieter operation by reducing the amount of time fans have to run.
> 3)  Reducing the effect of heat on other components of a system 
> (particularly the hard drive in a laptop) which are near the CPU.

For point 1 I'm not expert enough on processors so I can't tell (though
I tend to trust you).  Of course I agree with points 2 and 3, and anyway
we need a generic solution that must be independant of ACPI thermal
passive cooling.

I have to think a little bit more about your solution though.  In
theory, the ondemand governor (or any other dynamic governors)
with some kind of control of ->max for the policy should be OK (in
kernel as under ACPI thermal subsystem or in user space by tweaking
the scaling_max_freq via a daemon).

But if we have to consider interactive/non-interactive process,
the problem would be that we'll update policy when max change too
often maybe?  So its have to be done by the governor you submit?
I need to think at that and I have to make some tests.

Thanks,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
