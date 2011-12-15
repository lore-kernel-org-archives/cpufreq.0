From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC V1 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Thu, 15 Dec 2011 20:29:11 +0000
Message-ID: <20111215202911.GL14542@n2100.arm.linux.org.uk>
References: <1323947798-25251-1-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=NQk29dVpqj91Zyv3Q32fqGAgbgAxMajaKR9mzKlrfJ0=;
	b=qCh+DTS0cno1BekmI0b5wzSD6j1JopqMweRUBZaOMwsE6O6lSBm8G3IpJlJ0o1onbCXCfFJ1cxvUFWfd9Q89y8CQb5Mh3kxuIBsZyQ77yPaLqWuX+Id15YRwUXaFH7yejRd5x26FUImG/4H55PYnp2MX5ngzEA96kO8UJq70HSw=;
Content-Disposition: inline
In-Reply-To: <1323947798-25251-1-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, davej@redhat.com, kernel@pengutronix.de, shawn.guo@linaro.org, eric.miao@linaro.org, linaro-dev@lists.linaro.org, patches@linaro.org

On Thu, Dec 15, 2011 at 07:16:35PM +0800, Richard Zhao wrote:
> +#ifdef CONFIG_SMP
> +	/* loops_per_jiffy is not updated by the cpufreq core for SMP systems.
> +	 * So update it for all CPUs.
> +	 */
> +	for_each_possible_cpu(cpu)
> +		per_cpu(cpu_data, cpu).loops_per_jiffy =
> +		cpufreq_scale(per_cpu(cpu_data, cpu).loops_per_jiffy,
> +					freqs.old, freqs.new);

NAK.  If you think this is a good solution, you're very wrong.  If this
is what's in the core cpufreq code, then it too is very broken.

I've seen this exact method result in the loops_per_jiffy being totally
buggered over time by the constant scaling up and down.  The only way
to do this _sensibly_ is to record the _initial_ loops_per_jiffy and
_inital_ frequency, and scale from that.

That way you get consistent results irrespective of the scalings you
do over time, rather than something which continually deteriorates with
every frequency change.
