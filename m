From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3.6-rc6] cpufreq/powernow-k8: workqueue user shouldn't
 migrate the kworker to another CPU
Date: Mon, 17 Sep 2012 23:22:02 +0200
Message-ID: <20120917212202.GB6541@liondog.tnic>
References: <20120917201721.GJ18677@google.com>
 <20120917203654.GA6541@liondog.tnic>
 <20120917205355.GK18677@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1347916923; bh=5jXBn8t8s+jjM5zXAcAVk8Hk0ukkC1AmXkVkwvvBFT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=QAtH0TPoZNBiUOEA6f0TFaKIn/WHOK17VWEFP9
	9PJZrZoTlI4VyPFcFtoTfPIgyynnxcblBnjJSe0HYvvl7e7KIDdtibMHo1Qjt+F+Ep8
	H70JWdUw72N0gdpk4ewpGt3vBZIGAnqA4Df/kPgv8lqfYPimu5htbI9qq2XNYfrM9g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1347916923; bh=5jXBn8t8s+jjM5zXAcAVk8Hk0ukkC1AmXkVkwvvBFT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=QAtH0TPoZNBiUOEA6f0TFaKIn/WHOK17VWEFP9
	9PJZrZoTlI4VyPFcFtoTfPIgyynnxcblBnjJSe0HYvvl7e7KIDdtibMHo1Qjt+F+Ep8
	H70JWdUw72N0gdpk4ewpGt3vBZIGAnqA4Df/kPgv8lqfYPimu5htbI9qq2XNYfrM9g=
Content-Disposition: inline
In-Reply-To: <20120917205355.GK18677@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Duncan <1i5t5.duncan@cox.net>, Andreas Herrmann <andreas.herrmann3@amd.com>

On Mon, Sep 17, 2012 at 01:53:55PM -0700, Tejun Heo wrote:
> On Mon, Sep 17, 2012 at 10:36:54PM +0200, Borislav Petkov wrote:
> > Wouldn't it be much simpler to carve out the piece after
> > set_cpus_allowed_ptr(), put it in a sub-function called
> > __powernowk8_target() and call it with smp_call_function_single instead
> > of defining another work item?
> > 
> > Would the workqueue code handle that or are there any other issues?
> 
> The function grabs a mutex.  smp_call_function wouldn't be too happy
> about that.

Yes indeed.

Thanks.

-- 
Regards/Gruss,
    Boris.
