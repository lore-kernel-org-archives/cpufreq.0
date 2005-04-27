From: "Mark Bidewell" <mark.bidewell@alumni.clemson.edu>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 14:18:27 -0400 (EDT)
Message-ID: <46372.130.127.49.120.1114625907.squirrel@130.127.49.120>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<46736.141.228.156.225.1114600117.squirrel@www.difo.com>
	<426F85F5.7010700@alumni.clemson.edu>
	<20050427140711.GA2298@poupinou.org>
	<426FBBB1.7000001@alumni.clemson.edu>
	<20050427173828.GC2298@poupinou.org>
Reply-To: mark.bidewell@alumni.clemson.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050427173828.GC2298@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

It might help to explain how the governor is used. I have a user-mode
daemon which samples the ACPI temperature every 2 seconds and communicates
the speed at which non-interactive processes should be run via the sysfs
interface.  The scheduler will then determine a processes interactivity
and change the CPU speed accordingly.  In theory the processor could
change speeds every process switch.

This governor is indeed similar to the ondemand governor.  The distinction
is that while the ondemand governor expands CPU performance as load
increases, tempscale must limit performance.  In my opinion, the ultimate
solution would be a combination of the two governors.  That is, a governor
which would react in the following way:

1)  If the processor is idle, run at low speeds to conserve power (ondemand).
2)  Increase performance with demand as long a temperature is low (ondemand)
3)  If temperatures get to high, throttle compute-bound processes (tempscale)

I have done some limited experiments along this line using a user-mode
daemon to switch governors (as well as speeds) between tempscale and
ondemand as temperatures change.

Mark Bidewell


> For point 1 I'm not expert enough on processors so I can't tell (though
> I tend to trust you).  Of course I agree with points 2 and 3, and anyway
> we need a generic solution that must be independant of ACPI thermal
> passive cooling.
>
> I have to think a little bit more about your solution though.  In
> theory, the ondemand governor (or any other dynamic governors)
> with some kind of control of ->max for the policy should be OK (in
> kernel as under ACPI thermal subsystem or in user space by tweaking
> the scaling_max_freq via a daemon).
>
> But if we have to consider interactive/non-interactive process,
> the problem would be that we'll update policy when max change too
> often maybe?  So its have to be done by the governor you submit?
> I need to think at that and I have to make some tests.
>
> Thanks,
>
> --
> Bruno Ducrot
>
> --  Which is worse:  ignorance or apathy?
> --  Don't know.  Don't care.
>
