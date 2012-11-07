From: Joshua Emele <jemele@gmail.com>
Subject: [PATCH 0/4] cpufreq: OMAP: if available, scale the iva coprocessor
Date: Tue,  6 Nov 2012 17:47:37 -0800
Message-ID: <1352252861-18384-1-git-send-email-jemele@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=OfojFXlEotcjFxEEMWpCOhAJInWPvtnCplgPw0ygZqs=;
        b=D+6fV7F89/MRfforlNIP/seqevEIk8pzEODC39+ujq/QNBOdQjMb4GbOlMajuCMBA1
         QsVCDvUdZE+KNGLWBqGT3I16yNdX/V5C3YXzxCC4FLFfTBEkqojMPyV4KmabMMe5MbGE
         c53365cZ+aCtcSjOaY/T9CcV/W/7Xsi9TITvjSCvIzW7vdJu2ciEjj140Yd3bCYhIKpR
         BcNkNwQ94ZTvDALzcZwyeQ2slN34lo4QcJcUmU6SxDqLe5YsIfI8sALe/4Gfjww/s6mj
         V/rc5hiFewP994Us8ScRfJtTVOd1ED7RX1ui2hRmjcHXfofcag+xvHSHxDSYzJx4UUas
         kfnw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@ti.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-omap@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joshua Emele <jemele@gmail.com>

The iva coprocessor, available on some omap platforms, shares a voltage domain
with the mpu. If cpufreq is active and the mpu processor is scaled down, the iva
coprocessor should also be scaled. The goal is to make sure we do not ramp down
the voltage on the domain and affect clocking on the iva coprocessor leading to
a dsp crash.

I only have access to an omap3evm-ish device, so I do not know what the iva
clock name is for omap24xx and omap44xx. This detail can be added later if the
general approach is approved.

I have tested a version of this patch against the linux-3.3 kernel, so this my
attempt at a forward port against the current mainline. I have based my patch
series against linux-omap-pm/pm-next.

Joshua Emele (4):
  cpufreq: OMAP: if an iva clock name is specified, load iva resources
  cpufreq: OMAP: for omap3 devices, specify the iva clock name
  cpufreq: OMAP: ensure the iva coprocessor is at the same opp as the
    mpu
  cpufreq: OMAP: scale the iva coprocessor if available

 drivers/cpufreq/omap-cpufreq.c |  113 +++++++++++++++++++++++++++++++++------
 1 files changed, 95 insertions(+), 18 deletions(-)

-- 
1.7.6.5

