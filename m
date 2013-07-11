From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [REGRESSION] Commit a66b2e50 "Preserve sysfs files across
 suspend/resume" causes a regression in intel_pstate
Date: Thu, 11 Jul 2013 12:39:24 +0530
Message-ID: <CAOh2x=mK3q339Mnc26VgANTUF1M2zL9pjCsLFbMGbyMWkUmrAQ@mail.gmail.com>
References: <51DD8890.8040008@gmail.com>
	<51DDDDBB.6070105@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=UmuxGN8tkTtT1a5lvnfionKabmWflJzInG/Ub/19zP0=;
        b=pg2k8WqQVf/ztHFppBndF9o1sescIHmguiUmQtz4El0dVTR9RVVNf0gaDNonkPl3aN
         YY5AfaBRPY65zHNsi3guF9l12G5682964jZG1ddiF2GZc4mlCryPr7KeOEWo9sggBiXp
         xFlFlqk1iItn5ZRpPVezc1noF3EtuJTy1aUdbXpci7eXvK+7zCgSLoC7IflTRRZE06L0
         YMXvus5PsvXTdYovY2JGvClpSvU97Q7bigbeNZZpRJBUUpqwgPM9creEobdf1Lf34K8T
         Rwyb9RYbXj968Db2JTM1+WlcC1V7acBn4yMpWgrxW/Zna9msXqmEXUonXGFGN62FmYb1
         aPvw==
In-Reply-To: <51DDDDBB.6070105@linux.vnet.ibm.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, cpufreq <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, durgadoss.r@intel.com, "Jarzmik, Robert" <robert.jarzmik@intel.com>, tianyu.lan@intel.com

On Thu, Jul 11, 2013 at 3:48 AM, Srivatsa S. Bhat
<srivatsa.bhat@linux.vnet.ibm.com> wrote:

I haven't followed the minute details of this patch and will
do that once you post it after testing it a bit.

BTW, I found a funny bug in there :)

>                 kfree(data);
> +
> +               if (remove_sysfs) {
> +                       lock_policy_rwsem_read(cpu);
> +                       kobj = &data->kobj;
> +                       cmp = &data->kobj_unregister;
> +                       unlock_policy_rwsem_read(cpu);
> +                       kobject_put(kobj);

You just freed data and still want to use it later :)
