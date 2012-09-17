From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3.6-rc6] cpufreq/powernow-k8: workqueue user shouldn't
 migrate the kworker to another CPU
Date: Mon, 17 Sep 2012 22:36:54 +0200
Message-ID: <20120917203654.GA6541@liondog.tnic>
References: <20120917201721.GJ18677@google.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1347914216; bh=DVPtUCT/ndKVAaabP2CWqeJX1/+EYBAoeqlsrmhWAQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=XJK58WzrW5wcIF6abteWvYzLFgC5T1y95vfumm
	hae515+9xDZf2ct83+T1kGqtX+C/wESL6/hzFkN+m/PVKy2UCWQacpUYw40n2C14aMl
	JpFSwtcWsTyWPQCV8hSW/MyAUHVgEpxnLvGYNR63LBxY4PSlCFn8h+WiWEn+6iOWz0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1347914215; bh=DVPtUCT/ndKVAaabP2CWqeJX1/+EYBAoeqlsrmhWAQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=uDjhiPc/ZtD91i4TgfK8OWAtTlCiGhdS3Wr2/k
	1H/63uml63NwD+OzWtVa3AJmizqcSeExrVND8GMEpefNYZjXLOJo8HsJjwqqeFJ+dOE
	ansgVCLQ8COhRsUq7sihxNPScNi8O4oAMzPOqBxXXvKaKDp7fgtXAvy8PTk8f1G6JA=
Content-Disposition: inline
In-Reply-To: <20120917201721.GJ18677@google.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Duncan <1i5t5.duncan@cox.net>, Andreas Herrmann <andreas.herrmann3@amd.com>

On Mon, Sep 17, 2012 at 01:17:21PM -0700, Tejun Heo wrote:
> powernowk8_target() runs off a per-cpu work item and if the
> cpufreq_policy->cpu is different from the current one, it migrates the
> kworker to the target CPU by manipulating current->cpus_allowed.  The
> function migrates the kworker back to the original CPU but this is
> still broken.  Workqueue concurrency management requires the kworkers
> to stay on the same CPU and powernowk8_target() ends up triggerring
> BUG_ON(rq != this_rq()) in try_to_wake_up_local() if it contends on
> fidvid_mutex and sleeps.
> 
> It is unclear why this bug is being reported now.  Duncan says it
> appeared to be a regression of 3.6-rc1 and couldn't reproduce it on
> 3.5.  Bisection seemed to point to 63d95a91 "workqueue: use @pool
> instead of @gcwq or @cpu where applicable" which is an non-functional
> change.  Given that the reproduce case sometimes took upto days to
> trigger, it's easy to be misled while bisecting.  Maybe something made
> contention on fidvid_mutex more likely?  I don't know.
> 
> This patch fixes the bug by punting to another per-cpu work item on
> the target CPU if it isn't the same as the current one.  The code
> assumes that cpufreq_policy->cpu is kept online by the caller, which
> Rafael tells me is the case.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Duncan <1i5t5.duncan@cox.net>
> Cc: Rafael J. Wysocki <rjw@sisk.pl>
> Cc: Andreas Herrmann <andreas.herrmann3@amd.com>
> Cc: stable@kernel.org
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=47301
> ---
> 
> While it's very late in the merge cycle, the fix is limited in scope
> and fairly safe, so it wouldn't be too crazy to merge but then again
> this can go through the next -rc1 and then -stable.  Linus, Rafael,
> what do you guys think?

Wouldn't it be much simpler to carve out the piece after
set_cpus_allowed_ptr(), put it in a sub-function called
__powernowk8_target() and call it with smp_call_function_single instead
of defining another work item?

Would the workqueue code handle that or are there any other issues?

>  drivers/cpufreq/powernow-k8.c |   89 +++++++++++++++++++++++++-----------------
>  1 file changed, 53 insertions(+), 36 deletions(-)

If it can, the diffstat should look much slimmer.

Thanks.

-- 
Regards/Gruss,
    Boris.
