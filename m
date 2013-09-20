From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH] cpufreq: return EEXIST instead of EBUSY for second registering
Date: Thu, 19 Sep 2013 22:30:04 -0700
Message-ID: <CAE9FiQU5PD4asdE3=sBSnLK8fwPT8vK81FAOuYtAWj_3ruyS0g@mail.gmail.com>
References: <1379563520-7221-1-git-send-email-yinghai@kernel.org>
	<CAKohpomt+sASL=2i-v=HSkhOZhbPmnFesEfPoEqSE+WKcCfnmw@mail.gmail.com>
	<11319698.mBBnJVdnIk@vostro.rjw.lan>
	<CAE9FiQXP3DARdJYHBS8w0ATVM78Q9tGTd=8CeMJiwozBU0F_OA@mail.gmail.com>
	<CAKohpom-3orEns00DC2=uk4pgV_xnfRpM1hrdyK9pjPUEgBXrA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=CpvmDGtXYnCMfFby6LqClX6/Vvd/67mREmLWyZ7G0MM=;
        b=sjDhxxBJ1GVHRcPqaLA697w8VuQjuAkH5Yew6ATbbP692nKXp1KEOyEtQJySwmIFs0
         +yUubUl2Ops+Ehvia1ssKr1VDFnOhuH2hFYkrb+UABweEqGTKRCf3FqL4ihFwXmtEkeh
         0/7T9kIWZ8iN3CUGjHSx6dBAxH0QmUnIYxB/MrvUHls0edfwUp/6LVWU4xn7H1gerl9z
         zgP0SiNBOMh8kpLU7vPrQWkc8P+Wf3b1cSxtWtc25NJb+uJcTEKI4WrcoBUlO2a0gedK
         TqrSbzKX5+KH3lfR5nt0jkXuM9OICpIo0csLw2ilf/2OUm5RJeeeEgxPtgcmVmF/ceAU
         8sLw==
In-Reply-To: <CAKohpom-3orEns00DC2=uk4pgV_xnfRpM1hrdyK9pjPUEgBXrA@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Sep 19, 2013 at 9:23 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 20 September 2013 07:01, Yinghai Lu <yinghai@kernel.org> wrote:
>> Sorry,  looks like this one is not enough.
>>
>> please let me know if you prefer me send addon patch
>> or revised one.
>
> Atleast you can let us know what the problem is? And then we
> can decide on that.. But anyway, you can send a new patch
> based over latest linux-next (which will have your original patch),
> and then leave it onto Rafael to merge it or have two patches..
> (though I am quite sure he will not drop anything now, unless its
> too screwed.., at worst he might revert it..)..

looks like the crash is intermittent..., so i thought that patch fixed
the problem.
but later I found other suspicious print out.

please check new one:

https://patchwork.kernel.org/patch/2915181/

Thanks

Yinghai
