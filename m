From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 206/228] cpufreq: sa11x0: remove calls to
	cpufreq_notify_transition()
Date: Fri, 13 Sep 2013 16:54:24 +0100
Message-ID: <20130913155424.GB12758@n2100.arm.linux.org.uk>
References: <cover.1379063063.git.viresh.kumar@linaro.org> <6e2ca86ce948c0bc35f7709baf22672771fcf1e8.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=yHeYNA4uG5VZP59nmFVLH4hqv1hnFJFZx4vb6cHS4Fk=;
	b=iS+UdKi+7m3fiLuiV2S4DQFoGR9zbtBMu0PkkC2VfQq4yC8N2wzYRxHVTTqbdzbWoCYDfEQaIBdf55xzpBXyArGILrun0Cr1j/5FBtiWUj54l1/Oixc5szVCs6Bqy6fj6imR7HJPkR6gm79UWudwzOQ79FMaXzBaZZvthDmtG4Q=;
Content-Disposition: inline
In-Reply-To: <6e2ca86ce948c0bc35f7709baf22672771fcf1e8.1379063063.git.viresh.kumar@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 06:32:32PM +0530, Viresh Kumar wrote:
> Most of the drivers do following in their ->target_index() routines:
> 
> 	struct cpufreq_freqs freqs;
> 	freqs.old = old freq...
> 	freqs.new = new freq...
> 
> 	cpufreq_notify_transition(policy, &freqs, CPUFREQ_PRECHANGE);
> 
> 	/* Change rate here */
> 
> 	cpufreq_notify_transition(policy, &freqs, CPUFREQ_POSTCHANGE);
> 
> This is replicated over all cpufreq drivers today and there doesn't exists a
> good enough reason why this shouldn't be moved to cpufreq core instead.
> 
> Earlier patches have added support in cpufreq core to do cpufreq notification on
> frequency change, this one removes it from this driver.
> 
> Some related minor cleanups are also done along with it.
> 
> Cc: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Shouldn't this patch set CPUFREQ_ASYNC_NOTIFICATION somewhere?
