From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] drivers/cpufreq/cpufreq.c: fix a compile warning with
	SMP=n
Date: Mon, 7 Nov 2005 21:03:45 +0100
Message-ID: <20051107200345.GJ3847@stusta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

This patch fixes the following compile warning with CONFIG_SMP=n:

<--  snip  -->

...
  CC      drivers/cpufreq/cpufreq.o
drivers/cpufreq/cpufreq.c: In function 'cpufreq_remove_dev':
drivers/cpufreq/cpufreq.c:696: warning: unused variable 'cpu_sys_dev'
...

<--  snip  -->


Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.14-mm1-full/drivers/cpufreq/cpufreq.c.old	2005-11-07 19:27:33.000000000 +0100
+++ linux-2.6.14-mm1-full/drivers/cpufreq/cpufreq.c	2005-11-07 19:27:50.000000000 +0100
@@ -693,8 +693,8 @@
 	unsigned int cpu = sys_dev->id;
 	unsigned long flags;
 	struct cpufreq_policy *data;
-	struct sys_device *cpu_sys_dev;
 #ifdef CONFIG_SMP
+	struct sys_device *cpu_sys_dev;
 	unsigned int j;
 #endif
