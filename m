From: Fabio Estevam <festevam@gmail.com>
Subject: Re: ARM: mx28: cpufreq-cpu0 support?
Date: Sat, 30 Aug 2014 14:07:53 -0300
Message-ID: <CAOMZO5CnuWJ9EaLUW8DYFU1Dzeh=92tux0zoUBKoW-L=VWZhhg@mail.gmail.com>
References: <53F9B4BF.2050802@lategoodbye.de>
	<20140825080123.GA12289@dragon>
	<53FB1041.5010208@lategoodbye.de>
	<CAOMZO5CG7mw5W4D3fRPE3TGxQ6-3pTtDJrsNnieN8XKE9dGofQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=qON9ocnEs5subdOz/iGGKWWGVfGgV1xmdwPN76WWfBc=;
        b=O44OxCwvi5BTHuWdqBi9X21q6+Kqgy1R74MvWS970hq2XhXTYvymIk4Fcza9zasO3f
         UiF0eJ5GXXOamOnXceYGtBqB4vdaThR0T+T7enV/ZNzR3ZhbLXo05WohkdOEVP3hX8Ng
         QliCkZ5cNZzF8dhLB2831Bjbd78sMEhgNpNmNKImhp9Syn26bf77uRMeHAgnSowV9lY6
         Bw3CtKnq5tvXQvubEcdIxxn9aliEuSMMvvlGOWYz4NkdinzBOUXXQhFrSnzlDmd0O9nd
         C5u2pZ6dKcmduPkOsjLkrG8VdzyWJ25mh0vuLA5p2UDdXvHyEx7CmdIED49yZseWZiZq
         JPDA==
In-Reply-To: <CAOMZO5CG7mw5W4D3fRPE3TGxQ6-3pTtDJrsNnieN8XKE9dGofQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Wahren <info@lategoodbye.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <fabio.estevam@freescale.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Otavio Salvador <otavio@ossystems.com.br>

On Sat, Aug 30, 2014 at 2:05 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Stefan,
>
> On Mon, Aug 25, 2014 at 7:30 AM, Stefan Wahren <info@lategoodbye.de> wrote:
>
>> As far as i know, the old Freescale BSP (2.6.35) contains a cpufreq driver
>> for mxs, which never goes to mainline. So i'm not sure what would be the
>> best way: porting the old driver or using cpufreq-cpu0.
>
> First step would be to port the PMU driver into mainline.

I mean this regulator driver:
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/regulator/mxs-regulator.c?h=imx_2.6.35_maintain

,so that you can do the voltage scaling.
