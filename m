From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 0/7] cpufreq: use cpufreq-cpu0 driver for exynos based
 platforms
Date: Mon, 26 May 2014 03:12:25 +0200
Message-ID: <538294F9.2060508@gmail.com>
References: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com> <5382739A.60800@samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WbvYgUaPFsFEI+Gk6DsQpyEehkwJk/NeBXK9b0RUfeg=;
        b=0vlg+CCTI7JZUJ9THDzzxDTdUz4yhvDbdaGOhARpehDZoVC0OszY9Tgp/RdjFIR/XQ
         Vo7bfCcC+G1Px0hQYlh7dkJCxylxZhPOMAanqL9m5tGa9ciXnPmLjZPtOOSBx+U3pHyM
         8IH1IWkUeSw9C//iar/QCLvT5T6nI01hM5QMonwn6/PwqcCrDCCiudGxWQ4rBMffX5fV
         UUjAiL7Gvx0+ePJ+blM7MrFmZNs8kbbvfJHmFQODSfwrcrcX92In/OFyZtnRNroIhivj
         1eVaCc27+ZnNJruHSehX7fyFR+05CXAtfeR9q7YpmeX36jSfrVcfERNhfSR2VZP9Imfg
         4Jpg==
In-Reply-To: <5382739A.60800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>
Cc: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de

Hi Kukjin,

On 26.05.2014 00:50, Kukjin Kim wrote:
> On 05/23/14 23:27, Thomas Abraham wrote:
>> Changes since v4:
>> - Various changes in clock code suggested by Tomasz
>> Figa<t.figa@samsung.com>
>> - This series depends on mutiple other patches
>>    [a] patch that introduces read-only attribute for clock dividers.
>>        -
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-May/259264.html
>>
>>    [b] the series "PM / OPP: move cpufreq specific helpers out of OPP
>> layer"
>>        -
>> https://www.mail-archive.com/linux-omap@vger.kernel.org/msg104610.html
>>    [c] the series "cpufreq: opp: Add device tree based lookup of boost
>> mode frequency"
>>        - http://www.spinics.net/lists/arm-kernel/msg334336.html
>>
> This series looks good to me after quick loking at but as I replied on
> other thread, I'm not sure above changes are ready for 3.16 or not...
> 
> Maybe we can revisit this series for 3.17?...hmm...

Also two more issues:

1) DT bindings are not acked by DT maintainers,
2) there are my comments to DT bindings from v4 not addressed.

There are also several comments about the code of v4 not addressed, but
this is not that important, as opposed to DT bindings which are supposed
to be stable ABI.

Still, I don't think this is a big deal anymore, as we can have cpufreq
working with multiplatform with my hack patch and polish the
implementation of this series without any hurry.

Best regards,
Tomasz
