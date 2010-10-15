From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 15 Oct 2010 17:52:39 GMT
Message-ID: <201010151752.o9FHqddM006362@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #15 from vyncere <vyncere@gmail.com>  2010-10-15 17:52:16 ---
Hi all,

I have an Intel Core i5 520 M (Thinkpad T410). This is when I switched from
Ubuntu 10.04 (2.6.32.15) to Ubuntu 10.10 (2.6.35.4) that the problem has made
itself visible.

* With the stock kernel of Ubuntu 10.04 : (Ondemand WORKS)
cpufreq-info said for all virtual CPUs :

hardware limits: 1.20 GHz - 2.40 GHz
current policy: frequency should be within 1.20 GHz and 2.40 GHz.
The governor "ondemand" may decide which speed to use within this range.
current CPU frequency is 1.20 GHz.
cpufreq stats: 2.40 GHz:3.26%, 2.40 GHz:0.02%, 2.27 GHz:0.05%, 2.13 GHz:0.05%,
2.00 GHz:0.03%, 1.87 GHz:0.02%, 1.73 GHz:0.03%, 1.60 GHz:0.01%, 1.47 GHz:0.03%,
1.33 GHz:0.03%, 1.20 GHz:96.48%  (235)

* With the stock kernel of Ubuntu 10.10 : (Ondemand FAILS)
cpufreq-info said for all virtual CPUs :
hardware limits: 1.20 GHz - 2.40 GHz
current policy: frequency should be within 1.20 GHz and 1.20 GHz.
current CPU frequency is 1.20 GHz.
cpufreq stats: 2.40 GHz:0.00%, 2.40 GHz:0.00%, 2.27 GHz:0.00%, 2.13 GHz:0.00%,
2.00 GHz:0.00%, 1.87 GHz:0.00%, 1.73 GHz:0.00%, 1.60 GHz:0.00%, 1.47 GHz:0.00%,
1.33 GHz:0.00%, 1.20 GHz:100.00%

I took my custom reference configuration (.config) of my laptop which perfectly
works with the 2.6.32.15 Ubuntu Kernel and tested it with some different kernel
versions (from kernel.org), in order to reduce the incidence of Ubuntu patches.

* Results :

2.6.32.15 : Ondemand scaling OK
2.6.32.16 : Ondemand scaling OK
2.6.32.17 : Ondemand scaling OK
2.6.32.18 : Ondemand scaling OK
2.6.32.19 : Ondemand scaling OK
2.6.32.20 : Ondemand scaling OK
2.6.32.21 : Ondemand scaling OK
2.6.32.22 : Ondemand scaling OK
2.6.32.23 : Ondemand scaling OK
2.6.32.24 : Ondemand scaling OK

So, at this state, could it be concluded that the problem has came after 2.6.32
? Not so sure ! Because, as it was underlines higher in this thread, this
problem may highly be machine specific... In any case, this is the second bug
reporting, impacting a Core i5 CPU. On Ubuntu launchpad, someone with a Core 2
Duo T7200 CPU is affected by this problem too (2.6.35.4 from Ubuntu 10.10).

I have tested too with a clean 2.6.35.7 with and without the patch from Thomas
R. For both, the result is the same : Ondemand scaling KO.

I will tell you what happens with >= 2.6.33 kernels.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
