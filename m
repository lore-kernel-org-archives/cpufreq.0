From: Colin Cross <ccross@google.com>
Subject: Re: [PATCH 9/9] [ARM] tegra: Add cpufreq support
Date: Fri, 30 Jul 2010 12:56:33 -0700
Message-ID: <AANLkTi=jvQtCZ8=rsWDuLNpPLvKh54PdWvLDFZefZWDD@mail.gmail.com>
References: <1280449771-24043-1-git-send-email-ccross@google.com>
	<1280449771-24043-10-git-send-email-ccross@google.com>
	<20100730131124.GA3117@isilmar-3.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1280519796; bh=YbMACGsiTnvI1gH00VSacVZXyr8=;
	h=MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:From:
	 To:Cc:Content-Type:Content-Transfer-Encoding;
	b=V+nNiIS0Dbk/ITtM2DmfAAol2icZQARaGZvaXBJjyeheeYGxcWzyhPCC9vOLMHeUF
	 7xOpcSQrqdfvBUQj1I/Nw==
In-Reply-To: <20100730131124.GA3117@isilmar-3.linta.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org

On Fri, Jul 30, 2010 at 6:11 AM, Dominik Brodowski
<linux@dominikbrodowski.net> wrote:
> Hey,
>
> just a few minor comments:
>
> On Thu, Jul 29, 2010 at 05:29:30PM -0700, Colin Cross wrote:
>> +int tegra_verify_speed(struct cpufreq_policy *policy)
> static int
Done

>> +unsigned int tegra_getspeed(unsigned int cpu)
> static unsined int
Done

>> + =A0 =A0 for_each_online_cpu(freqs.cpu)
>> + =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_=
PRECHANGE);
>> +
>> +#ifdef CONFIG_CPU_FREQ_DEBUG
>> + =A0 =A0 printk(KERN_DEBUG "cpufreq-tegra: transition: %u --> %u\n"=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0freqs.old, freqs.new);
>> +#endif
> What about using cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, ... ) her=
e?
>
>> +
>> + =A0 =A0 ret =3D clk_set_rate_cansleep(cpu_clk, freqs.new * 1000);
> "can sleep"? For how long?
Adjusting the CPU clock may require changing the voltage through the
regulator api, which locks a mutex, and eventually through I2C, which
sleeps on I2C completion.
