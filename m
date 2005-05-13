From: Adrian Bunk <bunk@stusta.de>
Subject: [-mm patch] drivers/cpufreq/cpufreq_conservative.c: make
	cpufreq_gov_dbs static
Date: Fri, 13 May 2005 02:47:37 +0200
Message-ID: <20050513004737.GV3603@stusta.de>
References: <20050512033100.017958f6.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050512033100.017958f6.akpm@osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Alexander Clouter <alex-kernel@digriz.org.uk>
Cc: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Thu, May 12, 2005 at 03:31:00AM -0700, Andrew Morton wrote:
>...
> Changes since 2.6.12-rc3-mm3:
>...
> +cpufreq-CPUFREQ-13-static-cpufreq_gov_dbs.patch
>...

This is my patch to make the needlessly global and EXPORT_SYMBOL'ed 
cpufreq_gov_dbs in cpufreq_ondemand.c static.

> +cpufreq-CPUFREQ-16-conservative-governer.patch
>...

This patch adds a needlessly global and EXPORT_SYMBOL'ed 
cpufreq_gov_dbs in cpufreq_conservative.c .

Patch below...

>  Additions to cpufreq tree
>...

cu
Adrian


<--  snip  -->



This patch makes a needlessly global and EXPORT_SYMBOL'ed struct static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.12-rc4-mm1-full/drivers/cpufreq/cpufreq_conservative.c.old	2005-05-13 01:42:33.000000000 +0200
+++ linux-2.6.12-rc4-mm1-full/drivers/cpufreq/cpufreq_conservative.c	2005-05-13 01:42:51.000000000 +0200
@@ -583,12 +583,11 @@
 	return 0;
 }
 
-struct cpufreq_governor cpufreq_gov_dbs = {
+static struct cpufreq_governor cpufreq_gov_dbs = {
 	.name		= "conservative",
 	.governor	= cpufreq_governor_dbs,
 	.owner		= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_dbs);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
