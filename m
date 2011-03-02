From: Daniel J Blueman <daniel.blueman@gmail.com>
Subject: [2.6.38-rc7, patch] cpuinfo_cur_freq unreadable by non-root
Date: Wed, 2 Mar 2011 13:52:05 +0800
Message-ID: <AANLkTikhgKn9ZCqUXP-K2CtSSTiJ_=tXuhF_t7Rbqgdx@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to:cc
         :content-type;
        bh=u6GgUGrtaijnHx6TDWdFBvgsXrgZfLwMMdsNR1/oyyc=;
        b=vofpyZfoVaUfhhRAk/qevm40g1vsaVcaD+KEjtKfLQ49eZ6dnhZtyRiaRAGYzHn4zk
         cYfE9e8jJ5rpJEVKn6P7ATlsV+KHAIYWSjxbf/qyrzqUcycz9CcYMH7lMXIhShxtuLIx
         p5BQ/JfGcms6y0uVI44gfwR+j++hJq5eWgy70=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>

I failed to find why
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq is only readable
by root; the cost of reading it isn't sufficient to cause memory or
scheduling denial, but may have been in the past.

Thus, allow non-root users read permission, consistent with other
attributes, allowing it to be monitored.

Signed-off-by: Daniel J Blueman <daniel.blueman@gmail.com>

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 1109f68..0f491fe 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -664,7 +664,7 @@ static ssize_t show_bios_limit(struct
cpufreq_policy *policy, char *buf)
 	return sprintf(buf, "%u\n", policy->cpuinfo.max_freq);
 }

-cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
+cpufreq_freq_attr_ro(cpuinfo_cur_freq);
 cpufreq_freq_attr_ro(cpuinfo_min_freq);
 cpufreq_freq_attr_ro(cpuinfo_max_freq);
 cpufreq_freq_attr_ro(cpuinfo_transition_latency);
-- 
Daniel J Blueman
