From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] #if 0 cpufreq.c:cpufreq_get()
Date: Wed, 24 Oct 2007 18:23:12 +0200
Message-ID: <20071024162312.GH30533@stusta.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759537AbXJXQYN@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

cpufreq.c:cpufreq_get() no longer has any user.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 drivers/cpufreq/cpufreq.c |    2 ++
 1 file changed, 2 insertions(+)

099a5401a3c0322177866d4ba4e791825fe921d4 
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 5e626b1..d27c802 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1143,6 +1143,7 @@ static unsigned int __cpufreq_get(unsigned int cpu)
 	return (ret_freq);
 }
 
+#if 0
 /**
  * cpufreq_get - get the current CPU frequency (in kHz)
  * @cpu: CPU number
@@ -1170,6 +1171,7 @@ out:
 	return (ret_freq);
 }
 EXPORT_SYMBOL(cpufreq_get);
+#endif  /*  0  */
 
 
 /**
