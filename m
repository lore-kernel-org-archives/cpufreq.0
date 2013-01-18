From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH 1/3] cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs
Date: Fri, 18 Jan 2013 15:39:56 +0100
Message-ID: <8738xyimgz.fsf@dell.be.48ers.dk>
References: <1358518846-16251-1-git-send-email-andrew@lunn.ch>
	<1358518846-16251-2-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:references:date:in-reply-to
         :message-id:user-agent:mime-version:content-type;
        bh=tIusWx/kp9sIMDRItZHpHCGtSQrovE9VyJX0s24EKN4=;
        b=I6C8B2bISV3RL2/1j9mfhvjbuzXkv7FXl9gItEpRMeyKRl7rI4CPikV7SPUQ9DAvIE
         OOWkDja5+ast68KU+NKr4/QEXhPKmyEwI5Vkgm62tz3hZgWu0G/tUk8FqmuB+l2284sG
         afcdTcbw2GE6eue+Jzw2PsIr9So1PIlPo2tWOppLlZKxLj7y77vcKYFEgcEhVbVajxL9
         LYR/Oy0tSo/jRwH2MBL0tqLAsOv5V7UwUEhIgLICgBYveZS3fDd6DWB4qDg288ZqW8Ve
         9f9eGjJmJYGZhzON13nfgQViUdYzZS6nSWnTtxvdXIrMx7uC59N59O81c1QX0l/jELiC
         rkJg==
In-Reply-To: <1358518846-16251-2-git-send-email-andrew@lunn.ch> (Andrew Lunn's
	message of "Fri, 18 Jan 2013 15:20:44 +0100")
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, rjw@sisk.pl, linux ARM <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org

>>>>> "Andrew" == Andrew Lunn <andrew@lunn.ch> writes:

 Andrew> The Marvell Kirkwood SoCs have simple cpufreq support in hardware. The
 Andrew> CPU can either use the a high speed cpu clock, or the slower DDR
 Andrew> clock. Add a driver to swap between these two clock sources.

 Andrew> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
 Andrew> ---
 Andrew>  drivers/clk/mvebu/clk-gating-ctrl.c |    1 +
 Andrew>  drivers/cpufreq/Kconfig.arm         |    6 +
 Andrew>  drivers/cpufreq/Makefile            |    1 +
 Andrew>  drivers/cpufreq/kirkwood-cpufreq.c  |  273 +++++++++++++++++++++++++++++++++++
 Andrew>  4 files changed, 281 insertions(+)
 Andrew>  create mode 100644 drivers/cpufreq/kirkwood-cpufreq.c

 Andrew> +++ b/drivers/cpufreq/Kconfig.arm
 Andrew> @@ -77,6 +77,12 @@ config ARM_EXYNOS5250_CPUFREQ
 Andrew>  	  This adds the CPUFreq driver for Samsung EXYNOS5250
 Andrew>  	  SoC.
 
 Andrew> +config ARM_KIRKWOOD_CPUFREQ
 Andrew> +        def_bool ARCH_KIRKWOOD && OF
 Andrew> +	help

The def_bool should be indented with a <tab>

Otherwise looks good.

-- 
Bye, Peter Korsgaard
