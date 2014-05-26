From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5 6/7] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Mon, 26 May 2014 11:47:21 +0530
Message-ID: <CAKohpokcvwXTnUGJH6w2vcoR9Kjcu0dN0CRHtpf1Ars10mGgyA@mail.gmail.com>
References: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
	<1400855260-6807-7-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1400855260-6807-7-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

On 23 May 2014 19:57, Thomas Abraham <thomas.ab@samsung.com> wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
>
> Remove the platform device instantiation for Exynos specific cpufreq
> driver and add the platform device for cpufreq-cpu0 driver.
>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
