From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 21:04:16 +0200
Message-ID: <20050427190416.GE2298@poupinou.org>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<46736.141.228.156.225.1114600117.squirrel@www.difo.com>
	<426F85F5.7010700@alumni.clemson.edu>
	<20050427140711.GA2298@poupinou.org>
	<426FBBB1.7000001@alumni.clemson.edu>
	<20050427173828.GC2298@poupinou.org>
	<46372.130.127.49.120.1114625907.squirrel@130.127.49.120>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <46372.130.127.49.120.1114625907.squirrel@130.127.49.120>
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

On Wed, Apr 27, 2005 at 02:18:27PM -0400, Mark Bidewell wrote:
> It might help to explain how the governor is used. I have a user-mode
> daemon which samples the ACPI temperature every 2 seconds and communicates
> the speed at which non-interactive processes should be run via the sysfs
> interface.  The scheduler will then determine a processes interactivity
> and change the CPU speed accordingly.  In theory the processor could
> change speeds every process switch.

That why I have to do tests in case there is a lot of those process
switch but when modifiying max frequency instead.

> This governor is indeed similar to the ondemand governor.  The distinction
> is that while the ondemand governor expands CPU performance as load
> increases, tempscale must limit performance.  In my opinion, the ultimate
> solution would be a combination of the two governors.  That is, a governor
> which would react in the following way:
> 
> 1)  If the processor is idle, run at low speeds to conserve power (ondemand).
> 2)  Increase performance with demand as long a temperature is low (ondemand)
> 3)  If temperatures get to high, throttle compute-bound processes (tempscale)
> 
> I have done some limited experiments along this line using a user-mode
> daemon to switch governors (as well as speeds) between tempscale and
> ondemand as temperatures change.

That's why I suggest to touch max frequency, not the actual frequency.

This must be done outside a governor, so that you can have both actually.
I'll send you a patch after writing it for testing purpose so that you will
see what I have in mind.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
