From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/6 v2] arm: use devicetree to get smp_twd clock
Date: Sun, 4 Nov 2012 10:08:22 +0000
Message-ID: <20121104100822.GY21164@n2100.arm.linux.org.uk>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com> <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com> <1351882309-733-2-git-send-email-mark.langsdorf@calxeda.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=vPTRloaQvsFlaZbFK1im79JM+AOV60+WNTFA4UkaAAk=;
	b=FEzUHLsar8HtgmwNoLZhP1U0/t3dQmttcFTJYkYHUJoNqyCc0kf08c+IZGr31y8LC5w+4nd6u4+fF4ytnn3+I/B+ip1KPsCie+baOkh5oNYIViAH62UoYfikrM0TiEHLRJ3ftNIi2PahaMy2nZ1NrEoaWcW6y99mi9CGLBlTaYc=;
Content-Disposition: inline
In-Reply-To: <1351882309-733-2-git-send-email-mark.langsdorf@calxeda.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org

On Fri, Nov 02, 2012 at 01:51:44PM -0500, Mark Langsdorf wrote:
> -static struct clk *twd_get_clock(void)
> +static struct clk *twd_get_clock(struct device_node *np)
>  {
> -	struct clk *clk;
> +	struct clk *clk = NULL;
>  	int err;
>  
> -	clk = clk_get_sys("smp_twd", NULL);
> +	if (np)
> +		clk = of_clk_get(np, 0);
> +	if (!clk)

What does a NULL return from of_clk_get() mean?  Where is this defined?

> @@ -349,6 +348,10 @@ int __init twd_local_timer_register(struct twd_local_timer *tlt)
>  	if (!twd_base)
>  		return -ENOMEM;
>  
> +	twd_clk = twd_get_clock(NULL);
> +
> +	twd_clk = twd_get_clock(NULL);
> +

Why twice?
