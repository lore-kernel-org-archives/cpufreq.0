From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: Convert the cpufreq_driver_lock to a rwlock
Date: Tue, 5 Feb 2013 13:41:59 +0530
Message-ID: <CAOh2x=kwADoQTv4jA9gcrVUyCP5HvA4FyZp7kfpB8nptgs+8UA@mail.gmail.com>
References: <1360017913-25667-1-git-send-email-nzimmer@sgi.com>
	<1360017913-25667-2-git-send-email-nzimmer@sgi.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=jz2ggaBGNWe6p38695XYp6NlgcQg46Oh771CZl01wtA=;
        b=CTBHlPUv7w3JMvt5C4sXRhO5fWcaXKij8SLbTWj58Ds13FTz41+DqJNlz21tJLEy8m
         FcZ8vo6jPjwMDitunfzhkv/Qn6ppzcsTCXY7f9yvb8FiyLwmhp0JpqOpUg/pXCvZRTLc
         FHNy1zWMhCoVVi2B6MzDdGr0lhgpTAItMpfNS9A/xRvt2ewQQuaWlTNn31t9hs9q8ggd
         kTeGb9KLsJbdV5mVOK3IzyJYLqOd5SMhNy4uHZXN1DaCJpI5Jj4D4FQJzzyR8b25SxCc
         Yph0NTjHOI4t+KbZ8XU0jfnH3gGj6FL7TtQo3TY92brqkRU/eml4K0rgOsXrkMnTO4Of
         GHaA==
In-Reply-To: <1360017913-25667-2-git-send-email-nzimmer@sgi.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Zimmer <nzimmer@sgi.com>
Cc: rjw@sisk.pl, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org

On Tue, Feb 5, 2013 at 4:15 AM, Nathan Zimmer <nzimmer@sgi.com> wrote:
> This completely eliminates the contention I am seeing in __cpufreq_cpu_get.
> It also nicely stages the lock to be replaced by the rcu.
>
> CC: "Rafael J. Wysocki" <rjw@sisk.pl>
> Signed-off-by: Nathan Zimmer <nzimmer@sgi.com>
> ---
>  drivers/cpufreq/cpufreq.c | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

You have rebased it against an old version of this file. Please rebase it on
latest Rafael's linux-next branch.

The patch looks good otherwise.
