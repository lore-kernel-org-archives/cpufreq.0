From: Colin Cross <ccross@google.com>
Subject: Re: [PATCH 9/9] [ARM] tegra: Add cpufreq support
Date: Fri, 30 Jul 2010 13:33:08 -0700
Message-ID: <AANLkTinzmQRrudecEkaNm5+k_j3ATh+bB_1ZmFDWkYy0@mail.gmail.com>
References: <1280449771-24043-1-git-send-email-ccross@google.com>
	<1280449771-24043-10-git-send-email-ccross@google.com>
	<20100730131124.GA3117@isilmar-3.linta.de>
	<AANLkTi=jvQtCZ8=rsWDuLNpPLvKh54PdWvLDFZefZWDD@mail.gmail.com>
	<20100730202010.GA22180@sirena.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1280521990; bh=/HueAVeSGSLulLZlbXRPJ6CcyYg=;
	h=MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	b=pqXpDK6UUzkhakwO+YgWoXRyRcGUUE8oTJfk6wXWCjvj6cmk164mKRGQbZmNUIWgy
	 JfjjjBQs1O/Ev62aJJyNA==
In-Reply-To: <20100730202010.GA22180@sirena.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org

On Fri, Jul 30, 2010 at 1:20 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Jul 30, 2010 at 12:56:33PM -0700, Colin Cross wrote:
>> On Fri, Jul 30, 2010 at 6:11 AM, Dominik Brodowski
>
>> >> + ? ? ret = clk_set_rate_cansleep(cpu_clk, freqs.new * 1000);
>> > "can sleep"? For how long?
>
>> Adjusting the CPU clock may require changing the voltage through the
>> regulator api, which locks a mutex, and eventually through I2C, which
>> sleeps on I2C completion.
>
> ...although in some systems the I2C cost will be replaced with updating
> a GPIO which is very much cheaper.

Yes, but even on a GPIO regulator, the regulator api will lock a mutex
and possibly schedule.
