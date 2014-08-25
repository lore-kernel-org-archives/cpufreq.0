From: Stefan Wahren <info@lategoodbye.de>
Subject: Re: ARM: mx28: cpufreq-cpu0 support?
Date: Mon, 25 Aug 2014 12:30:25 +0200
Message-ID: <53FB1041.5010208@lategoodbye.de>
References: <53F9B4BF.2050802@lategoodbye.de> <20140825080123.GA12289@dragon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20140825080123.GA12289@dragon>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Otavio Salvador <otavio@ossystems.com.br>, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org

Am 25.08.2014 10:01, schrieb Shawn Guo:
> On Sun, Aug 24, 2014 at 11:47:43AM +0200, Stefan Wahren wrote:
>> Hi,
>>
>> could you please tell me, is i.MX28 supported by cpufreq-cpu0?
>>
>> Do we need only the necessary DT entries like operating points or is
>> it more?
>
> Clock might as simple as adding DT entries, but I'm not sure we have
> voltage scaling support for i.MX28 in kernel.
>
> Shawn
>

As far as i know, the old Freescale BSP (2.6.35) contains a cpufreq 
driver for mxs, which never goes to mainline. So i'm not sure what would 
be the best way: porting the old driver or using cpufreq-cpu0.

Stefan
