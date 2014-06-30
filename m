From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] Introduce clk_find_nearest_rate()
Date: Mon, 30 Jun 2014 09:56:32 -0700
Message-ID: <1404147396-8041-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding;
        bh=7ZwDG9koBd0YaB6JnRWyi1SCl5i6jW7g5FAwxhDd188=;
        b=nnCDeF3b/Oh2umGrLZhYfYEtVQSAEoU/GcUneNYa0nFT5JzoISTlMS4P9CdRf2GKji
         chN1KXnGVHnmqb8dYmXQZkINsCKo4hMwHeza7oz2HplxL1bIWtfhQXq6NaPRtDifnaBJ
         z+SsW66Gsc2dbdIJaOcvD0S2oqQLIy4of4RCVVT+/+Cwriad3+5oLEYSSj9VtfUnwpi1
         fFRtQ+OiVKuAsoD0ofro8svjGxsdDtA6/f3FmTd60gMK5in/nFYo0YdQBsPmVmuFyojk
         ayYejJJGeqf52vzkVkzGa34gikL6aMikudQzuavzohOWGnBESF/Vw030Dx5mg8H1bpA5
         zUHg==
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

On Zynq I encountered issues due to rounding here and there. Often the
issue would have been resolved by rounding towards the requested
frequency. Unfortunately, the CCF does not specify  the behavior of
clk_round_rate() in terms of rounding, making this proposed API
call useful for certain use-cases.

An RFC of this series has been discussed here:
https://lkml.org/lkml/2014/5/14/694

Mike: IIRC, you wanted to fix the return type of __clk_round_rate(). Do
you have any patches for that already? I couldn't find anything in
clk-next.

Patch 1 adds the new API call.
2 and 3 apply the new API.
And 4 is a minor fixup of the Zynq DT. The frequencies in the Zynq OPPs
had been specified taking this rounding issues into account, which
is no longer required with this patchset.

	Thanks,
	S=C3=B6ren


Soren Brinkmann (4):
  clk: Introduce 'clk_find_nearest_rate()'
  cpufreq: cpu0: Use clk_find_nearest_rate()
  net: macb: Use clk_find_nearest_rate() API
  ARM: zynq: dt: Use properly rounded frequencies in OPPs

 arch/arm/boot/dts/zynq-7000.dtsi    |  4 +--
 drivers/clk/clk.c                   | 57 +++++++++++++++++++++++++++++=
++++++++
 drivers/cpufreq/cpufreq-cpu0.c      |  3 +-
 drivers/net/ethernet/cadence/macb.c |  2 +-
 include/linux/clk.h                 |  9 ++++++
 5 files changed, 71 insertions(+), 4 deletions(-)

--=20
2.0.1.1.gfbfc394

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
