From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 144/228] cpufreq: sa11x0: use cpufreq_generic_init()
	routine
Date: Fri, 13 Sep 2013 15:32:26 +0100
Message-ID: <20130913143226.GX12758@n2100.arm.linux.org.uk>
References: <cover.1379063063.git.viresh.kumar@linaro.org> <254e7e912c3817fdf1499bb1ea7be7bc7f3cdbef.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=rsGZG8zuoit0YKrmt2ItQkBiVLgu3q1Abs0Og4/pORQ=;
	b=aAD+YK+EBeGnrGN4kDTmQlNDoifn/EqhjHRwm2oVOa18TxzczOklWHHV6IJ9MCfG2FnrIfDor7pw+W6yFqRjf5GaddU78KyssuvYGRH1muJeyPYyYxN5I8cNvs7rEgV8cgifRZjPk9qUEn7qfYuRfjpbvgWKLaonuhd9fgXkzpM=;
Content-Disposition: inline
In-Reply-To: <254e7e912c3817fdf1499bb1ea7be7bc7f3cdbef.1379063063.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, patches@linaro.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 06:31:30PM +0530, Viresh Kumar wrote:
> Use generic cpufreq_generic_init() routine instead of replicating the same code
> here.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
