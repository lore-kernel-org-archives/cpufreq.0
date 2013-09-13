From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 039/228] cpufreq: sa11x0: let cpufreq core initialize
	struct policy fields
Date: Fri, 13 Sep 2013 15:29:37 +0100
Message-ID: <20130913142937.GV12758@n2100.arm.linux.org.uk>
References: <cover.1379063063.git.viresh.kumar@linaro.org> <8a36f8e32d7a9e9f4aa74db0525dbdc74fc023dd.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=YGkCeNyowgsCE1cxde/SoRmMjlViAM3cKomTtN3KsxI=;
	b=cbkfnZ69tJlxhlHDybKzJ8I0/B+Azi8x0W+VWjnJQ42Of3ZuMtVripWze8CV9Q8QQNQz+V4wwx10rnz9/tYhOcF/37MhhsQAlPg0vYVyH2rE4CgCrqUoNElJM7NB20OgRbe4JRcLR1tsVis5Sjl0j4fC/1Swd83ikb8XRyErAUQ=;
Content-Disposition: inline
In-Reply-To: <8a36f8e32d7a9e9f4aa74db0525dbdc74fc023dd.1379063063.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, patches@linaro.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 06:29:45PM +0530, Viresh Kumar wrote:
> Many fields of struct policy are filled by cpufreq core when we call
> cpufreq_table_validate_and_show() and so cpufreq driver doesn't need to set them
> anymore.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
