From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH] drivers:cpufreq:unicore32: fix typo issue for 'clk'
Date: Tue, 08 Apr 2014 12:39:45 +0800
Message-ID: <53437D91.8070504@gmail.com>
References: <53429445.5000005@gmail.com>	<CAKohpok189SxuJoGNvgshwEaUozMDM9mzA8wse5COkN8MBUaPg@mail.gmail.com>	<53434A4E.2050407@gmail.com> <CAKohponSStjFJyKt7Yy7EX1wfk3xbJxoXpt47qStcSGfQVK7aw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1nrfOJoPpiNQ0x3lBJ0EvZCcSPrcboIMxCKTytj3wts=;
        b=v0Pvf6vwMbeZH89ilipk5SHqgfgAu+ctwCAvQZgOsd6XOWnsf3cBZJ/3RJdh3vRDV7
         iOWt4bCsNP/C5jtu20EqlQLzcO+aKotR5ZThw5Mz58xd9SiZZ6Zc85suL5a69PoBc4nW
         Ki7A+mnRhcKijiOmS2MI/ugTnafEq/VBOFMc9CglXiH0SDAM81OKlV0Hk5rQ18k8ndQv
         zhXGvhhy4UekyrKDh2KVJHQJ5DSQrPFAyTt49TNahGymdXaIuulV0jzYE+3QzO7OqiNN
         Sp+8PLdPx6/vZd5knN2Vv3xD3chJ8ZX6yg45wSFzlV11FVViPKnGSNyrPYWU8NmlsMFV
         AWMQ==
In-Reply-To: <CAKohponSStjFJyKt7Yy7EX1wfk3xbJxoXpt47qStcSGfQVK7aw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org

On 04/08/2014 12:08 PM, Viresh Kumar wrote:
> On 8 April 2014 06:31, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>> @stable: please apply this for v3.14, as it broke in that cycle..
> 
> This wouldn't work..
> 
>> Thank you.
> 
> Can you please send it again for stable as well? Add my Ack in the patch
> and follow what's mentioned here:
> 
> Documentation/stable_kernel_rules.txt
> 

OK, I will/should try within this week, thanks.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
