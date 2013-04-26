From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: Fix the driver can not be unloaded issue
Date: Fri, 26 Apr 2013 10:11:01 +0530
Message-ID: <CAKohpon2PHFj4WuGd1wwBLnSC8Fc_VOvWmVoc04278gPKZWsrg@mail.gmail.com>
References: <1366792092-10407-1-git-send-email-Yuantian.Tang@freescale.com>
	<CAKohpomcSP4HegdQfJYDe6UHa6CTuV-G9UCb8QFDxfDvcTzsYw@mail.gmail.com>
	<D07C73A334FF604B95B3CBD2A545D07B0B165120@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAKohpokWAKQDsf-6LrjDnjyKFuuZTsCYCOuiEqsv0wO0i5Ny-A@mail.gmail.com>
	<D07C73A334FF604B95B3CBD2A545D07B0B165358@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAKohponjJ-30omoXJM94TE2Zs=8zT1Vkgcptd6KcvdY_ztqRsw@mail.gmail.com>
	<D07C73A334FF604B95B3CBD2A545D07B0B1656F0@039-SN2MPN1-011.039d.mgd.msft.net>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B0B1656F0@039-SN2MPN1-011.039d.mgd.msft.net>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tang Yuantian-B29983 <B29983@freescale.com>
Cc: "rjw@sisk.pl" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On 26 April 2013 07:09, Tang Yuantian-B29983 <B29983@freescale.com> wrote:
> Exactly.
> Currently, we don't consider the offline cpus when setting policy->cpus.
> Probably other platforms do the same thing.

But this is a requirement of cpufreq framework and drivers must adapt to it.
Let me know which drivers don't meet this requirement and i will get them
fixed.
