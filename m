From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 175/228] cpufreq: sa11x0: Convert to light weight
	->target_index() routine
Date: Fri, 13 Sep 2013 15:31:01 +0100
Message-ID: <20130913143101.GW12758@n2100.arm.linux.org.uk>
References: <cover.1379063063.git.viresh.kumar@linaro.org> <84ed2fae0095e526e0665f5859d39d3ff22c7613.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=9maCbTcVcL5U6J1CRsYjKIH3wycGaSmKB+eqgo1FEZQ=;
	b=D7X7DFJzOdDraPMwSTsTxoglBduNlZgJjo/ELAU08Q+NzRpjRVC6fF0j7XUxIa2ETUpK5F4OCBbcemVpfLHkJeaIXrQsD3K7/biih06nSF6RO7nAbEUct3Xzwl1iP54Jts9ljimncZERvowEh4gjvR37kRc94X6bxO3ZJCb4VM4=;
Content-Disposition: inline
In-Reply-To: <84ed2fae0095e526e0665f5859d39d3ff22c7613.1379063063.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 06:32:01PM +0530, Viresh Kumar wrote:
> This patch converts existing .target() to newly defined light weight
> .target_index() routine for this driver.
> 
> CPUFreq core will call cpufreq_frequency_table_target() before calling this
> routine and will pass index to it.
> 
> Some existing routines are no more required and so are removed now.
> 
> Cc: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
