From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH] cpufreq: speedstep -> speedstep-ich
Date: Tue, 2 Sep 2003 17:14:27 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902151427.GC8512@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@www.linux.org.uk

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2003-09-02 16:14:28.532376960 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2003-09-02 16:16:03.932873880 +0200
@@ -308,7 +308,7 @@
 
 
 static struct cpufreq_driver speedstep_driver = {
-	.name		= "speedstep",
+	.name		= "speedstep-ich",
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
