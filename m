From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 30712] Slow transitioning AMD ondemand CPU because of wrong
 sampling_rate
Date: Tue, 15 Mar 2011 04:59:11 GMT
Message-ID: <201103150459.p2F4xBsw012905@demeter2.kernel.org>
References: <bug-30712-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-30712-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=30712





--- Comment #2 from justincase@yopmail.com  2011-03-15 04:59:11 ---
(In reply to comment #1)

> Users won't recon whether the process ends in 50 or 70 ms

> And you want to save power, therefore it makes
> sense to not switch frequency up on this tiny peak.

I don't agree. We don't care if frequency switches up here, it's a drop in the
ocean. What power saving really is IMHO, is this: 
 cpufreq stats: 2.20 GHz:2.50%, [...], 1000 MHz:97.34%

> You may want to try to find a "real-world" workload which takes a minute or so
> and prove a performance loss of >%2, that should be hard. Especially with
> latest improvements (count IO as load).

On my AMD cpu, the dd command takes more than 120ms to execute, and about 65ms
with the workaround. Nearly x2. Of course the benchmark is dirty, but I'm sure
we can find practical issues. What about shell scripts spawning many small IO
processes one after another? 

So I tested the following command within a shell script: 
 for i in {000..999} ; do dd if=/dev/zero of=file$i bs=1M count=1 ; done

With the following results (zsh time cmd): 
 performance: 
 0,27s user 4,17s system 43% cpu 10,229 total
 0,28s user 4,17s system 41% cpu 10,740 total
 0,31s user 4,12s system 41% cpu 10,564 total

 ondemand: 
 0,72s user 9,76s system 70% cpu 14,944 total
 0,70s user 9,74s system 64% cpu 16,256 total
 0,63s user 8,64s system 61% cpu 15,037 total

 ondemand with workaround: 
 0,46s user 5,49s system 49% cpu 12,095 total
 0,43s user 5,58s system 48% cpu 12,281 total
 0,43s user 5,52s system 48% cpu 12,358 total

And on a larger scale (doing the loop 6 times within the script): 
 performa: 1,87s user 24,97s system 40% cpu 1:06,06 total
 ondemand: 4,49s user 58,64s system 70% cpu 1:30,02 total
 workarnd: 2,46s user 32,89s system 48% cpu 1:12,83 total


The issue is clearly visible with >>2% overhead. Seems like the gap between
each process creation is long enough for ondemand to switch freq down, but
afterward the governor is too slow to be back up again soon enough, resulting
in an overall performance cost. 

We know we can sample faster by setting sampling rate to min, so finally the
only question is: what is the real cost of sampling faster and does it outweigh
the performance benefit? 

I'm not a specialist, so I may be wrong... 

> For theoretical worst case performance losses for your HW you can also use
> cpufreq-bench from the cpufrequtils package.

Don't have it on Debian (version 007). Will try it if you or someone else think
it's necessary to complete the results above.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
