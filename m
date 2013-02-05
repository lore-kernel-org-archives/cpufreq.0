From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] CPUFreq: Implement per policy instances of governors
Date: Tue, 5 Feb 2013 12:39:50 +0100
Message-ID: <20130205113950.GG4827@pd.tnic>
References: <cover.1359976493.git.viresh.kumar@linaro.org>
 <5808458.pvV2iHpBWm@vostro.rjw.lan>
 <CAKohpok7RiJ_HKGi3r0vU26kNEtFKq==pMMoshT6Z2yy9ghemA@mail.gmail.com>
 <20130204123221.GA22340@pd.tnic>
 <CAKohpomcrtV3i9fL4zV6Mt0uDza-9pHTOsqTe2=C1t6mE6cpCQ@mail.gmail.com>
 <20130204130403.GD13909@pd.tnic>
 <CAKohpokuFC5gnTFcD3+RH3p5XaW8vBtyfq+Kej=d2J8tERdmoQ@mail.gmail.com>
 <20130204133648.GE13909@pd.tnic>
 <CAKohpokejWugM+wP5xcqp0F9AggLxuEf9Ox5fDViMxJh1c+kEw@mail.gmail.com>
 <80D6EFE2711DED4189C7C8F0430BFEA86D23D6A80E@BUNGLE.Emea.Arm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360064391; bh=oDzcOJmJxoS7XdTrApP93sSy4YFcaycDzr84Es1HEww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=KBmi0qRofHHoQiCNVs8k5udHWAUsbFlZcYhkAV
	GKvQ24W04eysJ3Q/LL31gL2wn/X7nmAvCepqc2uWYXxs4DKfJz5WIFrocHfbojnboU8
	CyVXdm9WsYyDAf4xIN8z3JUh26+Hg+KnYDaH6OhVfZIp4Lbc0ZfKmFAu4R9gg7qshw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1360064391; bh=oDzcOJmJxoS7XdTrApP93sSy4YFcaycDzr84Es1HEww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=KBmi0qRofHHoQiCNVs8k5udHWAUsbFlZcYhkAV
	GKvQ24W04eysJ3Q/LL31gL2wn/X7nmAvCepqc2uWYXxs4DKfJz5WIFrocHfbojnboU8
	CyVXdm9WsYyDAf4xIN8z3JUh26+Hg+KnYDaH6OhVfZIp4Lbc0ZfKmFAu4R9gg7qshw=
Content-Disposition: inline
In-Reply-To: <80D6EFE2711DED4189C7C8F0430BFEA86D23D6A80E@BUNGLE.Emea.Arm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Garcia-Tobin <Charles.Garcia-Tobin@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, Robin Randhawa <Robin.Randhawa@ARM.com>, Steve Bannister <Steve.Bannister@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>

On Tue, Feb 05, 2013 at 11:29:04AM +0000, Charles Garcia-Tobin wrote:
> Actually shooting myself in the foot here, Krait is not such a great
> example because although you can use difference between frequencies
> you are less likely to use different tunables (not inconceivable
> but unlikely). The best examples systems are multi cluster and
> hereterogeneous systems, like the recently announced Samsung Exynos 5
> octa http://en.wikipedia.org/wiki/Exynos_(system_on_chip). We will see
> more systems like this appearing, sporting low power cores combined
> with high performance ones, all running at the same time. I appreciate
> this is all very new, but more will come, and the requirement to have
> different tunables per cluster is very real. In ARM on our own multi
> cluster test chip, using an experimental version of this approach, we
> have seen good improvements in power consumption without compromising
> performance.

Ok, thanks for giving this insight, this is useful.

Question: do you need the granularity of that control to be per cpu
(with that I mean what linux understands under "cpu," i.e. logical or
physical core) or does one governor suffice per a set of cores, or as
you call it, a cluster?

> (Apologies ahead for any bit my mail server appends, not much I can do
> about it)

Yeah, my condolences :-)

> -- IMPORTANT NOTICE: The contents of this email and any attachments
> are confidential and may also be privileged. If you are not the
> intended recipient, please notify the sender immediately and do not
> disclose the contents to any other person, use it for any purpose, or
> store or copy the information in any medium. Thank you.

Leaving it in, in case you haven't seen how it looks like :-)

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
