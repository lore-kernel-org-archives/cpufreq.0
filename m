From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] add missing newline after stats printing
Date: Sat, 2 Aug 2008 09:20:08 +0200
Message-ID: <20080802072008.GA17743@comet.dominikbrodowski.net>
References: <1217598032-24441-1-git-send-email-julien@danjou.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1217598032-24441-1-git-send-email-julien@danjou.info>
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
To: Julien Danjou <julien@danjou.info>
Cc: cpufreq@lists.linux.org.uk

Thanks, applied.

From: Julien Danjou <julien@danjou.info>
Date: Fri, 1 Aug 2008 15:40:32 +0200
Subject: [PATCH] add missing newline after stats printing

[linux@dominikbrodowski.net: avoid double newline when total_trans
 is printed]
Signed-off-by: Julien Danjou <julien@danjou.info>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 utils/info.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/utils/info.c b/utils/info.c
index 115a446..05bf9d6 100644
--- a/utils/info.c
+++ b/utils/info.c
@@ -223,6 +223,8 @@ static void debug_output_one(unsigned int cpu)
 		total_trans = cpufreq_get_transitions(cpu);
 		if (total_trans)
 			printf("  (%lu)\n", total_trans);
+		else
+			printf("\n");
 	}
 }
 
-- 
1.5.4.3
