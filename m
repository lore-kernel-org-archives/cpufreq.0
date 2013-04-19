From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] cpufreq: exynos: allow disabling cpufreq drivers
Date: Fri, 19 Apr 2013 22:37:36 +0200
Message-ID: <5171AB10.5070702@gmail.com>
References: <201304191554.29679.arnd@arndb.de> <51717623.2060709@samsung.com> <201304192059.38606.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=U1Jo2G/dwmVq1pDwvsSixITHQDsOLJjRIag8poXkyzY=;
        b=Vt8UZJzom/ghtKZJGCz/lciC0qc9zhp3Bb0sFSdBSAYz4QBCvWoCd2bUYr/oLGOn/L
         J0da/cFyF6WK16gMUaq0zPK9f9DeK2azuB+fhcILprRoourfiHsRpC8tRXjbn/AwKvBe
         kQRHLAySBn0WS9EuYqBmiYh28gfdYwSCPno3/l4Hch4ZGUqZZoT0jgjH9SjCfZ4echxa
         UMMnguEDdNCQr3GkXdMpWm3ngVPwTSGFuon9+Hf8bKbgxogMjpdUPhBweibB2UROcZN+
         i5oBuJ2IWEiUbvv81vdzjVnVwNynZjqI9GjbWwMj2Sj93A1j0jW1ipQQmrHAaiVuy2+6
         m9vw==
In-Reply-To: <201304192059.38606.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, cpufreq@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>

On 04/19/2013 08:59 PM, Arnd Bergmann wrote:
> Maybe you just didn't have CPUFREQ enabled? I also didn't notice this
> bug at first because it is turned off in the defconfigs.

I certainly had it enabled. Since I remember I needed to turn it off
temporarily after someone has introduced an incorrect change to the clock
tree definition and cpufreq was unexpectedly switching parents of one of
the root clocks at run time, which was causing malfunction of the camera
image processing chain.

Anyway this wasn't a clean mainline kernel, as there have been recently lot
of stuff pending upstream needed to have complete system with dt support.
I assume after 3.10 release the situation is going to be much better.

> It could also be working by chance on EXYNOS4, since the register
> definitions were not actually removed from the regs-clk.h header
> for those.

That's most likely what happened.


Thanks,
Sylwester
