From: mark gross <markgross@thegnar.org>
Subject: Re: [PATCH v2 0/8] RFC: CPU frequency min/max as PM QoS params
Date: Fri, 13 Jan 2012 07:24:45 -0800
Message-ID: <20120113152445.GA3005@mgross-G62>
References: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
Reply-To: markgross@thegnar.org
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=zyhFKdgFTkch+HLozP4jFGLGAIYRrkkXM4XL0J4ZXqI=;
        b=qqMgrvuNx8nUIpgvKBC28Lntno+QYm6ZHNXVJpU/V0KfZbUAxTmLoRN/U9/zXS4LGT
         Y3N4n3Q2LJcHQiA98QqFaFY5bzkBzBIKGAC0bEsWKEHkDjdO6NQGRMdzB3k5CQwD/+wC
         U2L32Rchno9jvb3C9joQ7I1CDgw10H0Nb3YT8=
Content-Disposition: inline
In-Reply-To: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: davej@redhat.com, cpufreq@vger.kernel.org, pavel@ucw.cz, rjw@sisk.pl, len.brown@intel.com, linux-pm@vger.kernel.org, mgross@linux.intel.com

just a quick note: ever since I lost my mgross@linux.intel.com email
I've started using markgross@thegnar.org

On Fri, Jan 13, 2012 at 02:59:11PM +0200, Antti P Miettinen wrote:
> The inspiration for this patch series is the N9 CPU frequency boost
> upon input events:
> 
> http://www.spinics.net/lists/cpufreq/msg00667.html
> 
> and the related changes in git://codeaurora.org/kernel/msm.git tree.
> Those patches modify the ondemand cpufreq governor. This patch series
> adds minimum and maximum CPU frequency as PM QoS parameters and
> modifies the cpufreq core to enforce the PM QoS limits. There is also
> an example module for boosting the frequency upon input events.
> 
> I've been testing these changes against Ubuntu 3.2 kernel on a Dell
> E6420 with the ACPI cpufreq driver. The patches are against
> linux-next/master, compile tested against it.
I'll test it this weekend as well.

FWIW if this works the way I hope it does then, its a feature we need
for different reasons than interactivity.  So thanks for working on
this!

> 
> V2:
> * split min and max to separate commits
> * handle PM QoS min above max as max
> * handle PM QoS max below min as min

A qos to constrain how slow the cpu goes is ok.
A qos to constrain how fast it is allowed to go is not a PM_QOS thing.

I'll review the patchset later today.


Thanks!
--mark

> 
> 	--Antti
> 
> Alex Frid (1):
>   PM QoS: Simplify PM QoS expansion/merge
> 
> Antti P Miettinen (7):
>   PM QoS: Add CPU frequency minimum as PM QoS param
>   cpufreq: Export user_policy min/max
>   cpufreq: Preserve sysfs min/max request
>   cpufreq: Enforce PM QoS minimum limit
>   input: CPU frequency booster
>   PM QoS: Add CPU frequency maximum as PM QoS param
>   cpufreq: Enforce PM QoS maximum frequency
> 
>  drivers/cpufreq/cpufreq.c     |   59 +++++++++++++-
>  drivers/input/Kconfig         |    9 ++
>  drivers/input/Makefile        |    1 +
>  drivers/input/input-cfboost.c |  174 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_qos.h        |   19 ++++-
>  kernel/power/qos.c            |   55 ++++++++++----
>  6 files changed, 295 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/input/input-cfboost.c
> 
> -- 
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
