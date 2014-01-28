From: Konrad Rzeszutek Wilk <konrad@kernel.org>
Subject: [PATCH] acpi-cpufreq: De-register cpu notifier and free struct msr on error.
Date: Mon, 27 Jan 2014 22:58:11 -0500
Message-ID: <1390881491-18998-1-git-send-email-konrad.wilk@oracle.com>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Yj3hRaZnhbxxUuYxKsyqGjm32kv6DxKsA95Z5Cn3o6k=;
        b=oOIO5oDjZoCahQrTqcKMW07xv4xtgpIpd+IqiPIp6tSqWwgGdpgaGu/pDBFNQEREZH
         6+s0YwXlKWj3YIgdKJGou7r4abgtwWY2bVmpRVgAuHpYZI7ZGyIgBf2/LgvX7Qvg5Ust
         CbzXfBTwe140U9vczT1VcnsKNYJ/t4uzebtss6lFX02qrm21C0QPdqQbRIXUzzbBy0/m
         uggIjX4kUJOyQxld1rXwAgpo0kSiPNgBKOsPJnQZdKoCdO88gRbQUNYS5F0RiEJdPqpT
         H6g9RtTIL9/4rbn0is656inQ7tJveDN0EYMmW38bM0yiUs1gf1H/yJbinqcmq9n9dMUO
         cRMw==
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, rafael.j.wysocki@intel.com, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Lukasz Majewski <l.majewski@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>

If cpufreq_register_driver() fails we would free the acpi driver
related structures but not free the ones allocated
by acpi_cpufreq_boost_init() function. This meant that as
the driver error-ed out and a CPU online/offline event came
we would crash and burn as one of the CPU notifiers would point
to garbage.

This fixes a regression that commit cfc9c8ed03e4d908f2388af8815f44c87b503aaf
"acpi-cpufreq: Adjust the code to use the common boost attribute"
introduced.

CC: Lukasz Majewski <l.majewski@samsung.com>
CC: Myungjoo Ham <myungjoo.ham@samsung.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>
CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/cpufreq/acpi-cpufreq.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 79e5608..3e856d6 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -969,9 +969,10 @@ static int __init acpi_cpufreq_init(void)
 	acpi_cpufreq_boost_init();
 
 	ret = cpufreq_register_driver(&acpi_cpufreq_driver);
-	if (ret)
+	if (ret) {
 		free_acpi_perf_data();
-
+		acpi_cpufreq_boost_exit();
+	}
 	return ret;
 }
 
-- 
1.7.7.6

