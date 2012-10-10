From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] cpufreq, powernow-k8: Fix usage of smp_processor_id() in
 preemptible code
Date: Wed, 10 Oct 2012 21:51:17 +0900
Message-ID: <CAOS58YML9s-FJJektV1iFbz-Hr3bCq_RUppZfqb+pbHAJ+tOCA@mail.gmail.com>
References: <20121009193844.GC7724@alberich>
	<20121010124839.GA22448@alberich>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=smlzmun1PL3FPA32HfD907XjA1Yt3gC1PLecKID9eTU=;
        b=zMZuYS7i/nTT3RvMsB8q2Uh1wPTsCTo7G+Cr7bB4AeiuRgLXi5HZ4GL4N2VwgLYXce
         3DFn6fP37YxaRDTUyEzstBFWAktcYYSSGpBto9BGYOr+LWIOz9dzkFc36WV3AgUWrR0F
         ypblgBlL380/XGZaQCMHJVgbFH357RRTh6ffn5uoQfqJ2Lgs8BYNhzP2XousCr5tUjEf
         ReqABvk88cPsV408BWgSvt0pCxWpm1D7dM2MyEB5e5t4JIps9hwCAOjvywjHr2eUiLg3
         ez4H6Cl/ZUe2ajtPuTe+7jFQezAvY075gdYDsDKFLICLe2Q4SY0DhnRb3jWNvQzj3ToG
         m/rg==
In-Reply-To: <20121010124839.GA22448@alberich>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herrmann <andreas.herrmann3@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, stable@vger.kernel.org

Hello,

On Wed, Oct 10, 2012 at 9:48 PM, Andreas Herrmann
<andreas.herrmann3@amd.com> wrote:
> Please ignore my patch. It was insufficiently tested -- sorry for this.
> (powernowk8_target_fn might sleep).
>
> Have to take a closer look how to avoid below issue.

Probably the only thing which can be done is always bouncing to the
percpu work item.

Thanks.

-- 
tejun
