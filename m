From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Wed, 24 Oct 2012 04:21:12 +0000 (UTC)
Message-ID: <20121024042112.E0DC911FBAA@bugzilla.kernel.org>
References: <bug-49231-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-49231-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=49231





--- Comment #6 from Roger Scott <ras243-korg@yahoo.com>  2012-10-24 04:21:12 ---
I've managed to do some more testing.  Output from cpupower-monitor (excuse
formatting mess):

    |Nehalem                    || SandyBridge        || Mperf              ||
I
dle_Stats                       
CPU | C3   | C6   | PC3  | PC6  || C7   | PC2  | PC7  || C0   | Cx   | Freq ||
P
OLL | C1-S | C3-S | C6-S | C7-S 
   0|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00||100.00|  0.00|  3433||  
0.00|  0.00|  0.00|  0.00|  0.00
   1|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00||  2.22| 97.78|  3427||  
0.00|  0.00|  0.00|  0.16| 97.86
   2|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00||  2.17| 97.83|  3425||  
0.00|  0.00|  0.00|  0.31| 97.75
   3|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00||  3.71| 96.29|  3433||  
0.00|  0.00|  0.04|  1.06| 95.43
   4|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00||  2.04| 97.96|  3427||  
0.00|  0.00|  0.00|  0.00| 98.21
   5|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00||  4.56| 95.44|  3434||  
0.00|  0.00|  0.00|  1.19| 94.50

I'm guessing that this is suggesting that the idle processor cores should be
mostly in C7 but for some reason aren't.

I fiddled around with the perf-bias register but it didn't seem to make any
real difference.  It might have made the cores go from C1 to C7 quicker once
the job was stopped but that's just my subjective opinion and I didn't do any
timing tests.

When running powertop I was getting 1000 wakeups-from-idle per second (ie the
kernel tick rate).  These were all from the swapper threads/processes, one per
core.  So I thought I'd try running with the NO_HZ setting and interestingly
the idle cores now stay in C7.  Output from cpupower monitor with NO_HZ set:

    |Nehalem                    || SandyBridge        || Mperf              ||
I
dle_Stats                       
CPU | C3   | C6   | PC3  | PC6  || C7   | PC2  | PC7  || C0   | Cx   | Freq ||
P
OLL | C1-S | C3-S | C6-S | C7-S 
   0|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00|| 99.81|  0.19|  3799||  
0.00|  0.00|  0.00|  0.00|  0.00
   1|  1.17|  0.00|  0.00|  0.00|| 98.58|  0.00|  0.00||  0.11| 99.89|  3719||  
0.00|  0.00|  0.00|  0.00| 99.88
   2|  0.03|  0.00|  0.00|  0.00|| 95.76|  0.00|  0.00||  3.98| 96.02|  3796||  
0.00|  0.03|  0.00|  0.00| 95.93
   3|  1.12|  0.00|  0.00|  0.00|| 98.82|  0.00|  0.00||  0.03| 99.97|  3715||  
0.00|  0.00|  0.00|  0.00| 99.96
   4|  0.01|  0.00|  0.00|  0.00|| 98.76|  0.00|  0.00||  0.05| 99.95|  3755||  
0.00|  0.00|  0.00|  0.00| 99.94
   5|  0.00|  0.00|  0.00|  0.00|| 99.74|  0.00|  0.00||  0.21| 99.79|  3666||  
0.00|  0.01|  0.00|  0.00| 99.75

Naturally the time spent in C0 for the idle cores is less than for a ticked
system but my previous 2.7% is less than the Xeon at 4.5% which still manages
to turbo boost itself properly.  Just for fun I ran a job which should have
simulated 1000 wakes/sec (ie for loop with usleep(1000)).  Interestingly
despite more time than originally spent in C0 the cores still spent a
reasonable amount of time in C7 and were still boosted beyond 3.5GHz.

    |Nehalem                    || SandyBridge        || Mperf              ||
Idle_Stats                       
CPU | C3   | C6   | PC3  | PC6  || C7   | PC2  | PC7  || C0   | Cx   | Freq ||
POLL | C1-S | C3-S | C6-S | C7-S 
   0|  0.00|  0.00|  0.00|  0.00||  0.00|  0.00|  0.00|| 98.43|  1.57|  3654|| 
0.00|  0.00|  0.00|  0.00|  0.00
   1|  1.36|  0.00|  0.00|  0.00|| 33.03|  0.00|  0.00||  3.78| 96.22|  3606|| 
0.00| 12.98| 22.92|  0.00| 60.35
   2|  8.65|  0.16|  0.00|  0.00|| 55.79|  0.00|  0.00||  4.23| 95.77|  3586|| 
0.00| 10.44|  8.28|  0.17| 76.83
   3|  4.42|  0.00|  0.00|  0.00|| 72.01|  0.00|  0.00||  4.47| 95.53|  3563|| 
0.00|  8.98|  2.78|  0.00| 83.75
   4|  1.47|  0.00|  0.00|  0.00|| 47.46|  0.00|  0.00||  3.21| 96.79|  3603|| 
0.00| 11.16| 14.78|  0.00| 70.87
   5|  6.18|  0.00|  0.00|  0.00|| 23.11|  0.00|  0.00||  2.15| 97.85|  3619|| 
0.00| 25.62| 11.99|  0.00| 60.30

I still think there's something a bit funny happening with the ticked system
which is inhibiting idle CPUs from entering C7 if one of their siblings are
busy but I'd be happy if someone who knows more might be able to explain why.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
