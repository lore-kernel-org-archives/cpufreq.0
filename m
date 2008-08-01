From: Julien Danjou <julien@danjou.info>
Subject: [PATCH] add missing newline after stats printing
Date: Fri,  1 Aug 2008 15:40:32 +0200
Message-ID: <1217598032-24441-1-git-send-email-julien@danjou.info>
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
Cc: Julien Danjou <julien@danjou.info>

Signed-off-by: Julien Danjou <julien@danjou.info>
---
 utils/info.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/utils/info.c b/utils/info.c
index 115a446..d003045 100644
--- a/utils/info.c
+++ b/utils/info.c
@@ -223,6 +223,7 @@ static void debug_output_one(unsigned int cpu)
 		total_trans = cpufreq_get_transitions(cpu);
 		if (total_trans)
 			printf("  (%lu)\n", total_trans);
+                printf("\n");
 	}
 }
 
-- 
1.5.6.3
