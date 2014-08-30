From: Fabio Estevam <festevam@gmail.com>
Subject: Re: ARM: mx28: cpufreq-cpu0 support?
Date: Sat, 30 Aug 2014 14:05:25 -0300
Message-ID: <CAOMZO5CG7mw5W4D3fRPE3TGxQ6-3pTtDJrsNnieN8XKE9dGofQ@mail.gmail.com>
References: <53F9B4BF.2050802@lategoodbye.de>
	<20140825080123.GA12289@dragon>
	<53FB1041.5010208@lategoodbye.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=75t12RTNx31sGfHq1ZaaDLiVu08bIOqycqQquO2H810=;
        b=Id6BTehzaXAkrmg4TivBfVSvNF/kUAL/vFxiiwbd6bxbkDWNDf/k/UQJStZE5eRe1R
         IIrCBhkuDthFAl1th1mut6h0LjQf5NzMtQfy1v6yUH5onz1GXyK3ZCElu9UFv2DOgbz0
         lpVePCGbhSpEW9NRYXrYclY3NUzDcXuWAO0+s1N1BHeLNaDa3SF5zZiBLuttxYWijIkm
         w8oaf3zZx7oKi10yvbowAZRjqdDvpTmP4Qrx6/GQ5hTj7yfGcpcximdZYB+R+Uvmx+IF
         ncWt/CZNSzU3QDfcKCo8Zapz4E9lhhVQDdytB5VCTIieWqkm2+edLRAybwnB95Vzy03s
         2JDA==
In-Reply-To: <53FB1041.5010208@lategoodbye.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Wahren <info@lategoodbye.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <fabio.estevam@freescale.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Otavio Salvador <otavio@ossystems.com.br>

Hi Stefan,

On Mon, Aug 25, 2014 at 7:30 AM, Stefan Wahren <info@lategoodbye.de> wrote:

> As far as i know, the old Freescale BSP (2.6.35) contains a cpufreq driver
> for mxs, which never goes to mainline. So i'm not sure what would be the
> best way: porting the old driver or using cpufreq-cpu0.

First step would be to port the PMU driver into mainline.
