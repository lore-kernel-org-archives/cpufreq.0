From: Thomas Renninger <trenn@suse.de>
Subject: CPUFREQ: Try to load pcc driver on HP ProLiants automatically
Date: Wed, 23 Apr 2014 15:49:23 +0200
Message-ID: <7669060.dKLoxkfpfu@skinner>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: viresh.kumar@linaro.org
Cc: rjw@rjwysocki.net, cpufreq@vger.kernel.org, thomas.mingarelli@hp.com

HP ProLiants are sold with CPU frequency controlled by BIOS by default.
The pcc-cpufreq driver still exports some frequency info to userspace and
should be tried to get loaded on these platforms.

Successfully tested on a recent ProLiant machine:
  - without this patch no pcc-cpufreq driver loaded, no frequency info
  - with this patch the driver got autoloaded

Signed-off-by: Thomas Renninger <trenn@suse.de>

diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
index 728a2d8..ff1ebd0 100644
--- a/drivers/cpufreq/pcc-cpufreq.c
+++ b/drivers/cpufreq/pcc-cpufreq.c
@@ -603,6 +603,8 @@ static void __exit pcc_cpufreq_exit(void)
 	free_percpu(pcc_cpu_info);
 }
 
+MODULE_ALIAS("dmi:*:svnHP:pnProLiant*:*");
+
 MODULE_AUTHOR("Matthew Garrett, Naga Chumbalkar");
 MODULE_VERSION(PCC_VERSION);
 MODULE_DESCRIPTION("Processor Clocking Control interface driver");

