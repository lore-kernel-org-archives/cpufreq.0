From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/8] clk: ux500: Fixup smp_twd clk for clk notifiers
Date: Thu, 11 Oct 2012 14:44:58 +0100
Message-ID: <20121011134458.GB15428@gmail.com>
References: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ulf Hansson <ulf.hansson@stericsson.com>
Cc: linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Philippe Begnic <philippe.begnic@st.com>, Rickard Andersson <rickard.andersson@stericsson.com>, Jonas Aberg <jonas.aberg@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>

> Patches are based on Linus Torvalds tree with latest commit as of okt=
 10.

Hmm... I get:

Applying: clk: ux500: Support for prcmu_scalable_rate clock
error: drivers/clk/ux500/clk-prcmu.c: does not exist in index
error: drivers/clk/ux500/clk.h: does not exist in index
Patch failed at 0001 clk: ux500: Support for prcmu_scalable_rate clock

So when did drivers/clk/ux500/* arrive?=20

Or is it still sitting in your tree?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
