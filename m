From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: post-OLS pending cpufreq patches
Date: Mon, 2 Aug 2004 22:40:44 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040802204044.GA8795@dominikbrodowski.de>
References: <20040727205126.GB9438@dominikbrodowski.de>
	<20040802193350.GA15740@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040802193350.GA15740@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Aug 02, 2004 at 08:33:50PM +0100, Dave Jones wrote:
> On Tue, Jul 27, 2004 at 10:51:26PM +0200, Dominik Brodowski wrote:
> 
>  > - [core] HT fix before CPU group support is merged
>  > 	fixes bug #3012: blind de-referencing of CPUdata independent of
>  > 	whether this CPU is actually registered with the CPUfreq core is 
>  > 	bad. The small fix proposed is really straightforward, the proper
>  > 	solution will be to merge the cpufreq-SMT patchkit, but that's much
>  > 	more invasive and not yet completely ready. A "must" for 2.6.8.
> 
> couldnt find this in my inbox/cpufreq folder. can you bounce this please?

Done in separate mail.

>  > - [speedstep-smi] get_frequencies SMM call causes failures 
>  > 	fixes bug reported by Pierre Maziere. Also really straightforward.
> 
> ditto (unless this is the 0xffff patch I just merged ?)

No, it's this patch you merged:
http://linux-dj.bkbits.net:8080/cpufreq/gnupatch@410e9165OpfEFE684FCd4kzghQsn5g

>  > - [pmac] scaling_availbale_frequencies, #define cleanup [John Clemens]
>  > x [pmac] does it keep frequency across suspend? If not, remove "equal" check
>  > 		in target and/or set_speed
>  > 	Don't really know about pmac's side of things, just wanted to
>  > 	mention	it again.
> 
> pmac bits I'd rather go via benh, as he has a far better handle
> on whats going on in that world, along with hardware with which
> to test these changes.

Agreed; as I said I don't know about pmac's side of things, just wanted to
keep benh awake :)

>  > - [core] SMT patchkit
>  > 	needs a bit of work, will re-submit for 2.6.9
> 
> Hmm.
> 
> Subject: Re: [PATCH 2.6.8-rc2] speedstep SMT support
> ...
> DB> Patch looks good, so: Dave, could you please merge it?
> 
> Merged.

Acutally, I meant something else...

[RFC][PATCH] (1/4) cpufreq SMT awareness: keep affected_cpu_mask
[RFC][PATCH] (2/4) cpufreq SMT awareness: save CPU's sys_device
[RFC][PATCH] (3/4) cpufreq SMT awareness: only register SMT group once
[RFC][PATCH] (4/4) cpufreq SMT awareness: code reduction

... but they need some work. Will do that against cpufreq-bk in a few days.

> Thanks for the summary 8-)
You're welcome. Thanks for removing items from the summary  by merging them :)

	Dominik
