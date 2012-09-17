From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 3.6-rc6] cpufreq/powernow-k8: workqueue user shouldn't
 migrate the kworker to another CPU
Date: Mon, 17 Sep 2012 13:53:55 -0700
Message-ID: <20120917205355.GK18677@google.com>
References: <20120917201721.GJ18677@google.com>
 <20120917203654.GA6541@liondog.tnic>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=/Mst6b5HVtiYC7CIIOnn739cOkk68N8nMCuGF7kV3tM=;
        b=IeCyCrHQSl+hJ4iNx/DN2ZcFbs9Q3z/CcVWtjn2vFM5IYLB7gEZzMzJjzbCsOnTuea
         8KSV8NDUNdEjfpE+2nelYtSfPhCQgAxIF3C/3HWB7OcGpC+WxcFPdQuxCISND0Xe+Cif
         dx922Zflm5Sur2/f6Tw8Kcl+C4pCAjl6bSqA5QtghspM0vCY5lSg7bluYaorw5XNMnJp
         LmYHcb2+X4XcaSVKk/SMQvtQ6P5plXzS/jSW9YH/8QMR7F4r2537QKzoAHFxE2kHNseq
         QhlGgtYqae8V8dN52yR2Pcbi/oBYU+sxqEz2E08cdmrniomaQMnJ7jKBjwQ8efCtq/dT
         4fDg==
Content-Disposition: inline
In-Reply-To: <20120917203654.GA6541@liondog.tnic>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>, Linus Torvalds <torvalds@linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Duncan <1i5t5.duncan@cox.net>, Andreas Herrmann <andreas.herrmann3@amd.com>

On Mon, Sep 17, 2012 at 10:36:54PM +0200, Borislav Petkov wrote:
> Wouldn't it be much simpler to carve out the piece after
> set_cpus_allowed_ptr(), put it in a sub-function called
> __powernowk8_target() and call it with smp_call_function_single instead
> of defining another work item?
> 
> Would the workqueue code handle that or are there any other issues?

The function grabs a mutex.  smp_call_function wouldn't be too happy
about that.

Thanks.

-- 
tejun
