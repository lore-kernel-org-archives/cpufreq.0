From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 Resend 29/34] cpufreq: sa11x0: Convert to light
	weight ->target_index() routine
Date: Fri, 18 Oct 2013 16:46:44 +0100
Message-ID: <20131018154644.GC25034@n2100.arm.linux.org.uk>
References: <cover.1382104514.git.viresh.kumar@linaro.org> <fb85256f34e1a61c6c2c37c3e6fa8b1398bad683.1382104515.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=fLswbErnOfji2yp+Bu3BEVS2NRlCyT0st9t63nmcBxY=;
	b=nm9ymK8DWGgpzSlICq8C3I5G/5FF7YvujEZuzFBcAejorqoBk96rh4syo2Ymnd3vb5nAfDR/ywpogzv9nZJjcQISnv13sDS50RXoVxFtUeliHTk/Lx3iPbJKDbeIKDc7/zh8j8vztR5eMUYGak7kLZG1WUjiUjSI7lkCzihdsRk=;
Content-Disposition: inline
In-Reply-To: <fb85256f34e1a61c6c2c37c3e6fa8b1398bad683.1382104515.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 18, 2013 at 07:29:52PM +0530, Viresh Kumar wrote:
> This patch converts existing .target() to newly defined light weight
> .target_index() routine for this driver.
> 
> CPUFreq core will call cpufreq_frequency_table_target() before calling this
> routine and will pass index to it.
> 
> Some existing routines are no more required and so are removed now.
> 
> Cc: Russell King <linux@arm.linux.org.uk>

I think I acked this patch.  Please ensure that my ack appears on all
that I did ack, thanks.
