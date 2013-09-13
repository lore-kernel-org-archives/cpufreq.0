From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 038/228] cpufreq: sa11x0: Expose frequency table
Date: Fri, 13 Sep 2013 15:27:29 +0100
Message-ID: <20130913142729.GU12758@n2100.arm.linux.org.uk>
References: <cover.1379063063.git.viresh.kumar@linaro.org> <e689bd437918e56ae50541a90a4b9c606bfb8bf4.1379063063.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=rwLIGAjfRqSMJ3KPKKZZ5d9hKh5shVCGK7GCPRdoscc=;
	b=a4wU8Oy1NWOCjDRK7AqSMYTF6TTeidvzYJveb5NuPPNrZnOzPCzrJsyJwaxH776dFcN5aptSZPGqL2IeQ/w2iMkfX7lxMYXf6b2fxfzglaMMDRILYo7Sn/yBTIshawxAUesbQ5IP8axW//rXVBbAuyPooLTNnwnTJmJ6Hv59bUU=;
Content-Disposition: inline
In-Reply-To: <e689bd437918e56ae50541a90a4b9c606bfb8bf4.1379063063.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, patches@linaro.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 06:29:44PM +0530, Viresh Kumar wrote:
> This patch exposes sa11x0's frequency table to cpufreq core. It always existed
> but not as an array frequencies and not in the format cpufreq core wants it to.
> Also it was present in the unit of 100kHz earlier which is made consistent with
> cpufreq core now, i.e. kHz.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
