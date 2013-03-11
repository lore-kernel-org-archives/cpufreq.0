From: Nishanth Menon <nm@ti.com>
Subject: [PATCH 0/2] cpufreq: cpufreq-cpu0: cleanups around DT usage
Date: Mon, 11 Mar 2013 18:05:28 -0500
Message-ID: <1363043130-30270-1-git-send-email-nm@ti.com>
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
        bh=AUjwr84lMKaA3eGnjl6JfeZaS090fLJLKPWC8YGSmmk=;
        b=eprkez1ccS6YopOudjBet7gCvnfM+nGn/ByjhEJHjx1/66RTKFlzS3MSVZXF2PwdgD
         Er0/SuONlhB5U21PZK9C06KXpr209d7+ZPqNNghMJRts+lIScSm/wsDEmDnkXiAtLfH7
         i/BVc5xwkjRAmJ8LDZuTUcTap7BQgf2A0RTk1jJ0qlqtgzMdexoogDEWp0tJNPL6D8tJ
         fMMF2DDaRUV+gbWYAc08Ey2/uRQ6ka9qf4i7gUM3d37kQN8acO6jgJhV0w+9IFBtbP+K
         MfxQBxSfyRXOrubUDgAKWhqDTYAxPxxaH8I6Ujzx2nRB4+o9CLgFn9+LmYfZECJjkD7J
         l41w==
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@vger.kernel.org>
Cc: Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Shawn Guo <shawn.guo@linaro.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org

The following series arose from trying to use BeagleBoard-XM (OMAP3 variant)
for doing CPU DVFS using cpufreq-cpu0.

This is also an attempt to slowly remove the dependence on omap-cpufreq
driver and be entirely driven off cpufreq-cpu0 driver.

Somewhere in the future, when we have regulators driven off CCF and OMAP
converted to CCF, we could remove the DT regulator requirements as well.

Based on v3.9-rc2 tag

Nishanth Menon (2):
  cpufreq: cpufreq-cpu0: support for clock which are not in DT yet.
  cpufreq: cpufreq-cpu0: provide compatibility string for DT matchup

 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    6 ++++++
 drivers/cpufreq/cpufreq-cpu0.c                     |   12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-kernel@vger.kernel.org
Cc: cpufreq@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-omap@vger.kernel.org

This series in addition to the following DT changes (temporary):
http://pastebin.com/h5uysj0i

Screen shot of the voltage changes using cpufreq-cpu0 on Xm:
http://goo.gl/vVEjd

OMAP Caveat: AVS+ABB still wont work with just these changes.
More to come as we progress.

-- 
1.7.9.5

Regards,
Nishanth Menon
