From: Nishanth Menon <nm@ti.com>
Subject: Re: [RFC PATCH 0/5] Frequency resolution in CCF vs. cpufreq
Date: Thu, 15 May 2014 07:14:30 -0500
Message-ID: <CAGo_u6pxat1=X5tvqb8FYqUttYTaAimbjcdwsUYtS-rYt59v+A@mail.gmail.com>
References: <1400106655-22465-1-git-send-email-soren.brinkmann@xilinx.com>
	<20140515074724.GJ16662@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=4LmMdLT+PnDHAqDZ/FvE+N/WjfA1h4JAe0OGRK7cN1w=;
        b=1A7Ys1ZDG1XkMuhBc9e5kFuLpJd96S4zGxmolV9HDVMQBtJcLJXhnV4mEnkXTnr0l+
         KFHRqiYwaplC+ZWJV5q1HNZ8EH3w5rEyms/06+FVsfgJ3E/XqMRBunLzWYZIfxceB1K6
         okk9chfRcdRYHQIZvRTv3PFSbbhIbSm8HmY+2TGOGfxjO9hakNcSBil5CMJnNW3nHYDu
         m3HBiBzRpPwbAsc4uVLqxzEzKP69hbNDMC2I0b0G3vztnVdsXswtNTZaCez2EZYwKcHR
         94g6OAp32BqVu9o/kAu0wv+Q7RRK+pD2e2ab7B2WJLGyBdpzBv5dGz/oHZJvi3dPodic
         LeTQ==
In-Reply-To: <20140515074724.GJ16662@pengutronix.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, Mike Turquette <mturquette@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, May 15, 2014 at 2:47 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
[...]
>> cpufreq, which simply divides values it obtains through clk_round_ra=
te() by
>> 1000, 666666.
>> Since passing 666666 to clk_round_rate() does not result in 66666666=
0
>> (clk_round_rate() always rounds down!), we chose to put 666667 in th=
e OPP. This
> What is OPP?

Operating Performance Point (Documentation/power/opp.txt describes
frequencies in Hz, the bindings we chose in the community
Documentation/devicetree/bindings/power/opp.txt describes it in KHz).

Regards,
Nishanth Menon
