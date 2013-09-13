From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 083/228] cpufreq: sa11x0: Use generic cpufreq routines
Date: Fri, 13 Sep 2013 17:09:11 +0100
Message-ID: <20130913160911.GC12758@n2100.arm.linux.org.uk>
References: <cover.1379063063.git.viresh.kumar@linaro.org> <773540c3d88ebdf24415774b0cfd31cb025c684c.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=aPAC6ZlAWaaBHyzvhUj7wW/6sqHIvivp/E3cgUfsNwY=;
	b=JQj6oni600yAg1tO8UV0xzjueFQlrcpcoWTntyZ4/JXydx0zz5PiUy9QHq41q5Sv6iAmibyYUi3I678Ouke348mo24lnqAz1bP3nPn4rDsl7flSw291/yok859wA4M2fWUAkEzg/vDFbHaHzsxU5xGh+XQKP24hJZwHL6S+9x7Y=;
Content-Disposition: inline
In-Reply-To: <773540c3d88ebdf24415774b0cfd31cb025c684c.1379063063.git.viresh.kumar@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, patches@linaro.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 06:30:29PM +0530, Viresh Kumar wrote:
> Most of the CPUFreq drivers do similar things in .exit() and .verify() routines
> and .attr. So its better if we have generic routines for them which can be used
> by cpufreq drivers then.
> 
> This patch uses these generic routines for this driver.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
