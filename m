From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 0/2] Support cpufreq driver for Exynos3250
Date: Sat, 19 Apr 2014 22:43:20 +0900
Message-ID: <CAGTfZH1M9h3Sx73wJsD=_vnSyV-+fyOY041PN_7ea718B0mFoQ@mail.gmail.com>
References: <1397787634-9334-1-git-send-email-cw00.choi@samsung.com>
	<CAK9yfHygoHZ7hnAcLuuaMEsPb8Tqw-QbcTrQ+b=2CD6kK3odmw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=1DYfIFXyh2ONWtfSEpYuQGvCsb5LuKgTFZ0bw8UWKR0=;
        b=AYJFQ7dgsIQgbSxYGlZqV+F5p7tBzJgq9VC1g21W+Ti5Q8hidm6KCN0st472kV8Nes
         IL4vZ+RsvaugYEeaa/e+mODOT0wgGZNBdb65ovgmqotT0sEC+earYAvkuUmzv2x/uJI4
         R9FFZGv6ysSM6h4+GQ924mGg17XazYoI9jimCt3L9qraTgam/RQbCVgOxDuMjGuO39bX
         7GpQrSur/w6KUPnjlU+LlQvJEoCGgCOowKev+3nkVlDWGC/Hm2Vf1fbZhebuCWZwD3ol
         xcrXb5V2OAhP7uiFEol2ULmahYHSvUg1gbwS3Jt11ZS9sVLfXn/dwYKClgwK03km5hKx
         NGlg==
In-Reply-To: <CAK9yfHygoHZ7hnAcLuuaMEsPb8Tqw-QbcTrQ+b=2CD6kK3odmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, LKML <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Sachin,

On Fri, Apr 18, 2014 at 5:14 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Chanwoo,
>
> On 18 April 2014 07:50, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patchset support cpufreq driver for Exynos3250 which uses the Cortex-A7
>> dual cores and has a target speed of 1.0 GHz and code clean using dev_err/info
>> instead of pr_err/info function.
>
> Per SoC cpufreq driver which does not use CCF is no more encouraged for new
> Exynos platforms. Thomas has already posted patches to make use of
> generic cpu freq driver
> on Exynos platforms. Please refer to [1] and try to utilize it for
> this platform as well.
>
> [1] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/26886

OK, I'll refer to this new patch for cpufreq and rebase it.

Thanks for your reply.

Best Regards,
Chanwoo Choi
