From: dirk.brandewie@gmail.com
Subject: [PATCH] cpufreq/intel_pstate: Change to disallow module build
Date: Wed, 13 Feb 2013 12:14:41 -0800
Message-ID: <1360786482-881-1-git-send-email-dirk.brandewie@gmail.com>
References: <20130212214949.GA1003@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=Tiqz1NXJ19VJ1sPao6lBlTWrf6B3FK51cKigmrkdwpI=;
        b=aBKWbt+MftHFsNFFr1jGbgt6FnV4ULZHVbS5diE5iko6vHYVf27lcHKIkigN8jT9zC
         eKHop0q2dKzBN4bYtFogENfHCsZQvFqLlrA5sX8oQH7enetYc1Fs/ZlAPTtKrU8tXi+f
         sl0fejnadRYWt9CA9aWu0O59BabJbYrEdYfj5howB6i7clu9BIw4XuA1rVj/YmPwnFin
         Rtp8suaIMu2DT1NvkhwCIm4inEzKV7HKWpwRt+WdH0vZ/M3aVi+C9Jgx+kYSlQIM3baJ
         ZNd2fqrO1T//CIsx/JbAXT1BOjOi5p2BD9fZws0IcMt6LJJW7D1GsF+Lpdz0Owf9G9xf
         /drw==
In-Reply-To: <20130212214949.GA1003@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, rjw@sisk.pl
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Load order is important in order for intel_pstate to take over as the
default scaling driver from acpi-cpufreq.

If both are built-in acpi-cpufreq uses late_initcall() and
intel_pstate uses device_initcall() so it will be able to register as
the scaling before acpi-cpufreq for the processors supported by
intel_pstate.

If acpi-cpufreq is built as a module then intel_pstate still gets
first option to become the scaling driver.

Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>
---

based on linux-pm/linux-next fe9e0a66

 drivers/cpufreq/Kconfig.x86 |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index 6aa7053..98e5abb 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -3,7 +3,7 @@
 #
 
 config X86_INTEL_PSTATE
-       tristate "Intel P state control"
+       bool "Intel P state control"
        depends on X86
        help
           This driver provides a P state for Intel core processors.
@@ -13,11 +13,6 @@ config X86_INTEL_PSTATE
 	  When this driver is enabled it will become the perferred
           scaling driver for Sandy bridge processors.
 
-	  Note: This driver should be built with the same settings as
-	  the other scaling drivers configured into the system
-	  (module/built-in) in order for the driver to register itself
-	  as the scaling driver on the system.
-
 	  If in doubt, say N.
 
 config X86_PCC_CPUFREQ
-- 
1.7.7.6
