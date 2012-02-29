From: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 1/2] ARM: add cpufreq transiton notifier to adjust
 loops_per_jiffy for smp
Date: Wed, 29 Feb 2012 14:12:09 +0530
Message-ID: <CAMQu2gxwb8=Pn6tp6SCc+G=juUUtfXfe5wuLAD8f0fDVJqwpEA@mail.gmail.com>
References: <1330499895-12364-1-git-send-email-richard.zhao@linaro.org> <1330499895-12364-2-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1330499895-12364-2-git-send-email-richard.zhao@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, linux@arm.linux.org.uk, davej@redhat.com, will.deacon@arm.com, catalin.marinas@arm.com, davidb@codeaurora.org, arnd@arndb.de, linux-omap@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

On Wed, Feb 29, 2012 at 12:48 PM, Richard Zhao <richard.zhao@linaro.org> wrote:
> If CONFIG_SMP, cpufreq skips loops_per_jiffy update, because different
> arch has different per-cpu loops_per_jiffy definition.
>
> Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
