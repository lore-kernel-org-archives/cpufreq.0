From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k7.c,1.47,1.48
Date: Wed, 21 Jan 2004 13:02:22 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AjHzy-0001wH-QK@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv7450/linux/arch/i386/kernel/cpufreq

Modified Files:
	powernow-k7.c 
Log Message:
linux/arch/i386/kernel/cpufreq/powernow-k7.c

Index: powernow-k7.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c,v
retrieving revision 1.47
retrieving revision 1.48
diff -u -r1.47 -r1.48
--- powernow-k7.c	20 Jan 2004 17:03:31 -0000	1.47
+++ powernow-k7.c	21 Jan 2004 13:02:20 -0000	1.48
@@ -381,6 +381,8 @@
 	printk (KERN_INFO PFX "Minimum speed %d MHz. Maximum speed %d MHz.\n",
 				minimum_speed, maximum_speed);
 
+	cpufreq_frequency_table_get_attr(powernow_table, policy->cpu);
+
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	/* latency is in 10 ns (look for SGTC above) for each VID
@@ -392,10 +394,23 @@
 	return cpufreq_frequency_table_cpuinfo(policy, powernow_table);
 }
 
+static int powernow_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
+}
+
+static struct freq_attr* powernow_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver powernow_driver = {
 	.verify 	= powernow_verify,
 	.target 	= powernow_target,
 	.init		= powernow_cpu_init,
+	.exit		= powernow_cpu_exit,
+	.attr		= powernow_attr,
 	.name		= "powernow-k7",
 	.owner		= THIS_MODULE,
 };
