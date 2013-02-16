From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v5 2/3] arm: kirkwood: Instantiate cpufreq driver
Date: Sat, 16 Feb 2013 14:00:34 -0500
Message-ID: <20130216190034.GE23237@titan.lakedaemon.net>
References: <1360094115-14999-1-git-send-email-andrew@lunn.ch>
 <1360094115-14999-3-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1360094115-14999-3-git-send-email-andrew@lunn.ch>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: rjw@sisk.pl, viresh.kumar@linaro.org, cpufreq@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>

On Tue, Feb 05, 2013 at 08:55:14PM +0100, Andrew Lunn wrote:
> Register a platform driver structure for the cpufreq driver.
> Add a DT binding for cpus/cpu@0 with the needed clocks.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Jason Cooper <jason@lakedaemon.net>
> ---
>  arch/arm/Kconfig                                  |    1 +
>  arch/arm/boot/dts/kirkwood.dtsi                   |   13 ++++++++++++
>  arch/arm/mach-kirkwood/board-dt.c                 |    2 ++
>  arch/arm/mach-kirkwood/common.c                   |   23 +++++++++++++++++++++
>  arch/arm/mach-kirkwood/common.h                   |    2 ++
>  arch/arm/mach-kirkwood/include/mach/bridge-regs.h |    2 ++
>  6 files changed, 43 insertions(+)

Patches 2 and 3 applied to mvebu/dt_deps with depends on linux-pm/pm-cpufreq
up to:

  2a4bd9f cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs

thx,

Jason.
