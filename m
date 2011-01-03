From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 02/32] powerpc/cell: use system_wq in cpufreq_spudemand
Date: Mon,  3 Jan 2011 14:49:25 +0100
Message-ID: <1294062595-30097-3-git-send-email-tj@kernel.org>
References: <1294062595-30097-1-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=zf6n09ZR2qgwsgqRZ5p4hunS3kgjjGspF5TMBAoVq50=;
	b=ah8Xw2Emyubmn1cX02sRWi8hSooYXCnNRHj4S3UDMiK39K6xe/Xf/wDPAHgnJvoFHL
	YyhOQ5U9QdenR4PtsbGY0qzUsL7yw15777XxZY2ZR3xuRpIl/uCH5d5zX7/Lm9OSze1M
	16BPudR1YkJghikYJ9h6FlIp8cBzvfgDS9+SU=
In-Reply-To: <1294062595-30097-1-git-send-email-tj@kernel.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Dave Jones <davej@redhat.com>, linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

With cmwq, there's no reason to use a separate workqueue in
cpufreq_spudemand.  Use system_wq instead.  The work items are already
sync canceled on stop, so it's already guaranteed that no work is
running when spu_gov_exit() is entered.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org
---
Only compile tested.  Please feel free to take it into the subsystem
tree or simply ack - I'll route it through the wq tree.

Thanks.

 arch/powerpc/platforms/cell/cpufreq_spudemand.c |   20 +++-----------------
 1 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/cell/cpufreq_spudemand.c b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
index 968c1c0..d809836 100644
--- a/arch/powerpc/platforms/cell/cpufreq_spudemand.c
+++ b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
@@ -39,8 +39,6 @@ struct spu_gov_info_struct {
 };
 static DEFINE_PER_CPU(struct spu_gov_info_struct, spu_gov_info);
 
-static struct workqueue_struct *kspugov_wq;
-
 static int calc_freq(struct spu_gov_info_struct *info)
 {
 	int cpu;
@@ -71,14 +69,14 @@ static void spu_gov_work(struct work_struct *work)
 	__cpufreq_driver_target(info->policy, target_freq, CPUFREQ_RELATION_H);
 
 	delay = usecs_to_jiffies(info->poll_int);
-	queue_delayed_work_on(info->policy->cpu, kspugov_wq, &info->work, delay);
+	schedule_delayed_work_on(info->policy->cpu, &info->work, delay);
 }
 
 static void spu_gov_init_work(struct spu_gov_info_struct *info)
 {
 	int delay = usecs_to_jiffies(info->poll_int);
 	INIT_DELAYED_WORK_DEFERRABLE(&info->work, spu_gov_work);
-	queue_delayed_work_on(info->policy->cpu, kspugov_wq, &info->work, delay);
+	schedule_delayed_work_on(info->policy->cpu, &info->work, delay);
 }
 
 static void spu_gov_cancel_work(struct spu_gov_info_struct *info)
@@ -152,27 +150,15 @@ static int __init spu_gov_init(void)
 {
 	int ret;
 
-	kspugov_wq = create_workqueue("kspugov");
-	if (!kspugov_wq) {
-		printk(KERN_ERR "creation of kspugov failed\n");
-		ret = -EFAULT;
-		goto out;
-	}
-
 	ret = cpufreq_register_governor(&spu_governor);
-	if (ret) {
+	if (ret)
 		printk(KERN_ERR "registration of governor failed\n");
-		destroy_workqueue(kspugov_wq);
-		goto out;
-	}
-out:
 	return ret;
 }
 
 static void __exit spu_gov_exit(void)
 {
 	cpufreq_unregister_governor(&spu_governor);
-	destroy_workqueue(kspugov_wq);
 }
 
 
-- 
1.7.1
