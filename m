From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] drivers/cpufreq: delete non-required instances of include <linux/init.h>
Date: Thu, 9 Jan 2014 21:09:00 +0530
Message-ID: <CAOh2x=nh5xB49toyWZOf_voEAeBjjNX5CfgyLpL+V5W+Jeo4bw@mail.gmail.com>
References: <1389280207-11846-1-git-send-email-paul.gortmaker@windriver.com>
	<CAOh2x=mfQ1qoWBW3=kwML0aLYu60v107svb4knYwTwsSXTzEaQ@mail.gmail.com>
	<52CEBF9C.10604@windriver.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=iBJkaYKF9mMSMpvFOqvv/csUghFHV6dTIFHtvr2v4e4=;
        b=VQbkpfwBiLz/Uy11jrCBkaNLs/zqk+U/FnUQxPj9RPTmYpql04XEaQPP7CRnrL0bVq
         irP2+Mgi6EWFqEgyooo2wflflLi5sFZl/KxUbNDoDaNAGGgB9Uuk2FcoUpVgkooLNhKH
         CtiTnf+biiHjlFTNIkRonpFznQldez4CS4Vc91k3JAuHVCBw0gDczsVnELiKxr30UPCV
         5e2U+boISoyeCQS548BOfp1mDKW8XngPC8BWvA4KMUMQUeTGzKDtP+gZ6Ob9KqFAUXWb
         b2B5ehL7ZrjMlPCrS0ByzkhCT1WUwwtUDaprAlp9cWK3fSi1Ir7TVBjFWQVCENjH59zw
         27VQ==
In-Reply-To: <52CEBF9C.10604@windriver.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

On Thu, Jan 9, 2014 at 8:56 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Yes I am sure.  I start with this:
>
> -------------
> #!/bin/bash
>
> if [ "$1" = "" ]; then
>         echo must supply path name
>         exit 1
> fi
>
> for i in `git grep -l linux/init.h $1` ; do
>         grep -q '__ref\|__init\|__cpuinit\|__meminit\|__MEMINIT\|__CPUINIT\|__INIT\|__REF\|__HEAD' $i

You missed all initcalls here.

>         if [ $? != 0 ] ; then
>                 echo $i
>                 sed -i '/linux\/init.h/d' $i
>         fi
> done
> --------------
>
> which as you can see whitelists any real users, and then I
> follow up with build testing to double check.

That might have passed because init.h is still included indirectly.

These are the usages which I can see easily, there might be
others too..

 drivers/cpufreq/powernow-k8.c: late_initcall and module_exit
 drivers/cpufreq/s3c2412-cpufreq.c: arch_initcall
 drivers/cpufreq/s3c2440-cpufreq.c: subsys_initcall
 drivers/cpufreq/spear-cpufreq.c: late_initcall

> I will note that
> in this particular case, I couldn't find an ARM defconfig that
> actually enabled any CONFIG_ARM_S3C24xx options though.

Haven't looked into this for now :(
