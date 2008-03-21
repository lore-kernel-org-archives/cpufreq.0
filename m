From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] cpufreq: Expose cpufreq coordination requirements
 regardless of coordination mechanism
Date: Fri, 21 Mar 2008 15:41:24 -0700
Message-ID: <20080321154124.668969a2.akpm@linux-foundation.org>
References: <20080321004354.GQ5529@tree.beaverton.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762200AbYCUWlz@vger.kernel.org>
In-Reply-To: <20080321004354.GQ5529@tree.beaverton.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Darrick J. Wong" <djwong@us.ibm.com>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, venkatesh.pallipadi@intel.com

On Thu, 20 Mar 2008 17:43:54 -0700
"Darrick J. Wong" <djwong@us.ibm.com> wrote:

> Currently, affected_cpus shows which CPUs need to have their frequency
> coordinated in software.  When hardware coordination is in use, the
> contents of this file appear the same as when no coordination is
> required.  This can lead to some confusion among user-space programs,
> for example, that do not know that extra coordination is required to
> force a CPU core to a particular speed to control power consumption.
> 
> To fix this, create a "related_cpus" attribute that always displays
> the coordination map regardless of whatever coordination strategy
> the cpufreq driver uses (sw or hw).  If the cpufreq driver does not
> provide a value, fall back to policy->cpus.

I was going to ding you for not updating the kernel->userspace API
documentation.  But it seems that none of this interface is documented
anyway :(
