From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/6 v2] arm: use devicetree to get smp_twd clock
Date: Mon, 5 Nov 2012 22:31:55 +0000
Message-ID: <20121105223155.GJ28327@n2100.arm.linux.org.uk>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com> <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com> <1351882309-733-2-git-send-email-mark.langsdorf@calxeda.com> <20121104100822.GY21164@n2100.arm.linux.org.uk> <50983D75.50009@calxeda.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=M8fp8+9ZcQdrTMH0rbO+/lnGa2Qyzz4ocRzitKjXRJ0=;
	b=AeU/TxwdQqaM/2NJXnhsdk+dfiUb9FMC6Yoeb5Ql1QpFAONG1EHVH4mmPjfPNmBLmrISfQnLzFEAO9nkE8tbI2ASv7JX9LAUj4BaD2szye767d+n8RCtwh5MaCaTxmjjSQsJk4Tt6FMcLqEhx7wMrkhfJmScXC34d0L8D08stWw=;
Content-Disposition: inline
In-Reply-To: <50983D75.50009@calxeda.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Nov 05, 2012 at 04:28:05PM -0600, Mark Langsdorf wrote:
> On 11/04/2012 04:08 AM, Russell King - ARM Linux wrote:
> > On Fri, Nov 02, 2012 at 01:51:44PM -0500, Mark Langsdorf wrote:
> >> -static struct clk *twd_get_clock(void)
> >> +static struct clk *twd_get_clock(struct device_node *np)
> >>  {
> >> -	struct clk *clk;
> >> +	struct clk *clk = NULL;
> >>  	int err;
> >>  
> >> -	clk = clk_get_sys("smp_twd", NULL);
> >> +	if (np)
> >> +		clk = of_clk_get(np, 0);
> >> +	if (!clk)
> > 
> > What does a NULL return from of_clk_get() mean?  Where is this defined?
> 
> Well, it's a valid path if (np) is NULL. I'll add an IS_ERR(clk) and
> resubmit.

Hang on - what logic are you trying to achieve here?  Wouldn't:

	if (np)
		clk = of_clk_get(np, 0);
	else
		clk = clk_get_sys("smp_twd", NULL);

be sufficient?  If we have DT, why would we ever want to fall back to
"smp_twd" ?
