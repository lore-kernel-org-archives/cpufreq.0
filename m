From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 07/18] cpufreq: s3c24xx: move cpufreq driver to drivers/cpufreq
Date: Fri, 26 Apr 2013 01:48:19 +0900
Message-ID: <51795E53.5030908@samsung.com>
References: <cover.1365079581.git.viresh.kumar@linaro.org> <1769336.FkfMpuXqqb@vostro.rjw.lan> <5176A807.2090005@samsung.com> <2264237.NUtkmvZG3W@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=+3cDhP4YWm2cM94TP9LsinkULBwfxENRxDFnPAYFSYw=;
        b=AzbOfo4sQZOR4xbZYTkOuMQZ7pElbMxKEZxuePldQ2aQxdx1T1rzXWGapgX1XCkiCm
         ymJxW1/D/lhqB13nniDN+faWhQoCJ4q5ybVn88f9bDoJ79tBqdl8hyGluVKhPlzvNpJf
         4oe47+TdldwOdvNaQ/C8r0lXc02eySIyAGoxVu9teW0I3FJZQbcNxzFVpXP06Lu1AbFL
         2+E81mb3Nw27Eh3abmMLvDNa0x2FgoXXSaHfphTDKp4ovyOeCQeTwRhA2bIfdAZtixMk
         HRxmOUGiBkcjpW6rBfwrCChbG8m+jyq0UPK1iJcK3UMaQOB9ag+HpMwO1te2stV+NCXs
         vAUw==
In-Reply-To: <2264237.NUtkmvZG3W@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, robin.randhawa@arm.com, Ben Dooks <ben-linux@fluff.org>, linux-pm@vger.kernel.org, patches@linaro.org, Liviu.Dudau@arm.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Steve.Bannister@arm.com, arvind.chauhan@arm.com, linaro-kernel@lists.linaro.org, charles.garcia-tobin@arm.com

On 04/24/13 07:59, Rafael J. Wysocki wrote:

[...]

>> Rafael, please take this patch with my ack in your tree, sorry for noise.
>>
>> Acked-by: Kukjin Kim<kgene.kim@samsung.com>
>>
>> If any problems, please kindly let me know.
>
> Well, I suppose I can take the original patch, but then it will conflict with
> your tree during merge.  Is that not a problem?
>
I think, some conflicts can be occurred but if so, we can fix it before 
merge window.

- Kukjin
