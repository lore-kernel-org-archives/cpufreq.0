From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Tue, 27 Mar 2007 11:52:41 -0700
Message-ID: <200703271852.l2RIqfAO009935@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From mark.langsdorf@amd.com  2007-03-27 11:52 -------
> ------- Additional Comments From babassu@postmaster.co.uk  
> 2007-03-27 11:38 -------
> I took the liberty to glance at the code for powernow-k8.c
> (/usr/src/linux-source-2.6.20/arch/i386/kernel/cpu/cpufreq). 
> I may be totally
> out to lunch here but bear with me.
> 1. the function "query_current_values_with_pending_wait" has 
> a loop incrementing a counter to 10000 (not totally properly
> initialized)

Your issue with 
	u32 i = 0;
is what, exactly?

> trying to read the fid/vid ctl MSR register. Can this be
> too short (10000 CPU registry reads on a 2GHz CPU)

I don't believe it is, based on my testing.  We used to have
a longer loop, but with the retry it locked up the system for
too long if the operation failed.

If your testing demonstrates the time out needs to be longer,
I will ack a patch to increase it.

> 2. If the call to query_current_values_with_pending_wait 
> fails we try to set the fid/vid control registry again
> in a loop (up to 100 times). Can this be potentially bad
> (it would set the pending bit again but if  the old fid==new fid
> the bit may not be reset ever since no change in frequency is 
> required)?

No, this is a good thing.  Some chip sets have inadequate
buffering for pstate/cstate changes, and can get into a
degenerate state where a cstate change following a cstate
change causes the chipset to overflow the buffer and lose
the pstate change.  The chipset completes both changes but
doesn't know to signal the clear for the pstate change; the
processor never clears the pending bit and the pstate change
is assumed to never complete.  Solution is to resend the
pstate change command, which the chipset acknowledges quickly
(because it is already in the pstate from the previous change
command) and clears the pending bit.

AMD observed this behavior in our hardware debug labs and
I implemented the recommendation of our silicon engineers.

If it bothers you, try taking out that loop, increase the
query_current_values_with_pending_wait_loop to something
much longer, and see if your system starts behaving properly.

> 3. The loop in "query_current_values_with_pending_wait" may 
> ramp up the CPU to 100% triggering the "governor" mechanism.
> Are we protected to this kind of conflicts ?

No, but it's never come up in my experience.





------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
