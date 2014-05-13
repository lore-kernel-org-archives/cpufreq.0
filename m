From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH 0/2] PM / OPP: move cpufreq specific helpers out of OPP layer
Date: Tue, 13 May 2014 23:59:01 +0530
Message-ID: <CAJuA9agOJyQ_2KOoyn=ohVOeO199aVqm_YXtpUVfETQiPk+ZTw@mail.gmail.com>
References: <1399296830-13056-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=kc8dB155fCqgimby0khgqS4nKcNAKuV4jTigH4i8T5c=;
        b=EF4YfyBGb8U3ZoPqRNSRW5N2XWWal8cJSbaSU7mQlNEzJS8YWbaaW95yyOqju2+bHX
         t/R/JZ1pcwhQYPJWvmUz1hJUmxE6rnpZbsEX4DbSdUkzzOKbdwXymbUuuOLl9WDLtNM3
         Egvg3tDWwFbTU0An+Vbilxrej9lGDwdOz0RSAIkS9yS3Fw6dO4Wc4+843/mxMJpKFWJk
         E4bscPrTTs+TBinXS0sP8WURzZYHnPE1vvAWvC/URVZVEjDuNb97QuZ48otz0uoPgYB/
         q7/EQ3jSsTyNJvsCJxF/XVEXdpYRzQYZVjYZhRYtVy3gGqtuWvF+aHzavednHgNyah61
         sE8A==
In-Reply-To: <1399296830-13056-1-git-send-email-nm@ti.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishanth Menon <nm@ti.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-kernel@vger.kernel.org

On Mon, May 5, 2014 at 7:03 PM, Nishanth Menon <nm@ti.com> wrote:
> CPUFreq usage of OPP should be independent of the ordering of type of
> data storage inside OPP layer. The current operations can equally be
> performed by generic operations.
>
> [RFC]: https://patchwork.kernel.org/patch/4100811/
>
> Series based on: v3.15-rc1
>
> Nishanth Menon (2):
>   PM / OPP: Remove cpufreq wrapper dependency on internal data
>     organization
>   PM / OPP: Move cpufreq specific OPP functions out of generic OPP
>     library
>
>  Documentation/cpu-freq/core.txt |   29 +++++++++++
>  Documentation/power/opp.txt     |   40 ++------------
>  drivers/base/power/opp.c        |   91 --------------------------------
>  drivers/cpufreq/Makefile        |    2 +
>  drivers/cpufreq/cpufreq_opp.c   |  110 +++++++++++++++++++++++++++++++++++++++
>  include/linux/cpufreq.h         |   21 ++++++++
>  include/linux/pm_opp.h          |   20 -------
>  7 files changed, 167 insertions(+), 146 deletions(-)
>  create mode 100644 drivers/cpufreq/cpufreq_opp.c

Works fine on Exynos.
Tested-by: Thomas Abraham <thomas.ab@samsung.com>

>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
