From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH V4 0/2] Add cpufreq driver for Momentum Maple platform
Date: Wed, 29 Jun 2011 19:07:54 +0400
Message-ID: <1309360076-22579-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=Z8bIMcnWEhY3vAeO7WFPAJu3WGGu6fvgb8Y4kZibnCw=;
        b=gmyDM+cNyTl3NGtHBT9lzmUC7M2AyO0xIYzXYf7xuqY7Y0OlvXzfNfvlaNrB9Oorhb
         tW31vkHfOhWo83jevbd4zyxoRDTGPy/Ae7fuPKLNVc9toIuAYEyw8d3SIAsxi8iXoleF
         l3nmzGLnpkNvzM8+1xVmYmPo9po9yb3yGlX0E=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Please merge this patchset, adding a cpufreq driver for Momentum Maple
platform. Changes since V3:

* Add comment regarding power-mode-data
* Adjusted kernel output a bit
* Tied the driver to compatible platforms only (as per
  arch/powerpc/platforms/maple/setup.c)

Dmitry Eremin-Solenikov (2):
      ppc: enable scom access functions on Maple
      Add cpufreq driver for Momentum Maple boards

 arch/powerpc/kernel/misc_64.S   |    4 +-
 drivers/cpufreq/Kconfig         |    5 +
 drivers/cpufreq/Kconfig.powerpc |    7 +
 drivers/cpufreq/Makefile        |    5 +
 drivers/cpufreq/maple-cpufreq.c |  309 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 328 insertions(+), 2 deletions(-)
 create mode 100644 drivers/cpufreq/Kconfig.powerpc
 create mode 100644 drivers/cpufreq/maple-cpufreq.c

