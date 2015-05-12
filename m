From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: schedule_timeout sleeps too long after dividing CPU frequency
Date: Tue, 12 May 2015 16:23:32 +0100
Message-ID: <20150512152332.GO2067@n2100.arm.linux.org.uk>
References: <55520F0F.5010906@free.fr>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=pandora-2014;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=Yixm4/8bgEZfIXCaxus+QcJnyU2KfNNnDsvlR7rNPrk=;
	b=edFP33zEFg+ykUAtPhP/BLgqM/3pFQCyVoCluWOd0ObqCpqh5BzFn917FnHpD1e0Lmnww6yIjfGbFcnEH/PBSWI5yTSf+h/6e9/uTJzoUon3D4BhV/h/xL1VwKYwvElCMxmOI6aE/LqixfKep3fnBlMo2gFYM3j+/AbubX/9Fk8=;
Content-Disposition: inline
In-Reply-To: <55520F0F.5010906@free.fr>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mason <slash.tmp@free.fr>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, cpufreq <cpufreq@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>

On Tue, May 12, 2015 at 04:32:47PM +0200, Mason wrote:
> Hello,
> 
> I'm working on a Cortex A9 based platform.
> 
> I have a basic clock tree, and a very basic cpufreq driver using
> mostly generic driver glue:
> 
> static struct cpufreq_driver tangox_cpufreq_driver = {
> 	.name		= "tangox-cpufreq",
> 	.init		= tangox_cpu_init,
> 	.verify		= cpufreq_generic_frequency_table_verify,
> 	.target_index	= tangox_target,
> 	.get		= cpufreq_generic_get,
> 	.exit		= cpufreq_generic_exit,
> 	.attr		= cpufreq_generic_attr,
> };
> 
> My target_index function is trivial:
> 
> static int tangox_target(struct cpufreq_policy *policy, unsigned int idx)
> {
> 	return clk_set_rate(policy->clk, freq_table[idx].frequency * 1000);
> }
> 
> I was testing an unrelated driver at low frequencies, with the nominal
> frequency (999 MHz) divided by 54 (i.e. freq = 18.5 MHz) and I noticed
> that when the driver calls
> 
>     schedule_timeout(HZ);
> 
> the thread sleeps 54 seconds instead of 1.

I'm guessing that this will be because your local timer changes frequency
with the CPU, which means that the clockevent which was set for one second
ends up timing out after 54 seconds.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
