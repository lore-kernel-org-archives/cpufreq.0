From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Wed, 06 Nov 2013 19:44:45 +0000
Message-ID: <bug-64261-12968-GrQycORtQt@https.bugzilla.kernel.org/>
References: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

--- Comment #17 from Doug Smythies <dsmythies@telus.net> ---
(In reply to Dirk Brandewie from comment #16)
> (In reply to Doug Smythies from comment #12)
> > Created attachment 113591 [details]
> > CPU 7 frequency vs load. Turbo off. With and without rounding.
> > 
> > The load on cpu 7 varies from 0.005 to 0.995 in steps of 0.005 at 10 seconds
> > per step. The frequency is monitored at 10 Hertz.
> 
> Are you still setting {min/max}_perf_pct or are we changing horses and
> talking about using the driver in "normal' mode?

No, I am not setting min=max=whatever.
Yes, I was "changing horses" here. The settings are all default from boot up,
except with respect to turbo on or off. I was wanting to try to demonstrate
improvement using rounding in a real operational sense and as it got closer to
100% frequency. Test 1, turbo on, did show improvement and much less jitter.
However Test 2, turbo on, did not. I still need to go back and investigate why
those two tests, which should have been the same, weren't.
Sorry, I should have been clearer in my description.

I have two methods for loading CPUs to various levels and working/sleeping
frequencies:

One uses a program called "consume", originally from Peter Zijlstra of the
kernel.org sched maintainers. It will apply the desired load at the desired
work/sleep frequency, regardless of the CPU frequency. I.E. it does not respond
to the CPU frequency going up, but rather modifies its work load accordingly to
hold to what was asked for, not like a real system.

The other is a program called "waiter" (the name is from the text book I
started it from). It will spin out the desired number of processes at the
desired load at the desired work/sleep frequency, but what it actually does
depends on the CPU frequency and number of running processes. I.E. it responds
to the CPU frequency going up by getting its work done faster, just like a real
system. The user interface for waiter is NOT good, and I tend to use another
program to create scripts to provide operational parameters.

I used "consume" for these graphs.

-- 
You are receiving this mail because:
You are the assignee for the bug.
