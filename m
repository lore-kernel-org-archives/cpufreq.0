From: Fabio Estevam <festevam@gmail.com>
Subject: Re: ARM: mx28: cpufreq-cpu0 support?
Date: Mon, 22 Sep 2014 19:18:49 -0300
Message-ID: <CAOMZO5A0of3_arOx2z0_t7xN37jQjJ5uU4gwcsgCuSdpBJJVzw@mail.gmail.com>
References: <53F9B4BF.2050802@lategoodbye.de>
	<20140825080123.GA12289@dragon>
	<53FB1041.5010208@lategoodbye.de>
	<CAOMZO5CG7mw5W4D3fRPE3TGxQ6-3pTtDJrsNnieN8XKE9dGofQ@mail.gmail.com>
	<CAOMZO5CnuWJ9EaLUW8DYFU1Dzeh=92tux0zoUBKoW-L=VWZhhg@mail.gmail.com>
	<540412A9.4090806@lategoodbye.de>
	<CAOMZO5A7-66LJtv4O2TghN3gVzme4N6JFMYd8TV7zXhUhsXedQ@mail.gmail.com>
	<542093C0.1040004@lategoodbye.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=SDVc3i3iEvgEvD8QmNdI1Uiod9IlvTsXcoK9IOoOq9g=;
        b=YDcPrymBzXoeC983S016o2twjIpyVALGs3YitHbEnF5SkHfHQtOwWZkrv7MnPFR5lr
         9ia3ITbHpbT6zwDhQ7n2Or9NzfIipsPS+VAzOBugHXin06WhN4JN45DfjB++gqVBp2hn
         P7sOw2rvHWB6n1U3GfxZxsAysxFryRDxi2DH/PDuQ1JuweRq3NVTRjg7d7odUD69fbjq
         C4dIMpiiRjg2cJGglVkU5cq5Mqkypzz76P09olzIXNtx4tZq6byWECLmpuVa/oZ2bJwc
         blDJVB7zY8ISjaSmDJLetgxVhgSx+Dcyzkr+eXZ7PcZAsC5BI0v6jFR4tXvnU1UbeOGY
         5vNQ==
In-Reply-To: <542093C0.1040004@lategoodbye.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Wahren <info@lategoodbye.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <fabio.estevam@freescale.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Otavio Salvador <otavio@ossystems.com.br>

Hi Stefan,

On Mon, Sep 22, 2014 at 6:25 PM, Stefan Wahren <info@lategoodbye.de> wrote:

> i've ported the mxs-regulator driver and now i'm getting an probing output
> like above with Linux 3.17-rc4.

Great, it looks like you are making good progress :-)

>
> Now i want to test the mxs-regulator driver with the cpufreq-cpu0 as
> consumer. So i defined cpu@0 according to cpufreq-cpu0 binding in imx28.dtsi
> and enabled cpufreq-cpu0 driver and userspace gov in Kernel config.
>
> But if i modprobe cpufreq-cpu0 i don't get any output and the entry
> /sys/devices/system/cpu/cpu0/cpufreq is also missing.
>
> Any ideas, what's wrong or missing?

Have you registered cpufreq-cpu0 inside arch/arm/mach-mxs/mach-mxs.c?

Take a look at this patch for an example:
http://www.spinics.net/lists/arm-kernel/msg363761.html
