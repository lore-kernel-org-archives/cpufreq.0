From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH 4/6] cpufreq: Add a get_current_driver helper
Date: Sun, 20 Jan 2013 11:24:28 +0100
Message-ID: <1358677470-17394-5-git-send-email-bp@alien8.de>
References: <1358677470-17394-1-git-send-email-bp@alien8.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=me3f32f7rAyVqJhIa/r4vgalAckXFv5PAxAoNQ6bZAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=TK2I
	NjqW6z9j2lYwYM2bcCPof82+VOS9gr+93lDkVoV4gBKSW0yqo0DLK18L3iujs38txgy
	4g3TWaJukEDOex4aDRIEICuIjyoYvPRmV0VQvX9YhyICGpV8/dKQmfaRTi1lKNxT9v9
	0k7BuSuKTUIXB6UQkCBXu5TbMsXbA8Uxk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677477; bh=me3f32f7rAyVqJhIa/r4vgalAckXFv5PAxAoNQ6bZAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=E9nY
	wM4fSHyLsnhkw+HvzpIO3SqB0tB1KlpWriH4dVP80vAZeC0IcEJjdfs3xztT6u/fhVi
	tlRzayh/5NuhlrRF5YIYNcd9RtcPJrBD+wBTJ8l/dZDjuQW4F4gY02X/6B6YhyBZvGD
	afCQf/3Y+ENj7ERsxR4P7nlwXPEXOW43w=
In-Reply-To: <1358677470-17394-1-git-send-email-bp@alien8.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, Tom Gundersen <teg@jklm.no>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

Add a helper function to return cpufreq_driver->name.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/cpufreq/cpufreq.c | 14 ++++++++++++++
 include/linux/cpufreq.h   |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 1f93dbd72355..6ed3c1377caf 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1386,6 +1386,20 @@ static struct syscore_ops cpufreq_syscore_ops = {
 	.resume		= cpufreq_bp_resume,
 };
 
+/**
+ *	cpufreq_get_current_driver - return current driver's name
+ *
+ *	Return the name string of the currently loaded cpufreq driver
+ *	or NULL, if none.
+ */
+const char *cpufreq_get_current_driver(void)
+{
+	if (cpufreq_driver)
+		return cpufreq_driver->name;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(cpufreq_get_current_driver);
 
 /*********************************************************************
  *                     NOTIFIER LISTS INTERFACE                      *
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index a55b88eaf96a..a018da2d2a7c 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -407,4 +407,5 @@ void cpufreq_frequency_table_get_attr(struct cpufreq_frequency_table *table,
 				      unsigned int cpu);
 
 void cpufreq_frequency_table_put_attr(unsigned int cpu);
+extern const char *cpufreq_get_current_driver(void);
 #endif /* _LINUX_CPUFREQ_H */
-- 
1.8.1.rc3
