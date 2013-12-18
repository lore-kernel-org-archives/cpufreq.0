From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 1/2] ARM: imx: add vddsoc/pu setpoint info into dts
Date: Wed, 18 Dec 2013 09:08:12 -0200
Message-ID: <CAOMZO5DCGOkUtWmEok-uEFsUpGLF+93Vhm9XFs02yH9Z+eV0uQ@mail.gmail.com>
References: <1387402010-31749-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=JE6Z9FQDEuUBnWaFK8cZO07Qipg/2xMuAEfTQkokgm8=;
        b=eDAr+9zKKToCrxAt5963AQ4YdTZrijQFLAOLcD9e3WSx4b8PrA9F+EeJaMVtDtrNO1
         z47YWuZmDVpircdfqr/buQkqztKrKOBVNOmFpmzKtlVYIZkkS9aQIK2rFfEIOfxUaU96
         INbkNfcimM5GoZ/C/JvsZuqtlfVPXObdLNIsd6DQiS/mfPLTEXDhlCEowAVh/3LveWux
         MszVSVqzPJ68GgKzRV71LdQ19YMi3K+rf5z3RDRalS8GHj5FMEtsoIEqupJlV+Bm+Q7h
         YNHx77BuIp3bTb3PK3Be5BV4w5D3XGLLlIwqffxsAtQpDUvWpyoqFrLAox3jgWeR+3bz
         E1fg==
In-Reply-To: <1387402010-31749-1-git-send-email-b20788@freescale.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anson Huang <b20788@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, rjw@rjwysocki.net, Viresh Kumar <viresh.kumar@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

Hi Anson,

On Wed, Dec 18, 2013 at 7:26 PM, Anson Huang <b20788@freescale.com> wrote:

> +  Documentation/devicetree/bindings/regulator/regulator.txt for details.
> +  arm-supply: vddarm input.
> +  pu-supply: vddpu input.
> +  soc-supply: vddsoc input.

I found these messages confusing, as someone may think that you are
referring to the VDD_ARM_IN/VDD_ARM23_IN and VDD_SOC_IN, which are
really inputs.

What about doing this instead?

arm-supply: VDDARM LDO output
pu-supply:  VDDPU LDO output
soc-supply: VDDSOC LDO output

Regards,

Fabio Estevam
