From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: unicore2: Staticize local symbol
Date: Fri, 9 Aug 2013 22:14:08 +0530
Message-ID: <CAOh2x=nOToVvWVm9=ZF9p4J_HOEJXJZWz--WdH+tKpk2voVsAA@mail.gmail.com>
References: <000701ce94d0$240949e0$6c1bdda0$@samsung.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=36t3zB1ZcOcy8QyIynTAVU0rVw/5CpOLCSOcvrCIrvQ=;
        b=UmDbO4qKosuval7O9HboP0r+QWoc4xd0KZtFmKwrZXZo+OXGDKeFFnC1PqRBQo7Yv8
         zBrFRi/A4GDEU0YKsz44Lr2z/NpVXg4m3R2UYIJ4GbwY1cxdlR0ak43OYcVi2xmmq5J+
         Ts28MnN1R07fmVt1N8zHjTTUfdLaqoqkxdDUuCfjXWFu5hO49zqAyiUmrk2meQcibQ6F
         ThtBSJ4oRkWp1GBjzYDxPohMkg72CUmh0hjCqRFcuH47EebX//sgVxypMRFhmu7Q1TA9
         +EaTIAwx2uajB2J29J6eE3JWmFDYFoi0/QKNPKL314KRz/nxoBvXRs9AOKro+lsjIn7b
         UxGg==
In-Reply-To: <000701ce94d0$240949e0$6c1bdda0$@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jingoo Han <jg1.han@samsung.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>

On Fri, Aug 9, 2013 at 12:44 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> This local symbol is used only in this file.
> Fix the following sparse warnings:
>
> drivers/cpufreq/unicore2-cpufreq.c:27:5: warning: symbol 'ucv2_verify_speed' was not declared. Should it be static?
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/cpufreq/unicore2-cpufreq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
