From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] Integrator DTS and defconfig changes
Date: Wed, 9 Nov 2016 09:10:35 +0100
Message-ID: <CACRpkdara5D=kvGVYu-WRh_JYK6Z9NKmQ-eniXsauxdzx-QJbA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zyTaCiFJkNdy9jmRg7d2EE/fghNXu8cJkcslSHwwINY=;
        b=S9vTSa/37WRCyb1lFmsoq0ZOE9hXzvElzNH9aEimfM8ouuHmOKgCyqnXTvYNHwRuo2
         nniNw8cgekN4u7AI8yTkAQ1B6MhvhqfX8mnwt082JXnxaQ7qvZAt+P+9PpB8+Y/v65PI
         3Qot7aMQxBykRaIaA1OVUREDAaYjryWJWn+iY=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "arm@kernel.org" <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org

Hi ARM SoC folks,

this adds DT-based cpufreq to the Integrator family.

The corresponding cpufreq changes are merged by Rafael to the
cpufreq tree, and can go in orthogonally.

However I have included the defconfig change turning on the feature
here as it makes all kind of logic sense to have these three patches
in succession: addin the DTS nodes and then turning on the DT
cpufreq.

If you insist, of course I can send the defconfig patch separately.
I just think it makes more sense like this.

Please pull it in so we get some rotation in linux-next for this!

Yours,
Linus Walleij

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/armsoc-integrator-dts

for you to fetch changes up to 023c8faf9bbc95b2d00768414f0f73076ca06dc9:

  ARM: defconfig: turn on the DT cpufreq for Integrator (2016-11-09
09:02:46 +0100)

----------------------------------------------------------------
This contains the DTS changes enabling DT-only cpufreq
scaling on the Integrator family.

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: Add Integrator/AP cpus node and operating points
      ARM: dts: Add Integrator/CP cpus node and operating points
      ARM: defconfig: turn on the DT cpufreq for Integrator

 arch/arm/boot/dts/integratorap.dts    | 35 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/integratorcp.dts    | 26 ++++++++++++++++++++++++++
 arch/arm/configs/integrator_defconfig |  1 +
 3 files changed, 62 insertions(+)
