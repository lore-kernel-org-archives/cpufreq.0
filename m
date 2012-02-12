From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 0/5] Clean up x86 CPU auto-loading
Date: Mon, 13 Feb 2012 00:10:56 +0100
Message-ID: <201202130010.57492.trenn@suse.de>
References: <1329000256.325.48.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1329000256.325.48.camel@deadeye>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Ben Hutchings <ben@decadent.org.uk>, gregkh@linuxfoundation.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

On Saturday 11 February 2012 23:44:16 Ben Hutchings wrote:
> This series fixes a number of apparent bugs in the recent changes to
> enable auto-loading by x86 CPU ID.

These all look correct.
I should have spotted the intel_idle modifications myself.
Good catch(es).

Greg: I expect these should get queued in your driver-core-next branch?

Thanks,

    Thomas
> 
> Ben.
> 
> Ben Hutchings (5):
>   x86/cpu: Fix overrun check in arch_print_cpu_modalias()
>   x86/cpu: Clean up modalias feature matching
>   intel_idle: Fix ID for Nehalem-EX Xeon in device ID table
>   intel_idle: Revert change of auto_demotion_flags for Nehalem
>   powernow-k7: Fix CPU family number
> 
>  arch/x86/kernel/cpu/match.c   |    5 ++---
>  drivers/cpufreq/powernow-k7.c |    2 +-
>  drivers/idle/intel_idle.c     |   12 ++++--------
>  scripts/mod/file2alias.c      |    5 +++--
>  4 files changed, 10 insertions(+), 14 deletions(-)
> 
> -- 
> 1.7.9
> 
> 
> 

