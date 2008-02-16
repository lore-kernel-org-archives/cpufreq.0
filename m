From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: [PATCH] cpufreq: fix show_trans_table
Date: Sat, 16 Feb 2008 08:41:25 -0200
Message-ID: <1203158485-20578-2-git-send-email-cesarb@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Fix show_trans_table when it overflows PAGE_SIZE.

* Not all snprintf calls were protected against being passed a negative
length.
* When show_trans_table overflows, len might be > PAGE_SIZE. In that case,
returns PAGE_SIZE.

Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
---
 drivers/cpufreq/cpufreq_stats.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 1b8312b..f95a29c 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -114,7 +114,7 @@ show_trans_table(struct cpufreq_policy *policy, char *buf)
 				stat->freq_table[i]);
 	}
 	if (len >= PAGE_SIZE)
-		return len;
+		return PAGE_SIZE;
 
 	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
 
@@ -131,8 +131,12 @@ show_trans_table(struct cpufreq_policy *policy, char *buf)
 			len += snprintf(buf + len, PAGE_SIZE - len, "%9u ",
 					stat->trans_table[i*stat->max_state+j]);
 		}
+		if (len >= PAGE_SIZE)
+			break;
 		len += snprintf(buf + len, PAGE_SIZE - len, "\n");
 	}
+	if (len >= PAGE_SIZE)
+		return PAGE_SIZE;
 	return len;
 }
 CPUFREQ_STATDEVICE_ATTR(trans_table,0444,show_trans_table);
-- 
1.5.4
