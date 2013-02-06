From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/7] cpufreq: Don't remove sysfs link for policy->cpu
Date: Wed, 6 Feb 2013 07:12:10 +0530
Message-ID: <CAOh2x=n4NJhM3_JBpbOgbuOiFkh_fB+cshYcvCeBxUphXLNdRA@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-2-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=pHYICncfytaIAug+odrxtA0kcR6EeGgqfnX9FdbsdMg=;
        b=gD1ozIsBDX0d40wBzs/qNsn9oUoSepf/p9n5kyiogFxg869vWtPesnBZlKAU8wtsFa
         dBKjjD92z721juDx7QUbEiHfkEQsyDYgT9QeOXEim0yecy6wOW234bESqXprFJKmi6Sy
         9aAnhWNf06nCbn9P7EHDCFXVPGxI2t883dFx/GyIfPF59sld0sDXHPq90Ju84sref7FH
         QGv86GsqGrgE8bvzn4NqPStM6HQKJnmfgkZXS0/KPeBiZ30kMigbNBkvywyMB8B0qigt
         uuI+RR9lNz65r2bP0Zf5NsVt0FRTDcgZDRXytXSQEaJXIjIQJi0Viv49RhFGp6VvxdFk
         as/Q==
In-Reply-To: <1360088646-19104-2-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Viresh Kumar <viresh.kumar@linaro.org>
>
> "cpufreq" directory in policy->cpu is never created using sysfs_create_link(),
> but using kobject_init_and_add(). And so we shouldn't call sysfs_remove_link()
> for policy->cpu(). sysfs stuff for policy->cpu is automatically removed when we
> call kobject_put() for dying policy.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Tested-by: Dirk Brandewie <dirk.brandewie@gmail.com>

Its already included by Rafael, don't include it in your next version:

commit 73bf0fc2b03d1f4fdada0ec430dc20bfb089cfd5
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Tue Feb 5 22:21:14 2013 +0100

    cpufreq: Don't remove sysfs link for policy->cpu

    "cpufreq" directory in policy->cpu is never created using
    sysfs_create_link(), but using kobject_init_and_add(). And so we
    shouldn't call sysfs_remove_link() for policy->cpu().  sysfs stuff
    for policy->cpu is automatically removed when we call kobject_put()
    for dying policy.

    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Tested-by: Dirk Brandewie <dirk.brandewie@gmail.com>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
