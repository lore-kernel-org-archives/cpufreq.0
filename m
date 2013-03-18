From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: CPU power management bug -- CPU bound task fails to raise CPU frequency
Date: Mon, 18 Mar 2013 10:02:18 +0530
Message-ID: <CAOh2x=kQqJVfFLAnW15mCUcUdrpM4nzTd75G=sAAHC7kgm5B-w@mail.gmail.com>
References: <2AC155A009400B4C8B05D518E4819AEF071D2E6B@exchange10.valvesoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ajBJuoQz7pURTaIPESTBhPNRDMpw87+3wJGLBlsbpBM=;
        b=as2NspMnuXXRMWFGvooxKiyTPlvmMoG31GiT70Z0NvXQGxFh7wIRM2Vy44IoKDmsbZ
         WlgbNAy/c9FwCWZELFdeUNyYXYU6I7TRStbHymuTQS5B4d3wYLTQRuS90gvr0WyYP82n
         PAHOV4FYx6QdFoHPt/rCV+fJ999aw+sKTSjUTzczkpy04AI8abAEngDgj8y+AKwbbsBw
         VW3w99NoLHWcQNOr7rmMdodlJP9npZ/dcwgzORsV4lCE7eBeY5S33c4wuRo2DpLOw3or
         E2mVUKVqtilVXPGFgtghVnm2nbISDOI6on9IpZnHtbXQViYyQmIucK5hkAA3LThORaDC
         cQrw==
In-Reply-To: <2AC155A009400B4C8B05D518E4819AEF071D2E6B@exchange10.valvesoftware.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Dawson <bruced@valvesoftware.com>
Cc: Dave Jones <davej@redhat.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linaro-kernel@lists.linaro.org

On Sun, Mar 17, 2013 at 6:37 AM, Bruce Dawson <bruced@valvesoftware.com> wrote:
> Dave/others, I've come up with a simple (and real) scenario where a CPU bound task running on Ubuntu (and presumably other Linux flavors) fails to be detected as CPU bound by the Linux kernel, meaning that the CPU continues to run at low speed, meaning that this CPU bound task takes (on my machines) about three times longer to run than it should.
>
> I found these e-mail addresses in the MAINTAINERS list under CPU FREQUENCY DRIVERS which I'm hoping is the correct area.

Yes, cpufreq mailing list is the right list for this.

> The basic problem is that on a multi-core system if you run a shell script that spawns lots of sub processes then the workload ends up distributed across all of the CPUs. Therefore, since none of the CPUs are particularly busy, the Linux kernel doesn't realize that a CPU bound task is running, so it leaves the CPU frequency set to low. I have confirmed the behavior in multiple ways. Specifically, I have used "iostat 1" and "mpstat -P ALL 1" to confirm that a full core's worth of CPU work is being done. mpstat also showed that the work was distributed across multiple cores. Using the zoom profiler UI for perf showed the sub processes (and bash) being spread across multiple cores, and perf stat showed that the CPU frequency was staying low even though the task was CPU bound.

There are few things which would be helpful to understand what's going on.
What governor is used in your case? Probably Ondemand (My ubuntu uses this).

Ideally, cpu frequency is increased only if cpu load is very high (or
above threshold,
95 in my ubuntu). So, the frequency might not be increased if there
are multiple cpus
running for a specific task and none of them has high enough load at that time.

Other stuff that i suspect here is a bug which was solved recently by
below patch. If
policy->cpu (that might be cpu 0 for you) is sleeping, then load is
never evaluated even
if all other cpus are very busy. If you can try below patch then it
might be helpful. BTW,
you might not be able to apply it easily as it has got lots of
dependencies.. and so you
might need to pick all drivers/cpufreq patches from v3.9-rc1.

commit 2abfa876f1117b0ab45f191fb1f82c41b1cbc8fe
Author: Rickard Andersson <rickard.andersson@stericsson.com>
Date:   Thu Dec 27 14:55:38 2012 +0000

    cpufreq: handle SW coordinated CPUs

    This patch fixes a bug that occurred when we had load on a secondary CPU
    and the primary CPU was sleeping. Only one sampling timer was spawned
    and it was spawned as a deferred timer on the primary CPU, so when a
    secondary CPU had a change in load this was not detected by the cpufreq
    governor (both ondemand and conservative).

    This patch make sure that deferred timers are run on all CPUs in the
    case of software controlled CPUs that run on the same frequency.

    Signed-off-by: Rickard Andersson <rickard.andersson@stericsson.com>
    Signed-off-by: Fabio Baltieri <fabio.baltieri@linaro.org>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/cpufreq/cpufreq_conservative.c |  3 ++-
 drivers/cpufreq/cpufreq_governor.c     | 44
++++++++++++++++++++++++++++++++++++++------
 drivers/cpufreq/cpufreq_governor.h     |  1 +
 drivers/cpufreq/cpufreq_ondemand.c     |  3 ++-
 4 files changed, 43 insertions(+), 8 deletions(-)


> I have only reproed this behavior on six-core/twelve-thread systems. I would assume that at least a two-core system would be needed to repro this bug, and perhaps more. The bug will not repro if the system is not relatively idle, since a background CPU hog will force the frequency up.
>
> The repro is exquisitely simple -- ExprCount() is a simplified version of the repro (portable looping in a shell script) and BashCount() is an optimized and less portable version that runs far faster and also avoids this power management problem -- the CPU frequency is raised appropriately. Running a busy loop in another process is another way to get the frequency up and this makes ExprCount() run ~3x faster. Here is the script:
>
> --------------------------------------
> #!/bin/bash
> function ExprCount() {
>         i=$1
>         while [ $i -gt 0 ]; do
>                 i=$(expr $i - 1)

I may be wrong but one cpu is used to run this script and other one
would be used
to run expr program.. So, 2 cpus should be good enough to reproduce this setup.

BTW, i have tried your scripts and was able to reproduce the setup
here on a 2 cpu
4 thread system.

--
viresh
