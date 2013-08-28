From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/16] cpufreq: dbx500: use cpufreq_generic_get() routine
Date: Wed, 28 Aug 2013 14:14:27 +0200
Message-ID: <CACRpkdZjtP8Fv0-wkqo-TFU+iwrm2w3WQ14sHy-n07XZMPdcHQ@mail.gmail.com>
References: <cover.1377272740.git.viresh.kumar@linaro.org>
	<5f8581601947988a49c36f465e36028758539cc0.1377272740.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <5f8581601947988a49c36f465e36028758539cc0.1377272740.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linaro-kernel <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, cpufreq@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 23, 2013 at 5:50 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> We have common infrastructure available with us for getting a CPUs clk rate.
> Lets use it for this driver.
>
> We don't have to find closest frequency in platform specific ->get() routine
> wihch dbx500 driver was doing and hence it can be removed as well.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
