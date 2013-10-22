From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 0/5] ARM: vexpress/TC2: cpufreq support
Date: Tue, 22 Oct 2013 13:52:13 +0530
Message-ID: <CAKohpo=7Z7D9VsF5GHXKTUy70muNSr-q4nf8k8_qzWBzitzmvA@mail.gmail.com>
References: <1382349534-31502-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1382349534-31502-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Nicolas Pitre <nico@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

On 21 October 2013 15:28, Sudeep KarkadaNagesha
<Sudeep.KarkadaNagesha@arm.com> wrote:
> From: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
>
> Hi,
>
> The SPC(Serial Power Controller) on Versatile Express V2P-CA15_A7(TC2)
> not only controls low-power states, wake-up irqs and per-CPU jump addresses
> but also the CPU performance operating points which is essential to provide
> CPU DVFS. The M3 microcontroller can provide upto eight performance values,
> one set for each cluster (CA15 or CA7). Each of this value contains the
> frequency(kHz) and voltage(mV) at that performance level. It expects
> these performance level to be passed through the SPC PERF_LVL registers.
>
> This patch series adds support to populate those OPPs, add them to the
> cpu devices and runtime programming of these performance levels through
> clock framework. It also adds a small interface cpufreq driver to validate
> the OPPs and register the arm_big_little cpufreq driver.
>
> Changes v1->v2:
>         - Introduced ARCH_VEXPRESS_SPC config to make dependency
>           selection cleaner
>         - Other minor review comments from Nico implemented
>
> Regards,
> Sudeep
>
> Sudeep KarkadaNagesha (5):
>   cpufreq: arm-big-little: use clk_get instead of clk_get_sys
>   ARM: vexpress/TC2: add support for CPU DVFS
>   ARM: vexpress/TC2: add cpu clock support
>   cpufreq: arm_big_little: add vexpress SPC interface driver
>   ARM: vexpress/TC2: register vexpress-spc cpufreq device

For All Patches:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
