From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: ARM: mx28: cpufreq-cpu0 support?
Date: Mon, 25 Aug 2014 16:01:25 +0800
Message-ID: <20140825080123.GA12289@dragon>
References: <53F9B4BF.2050802@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53F9B4BF.2050802@lategoodbye.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Stefan Wahren <info@lategoodbye.de>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org

On Sun, Aug 24, 2014 at 11:47:43AM +0200, Stefan Wahren wrote:
> Hi,
> 
> could you please tell me, is i.MX28 supported by cpufreq-cpu0?
> 
> Do we need only the necessary DT entries like operating points or is
> it more?

Clock might as simple as adding DT entries, but I'm not sure we have
voltage scaling support for i.MX28 in kernel.

Shawn
