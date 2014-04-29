From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: time_in_state on Ubuntu 13.10
Date: Tue, 29 Apr 2014 09:58:14 +0530
Message-ID: <CAOh2x==Q_oDn9v4S5ggh_e-3_=vSU_5Ko_89LfWM9ARBS9i=Rg@mail.gmail.com>
References: <535E6906.2090201@unine.ch>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=rJQupBIqwxE7EeyZTYQGnpHIF+5Tn1ATAyVSVke7G/A=;
        b=gIKH7BAh6NWdgqcANgzUwy0kEBdHi2ANccxtCBL9zmGi/9Oqm2fxWux+iphx6SasG5
         SyshWtnEUVtibdc+mNVqoNfaaSm8ZZr/AlUiFbQ23vWxA4Xx6WwgbSMBgy+lJRnZ53s0
         xSkctZ4iF4HUQOPtzSISL/dCymzGPeRN9cX5ScJpsTMZvQyN9EHLBN0Ifg3DKgLnKM5s
         etcdSpkRoVf8xcVVcYnnzNV1gO0KXyzgSBWcOiubd+PIOUxY1xuf7Ds9c8Eq3kGFEQjf
         0GXvLhAqvUbBdnSwZLuiK4hSugaUj9RHBOVrkfaXD+Oir+1Us0aHaiv8xhFTG8kwxjes
         L9dg==
In-Reply-To: <535E6906.2090201@unine.ch>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mascha Kurpicz <mascha.kurpicz@unine.ch>, Linux PM list <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Maxime Colmant <maxime.colmant@inria.fr>

On Mon, Apr 28, 2014 at 8:13 PM, Mascha Kurpicz <mascha.kurpicz@unine.ch> wrote:
> First of all I would like to thank for the cpufreq utility that I use
> regularly.
>
> Unfortunately, when upgrading our systems from Ubuntu 12.04 to 13.10, we
> are encountering some issues with the data in
> /sys/devices/system/cpu/cpu*/cpufreq/stats/time_in_state.
>
> On some of the machines, the values are all set to 0 [1], whereas on
> other machines, values are 0 or very small [2]. In both cases, the
> output of cpufreq-info for the cpufreq stats is not correct. When
> running Ubuntu 12.04, we get reasonable values.
>
> We noticed this behavior on Intel i3 machines, and on Intel Xeon. Kernel
> version in all cases is 3.11.0-20-generic.

Do you mean that kernel version is same for 12.04 and 13.10? We need
kernel versions for these two bases.
