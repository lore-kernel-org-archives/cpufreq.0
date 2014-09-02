From: Fabio Estevam <festevam@gmail.com>
Subject: Re: ARM: mx28: cpufreq-cpu0 support?
Date: Tue, 2 Sep 2014 10:13:01 -0300
Message-ID: <CAOMZO5A3n6HV_A+U5pjzbHQMhcpmq7gw0e0aT87GGTyTZKeZ9A@mail.gmail.com>
References: <53F9B4BF.2050802@lategoodbye.de>
	<20140825080123.GA12289@dragon>
	<53FB1041.5010208@lategoodbye.de>
	<CAOMZO5CG7mw5W4D3fRPE3TGxQ6-3pTtDJrsNnieN8XKE9dGofQ@mail.gmail.com>
	<CAOMZO5CnuWJ9EaLUW8DYFU1Dzeh=92tux0zoUBKoW-L=VWZhhg@mail.gmail.com>
	<540412A9.4090806@lategoodbye.de>
	<CAOMZO5A7-66LJtv4O2TghN3gVzme4N6JFMYd8TV7zXhUhsXedQ@mail.gmail.com>
	<54055116.4030608@lategoodbye.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=PEITkIcHR7tJ8WdU6u+dlR6gnO2Opu8Y7y+HsCRZtHw=;
        b=JQ/GIPQ4z80Hx/G9mfbydQ+hUyLW9LOp5FkHR3LGk7Huq1Sxzf+8BYYkr8B01zTXHT
         8v+80IEpuid8/8+h08dVTyOUYlD7HgeH9k3wqt8dhcRjuWWsvWuzPDW01GMClsTZojGZ
         S/1XYqAUDw12uJWuCvdcqKaRBr+V/LAGGRWnO23luPqwGbRuFh6VnynCcZeeUjW73FsZ
         XFqOTX641vuP8OQLVPD7jeyBFZ5q7EvnLl0VqmTdKL6c67h7Tg0dM2nUWVgT4ZqGGaQl
         hAuTX7L/fxrGEaAb9pbEIwLxZnyR7sb3JmxT/XJfQQSceBRP8KqTrs4MVx+RF4xZQB3A
         6/Jw==
In-Reply-To: <54055116.4030608@lategoodbye.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Wahren <info@lategoodbye.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <fabio.estevam@freescale.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Otavio Salvador <otavio@ossystems.com.br>

On Tue, Sep 2, 2014 at 2:09 AM, Stefan Wahren <info@lategoodbye.de> wrote:

> thanks again. Now i unterstand much more, but otherwise the portation won't
> be straight forward. The old source in drivers/regulator/mxs-regulator.c
> needs a low level part located in arch/arm/plat-mx28/power.c . As far as i
> know, the low level part needs to move into the devicetree binding and into
> the mxs-regulator.c . Am i right?

Yes, I think you are right.

> Yesterday i had looked into the mx28 reference manual and into the low level
> part of the mxs regulator. The reference manual defines four voltage
> regulators: vddd, vdda, vddio and vddmem plus a overall current regulator.
> But the low level part make use of vddd, vdda, vddio, vddio_bo and the
> overall current.
>
> Do i need the brown out regulator (vddio_bo) and the vddmem?

As far as I understand vddmem is not used on mx28evk. From the mx28
reference manual;

"11.12.8 VDDMEM Supply Targets Control Register
(HW_POWER_VDDMEMCTRL)
This register controls the voltage target for a memory supply
generated from VDDA. This
supply is intended for use with external memories such as LV-DDR that
have unique voltage
requirements not compatible with VDDIO, VDDA , or VDDD."
