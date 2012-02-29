From: Dave Jones <davej@redhat.com>
Subject: cpufreq.next status
Date: Wed, 29 Feb 2012 14:57:33 -0500
Message-ID: <20120229195732.GB11311@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

I just went through my backlog, and applied and pushed out what I had
queued up. Half of the patches didn't apply.
So if your patch isn't in what's on cpufreq.next on kernel.org right now,
it needs rebasing and resending.

Here are the ones that applied:
Applying: [CPUFREQ] s3c64xx: Fix mis-cherry pick of VDDINT
Applying: [CPUFREQ] EXYNOS: Initialize locking_frequency with initial frequency
Applying: [CPUFREQ] EXYNOS4210: update the name of EXYNOS clock register
Applying: [CPUFREQ] Fix exposure of ARM_EXYNOS4210_CPUFREQ
Applying: [CPUFREQ] Add S3C2416/S3C2450 cpufreq driver
Applying: [CPUFREQ] CPUfreq ondemand: update sampling rate without waiting for next sampling
Applying: [CPUFREQ] ondemand: handle QoS request on DVFS response latency

And what didn't..

Subject: Cpufreq shutdown patch (kernel 2.6.35.3)
Subject: [CPUFREQ] sfi based cpufreq driver for intel soc platforms
Subject: [CPUFREQ] PM QoS: Add CPU frequency minimum as PM QoS param
Subject: [CPUFREQ] EXYNOS4X12: Add support cpufreq for EXYNOS4X12
Subject: [CPUFREQ] powernow-k8: Avoid Pstate MSR accesses on systems supporting CPB
Subject: [CPUFREQ] powernow-k8: Fix indexing issue
Subject: [CPUFREQ] s3c64xx: Fix mis-cherry pick of VDDINT
Subject: [CPUFREQ] OMAP driver depends CPUfreq tables


	Dave

