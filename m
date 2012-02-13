From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/5] Clean up x86 CPU auto-loading
Date: Sun, 12 Feb 2012 17:26:44 -0800
Message-ID: <4F3866D4.9060209@zytor.com>
References: <1329000256.325.48.camel@deadeye> <201202130010.57492.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201202130010.57492.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Renninger <trenn@suse.de>
Cc: Ben Hutchings <ben@decadent.org.uk>, gregkh@linuxfoundation.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

On 02/12/2012 03:10 PM, Thomas Renninger wrote:
> On Saturday 11 February 2012 23:44:16 Ben Hutchings wrote:
>> This series fixes a number of apparent bugs in the recent changes to
>> enable auto-loading by x86 CPU ID.
> 
> These all look correct.
> I should have spotted the intel_idle modifications myself.
> Good catch(es).
> 
> Greg: I expect these should get queued in your driver-core-next branch?
> 

Either that or we can carry them in -tip as x86 patches, since there
isn't a pending conflict this time.

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

