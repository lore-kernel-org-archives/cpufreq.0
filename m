From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH 2/2] cpufreq: s5pv210: make needlessly global symbols static
Date: Fri, 08 Jul 2011 14:24:36 +0800
Message-ID: <1310106276.27158.2.camel@phoenix>
References: <1310106044.27158.0.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:to:cc:in-reply-to:references:content-type:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=Pg+f29Z3RIp4HkteNrA2/lG/1JwWyr67A1ph+PffcXc=;
        b=p0atGloWOHxEEWqS0753IE2i0URaABtEZiUHb28V3kIPpnWbnzRwIgC7ndDz62kHU7
         NcCXbL0VkWnJdB//n1jheK8TaqFyOhOaF7aCXFsUU0X/O3PvMNxjwgofFrYd2fjnS6+w
         wB/s4ebmdirVhXU23pWe5aGJAyk5lgx/JjgRU=
In-Reply-To: <1310106044.27158.0.camel@phoenix>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

The following symbols are needlessly defined global:
  s5pv210_verify_speed
  s5pv210_getspeed

Make them static.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index a7cb338..806408e 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -121,7 +121,7 @@ static void s5pv210_set_refresh(enum s5pv210_dmc_port ch, unsigned long freq)
 	__raw_writel(tmp1, reg);
 }
 
-int s5pv210_verify_speed(struct cpufreq_policy *policy)
+static int s5pv210_verify_speed(struct cpufreq_policy *policy)
 {
 	if (policy->cpu)
 		return -EINVAL;
@@ -129,7 +129,7 @@ int s5pv210_verify_speed(struct cpufreq_policy *policy)
 	return cpufreq_frequency_table_verify(policy, s5pv210_freq_table);
 }
 
-unsigned int s5pv210_getspeed(unsigned int cpu)
+static unsigned int s5pv210_getspeed(unsigned int cpu)
 {
 	if (cpu)
 		return 0;
-- 
1.7.4.1



