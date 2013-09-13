From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 063/228] cpufreq: dbx500: Use generic cpufreq routines
Date: Fri, 13 Sep 2013 15:18:41 +0200
Message-ID: <CACRpkdbgpuuSpHpu2-pEvOjd3hB-cqn62Ui6__VFbyNHDLu6+g@mail.gmail.com>
References: <cover.1379063063.git.viresh.kumar@linaro.org>
	<a3970f9a04fd061a7ad476f983e10a8768c89fd0.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <a3970f9a04fd061a7ad476f983e10a8768c89fd0.1379063063.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linaro-kernel <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, cpufreq@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Sep 13, 2013 at 3:00 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> Most of the CPUFreq drivers do similar things in .exit() and .verify() routines
> and .attr. So its better if we have generic routines for them which can be used
> by cpufreq drivers then.
>
> This patch uses these generic routines for this driver.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by. It feels like I acked this before...

Yours,
Linus Walleij
