From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] cpufreq, powernow-k8: Remove usage of smp_processor_id()
 in preemptible code
Date: Sun, 14 Oct 2012 17:40:55 +0200
Message-ID: <20121014154055.GB25734@liondog.tnic>
References: <20121009193844.GC7724@alberich>
 <20121010124839.GA22448@alberich>
 <20121012151841.GA4571@alberich>
 <27008283.MeT6T60WP8@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1350229257; bh=tTqXXgwQeWeYvjEuU20Tu8jYAxmLYNqRia6AL4SxmNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=LBiR75xNSRMOwtZD1xOb8ibcutYPo83kKIefCG
	lr3UMtT5vaSk1DZy7PtaEfTOasH2NUO5UEyu5RegyS4iE6WyjTDDBS/DEO7tVOVeksh
	BJjz98bob33pLraESSq9rCFnVnhTq+lV5m7NDvpF3iVcaYcl0p7OI+BXxv7mBcUeJY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1350229256; bh=tTqXXgwQeWeYvjEuU20Tu8jYAxmLYNqRia6AL4SxmNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=gLAxgYLUcSh9yawGAPxom6MMofIKLVIQSBdv+G
	ZoFxodQ3D9xMsviFrOyMLlQ4vq47pmfIKZ9JZsyydPnPhP0ShXsgyLtzIlOV8SPJMjp
	4tEIsPAQ+q4BruWE1QF6+woRrFIXZ3Oz7KJMGHui+WOPLzyhXPZOuRA4SIDVejf4dQ=
Content-Disposition: inline
In-Reply-To: <27008283.MeT6T60WP8@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-pm@vger.kernel.org

On Sun, Oct 14, 2012 at 10:27:22AM +0200, Rafael J. Wysocki wrote:
> Hi,
> 
> Thanks for the patch!  I'll queue it up for v3.7 when I get back home from
> the current trip (around the -rc3 time frame I suppose).
> 
> In future please don't send patches directly to stable@vger.kernel.org.
> That doesn't make -stable pick them up anyway and confuses things.

That happens anyway if you tag the patch for stable and use git
send-email. Unless you go the extra mile and filter out the cc list,
which is tedious.

Besides, I'm pretty sure stable maintainers verify a patch is actually
upstream before applying it anyway.

-- 
Regards/Gruss,
    Boris.
