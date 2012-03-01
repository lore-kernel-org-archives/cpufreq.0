From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq.next status
Date: Wed, 29 Feb 2012 23:32:24 -0500
Message-ID: <20120301043223.GA11483@redhat.com>
References: <20120229195732.GB11311@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120229195732.GB11311@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

On Wed, Feb 29, 2012 at 02:57:33PM -0500, Dave Jones wrote:
 > I just went through my backlog, and applied and pushed out what I had
 > queued up. Half of the patches didn't apply.
 > So if your patch isn't in what's on cpufreq.next on kernel.org right now,
 > it needs rebasing and resending.
 > 
 > Here are the ones that applied:
 > Applying: [CPUFREQ] s3c64xx: Fix mis-cherry pick of VDDINT
 > Applying: [CPUFREQ] EXYNOS: Initialize locking_frequency with initial frequency
 > Applying: [CPUFREQ] EXYNOS4210: update the name of EXYNOS clock register
 > Applying: [CPUFREQ] Fix exposure of ARM_EXYNOS4210_CPUFREQ
 > Applying: [CPUFREQ] Add S3C2416/S3C2450 cpufreq driver
 > Applying: [CPUFREQ] CPUfreq ondemand: update sampling rate without waiting for next sampling
 > Applying: [CPUFREQ] ondemand: handle QoS request on DVFS response latency

I scrapped that tree, and just pushed out a recreated tree without the last two patches
(which without the dependant QoS patch that didn't apply, caused a build failure).

If you cloned/pulled this afternoon, you'll need to reclone without those bad commits.

	Dave

