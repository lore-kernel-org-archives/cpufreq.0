From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 20/42] drivers/cpufreq: Adjust confusing if indentation
Date: Thu, 5 Aug 2010 22:23:00 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1008052222450.31692@ask.diku.dk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Indent the body of for_each_cpu.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column == p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/cpufreq/cpufreq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 199dcb9..c63a438 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -918,8 +918,8 @@ static int cpufreq_add_dev_interface(unsigned int cpu,
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	for_each_cpu(j, policy->cpus) {
-	if (!cpu_online(j))
-		continue;
+		if (!cpu_online(j))
+			continue;
 		per_cpu(cpufreq_cpu_data, j) = policy;
 		per_cpu(cpufreq_policy_cpu, j) = policy->cpu;
 	}
