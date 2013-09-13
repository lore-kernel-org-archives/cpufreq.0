From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 120/228] cpufreq: sa11x0: don't initialize part of
	policy that is set by core too
Date: Fri, 13 Sep 2013 15:26:19 +0100
Message-ID: <20130913142619.GT12758@n2100.arm.linux.org.uk>
References: <cover.1379063063.git.viresh.kumar@linaro.org> <8e8853f66fadd4816a5d0fc5284c0c1b6a7816ba.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=qDMwmFB5qSYMj8qT0Id0E1So88SyrdWh8GZ+hqmjVm8=;
	b=myOeBc1WfBXOguAJijTg/jqwly/y9YhMddqd8qItDUOxd1hAnV4UycNDPLENwusXME2RYkvtULof87RMtYVs3SZmjWhdYFYfLFGHY1BUL7vVa4K+LNWb8PQ+ISM/GaXZFO7snkW/ipVw6Ft0XA7fzgbx9m1BrQv1ojREJufb20M=;
Content-Disposition: inline
In-Reply-To: <8e8853f66fadd4816a5d0fc5284c0c1b6a7816ba.1379063063.git.viresh.kumar@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 06:31:06PM +0530, Viresh Kumar wrote:
> Many common initializations of struct policy are moved to core now and hence
> this driver doesn't need to do it. This patch removes such code.
> 
> Most recent of those changes is to call ->get() in the core after calling
> ->init().
> 
> Cc: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
