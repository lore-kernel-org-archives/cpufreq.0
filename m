From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Wed, 14 May 2014 19:48:06 +0530
Message-ID: <CAJuA9ahiOz6heULQLaKZyB=2auXRmKmC6N1oMVTa3RENiPbR7g@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
	<CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
	<20140514081739.0b66587e@amdc2363>
	<CAKohpomdjDDBjuPcAsaCcavvVgcX5977gDWyjeqmULadq_Pw8w@mail.gmail.com>
	<CAJuA9ajtCAGpBkSBH64bpTAbZKqPHTiDBFspuoXE1MSLyOyRPw@mail.gmail.com>
	<CAKohpo=yLtGB=N2BrZuMGOrs_6Y06ULGfMwSkxQHV2r831bVgg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=vl3omC+JzMoMRmG7Dc0a8Dx6JiVUSpVleh7yvvofQck=;
        b=BcMA6SXSeHf7aHSGq44KIghJF69TTndZEAlntNClVZnILlHT5SfeWBhgih1eEE2pln
         Hpth7v4zN877jmClwuzGujJJ/VWFvvqHZvr45GTnEG7LxgqUmtBHmB2vzwLseOQtNLC1
         LcvpsBAL6MUhRcj3h4e2lyEVXLGrzI9SBNJO1zlG2FevhdiljhO9rVBasTAuQCQk7d/q
         NZbmJx6Vgq3fK9BBX7zoXhomamdfwSqrlbautcrgSSFrlXbNYaH+NY9jbRUv3nlfQA5q
         fw1uaiwPSzVMlq9i4WHjkvNOYZU2BcYjESrpjJzrpInA4BvCFcpnuSKEuo9tPgZz44lB
         B1DA==
In-Reply-To: <CAKohpo=yLtGB=N2BrZuMGOrs_6Y06ULGfMwSkxQHV2r831bVgg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Lukasz Majewski <l.majewski@samsung.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

On Wed, May 14, 2014 at 7:20 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 14 May 2014 19:13, Thomas Abraham <ta.omasab@gmail.com> wrote:
>> Okay, so you are suggesting that Kconfig entry used to select
>> cpufreq-cpu0 should also enable CPU_FREQ_BOOST_SW config as well.
>
> I never said that... That should be enabled by your defconfig instead.
> What I said was, don't put code within any #ifdefs in cpufreq-cpu0.

Okay, I get the point about #ifdef in cpufreq-cpu0. What about your
earlier comment about the new Kconfig entry ("Get rid of this.. just
not required.")? The new Kconfig entry would be needed in that case.
