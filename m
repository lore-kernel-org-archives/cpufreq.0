From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq Makefile,1.2,1.3 proc_intf.c,1.1,1.2 userspace.c,1.4,1.5
Date: Tue, 19 Aug 2003 14:38:37 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6h3-0005jx-Bw@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv22028/linux/drivers/cpufreq

Modified Files:
	Makefile proc_intf.c userspace.c 
Log Message:
sync with latest davej version

Index: Makefile
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Makefile,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- Makefile	22 Feb 2003 10:23:47 -0000	1.2
+++ Makefile	19 Aug 2003 13:38:33 -0000	1.3
@@ -1,4 +1,7 @@
-#CPUfreq governors and cross-arch helpers
+# CPUfreq governors 
+obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= userspace.o
+
+# CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o
 obj-$(CONFIG_CPU_FREQ_PROC_INTF)	+= proc_intf.o
-obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= userspace.o
+

Index: proc_intf.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/proc_intf.c,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -r1.1 -r1.2
--- proc_intf.c	20 Feb 2003 18:07:31 -0000	1.1
+++ proc_intf.c	19 Aug 2003 13:38:33 -0000	1.2
@@ -13,6 +13,8 @@
 #include <asm/uaccess.h>
 
 
+#define CPUFREQ_ALL_CPUS		((NR_CPUS))
+
 /**
  * cpufreq_parse_policy - parse a policy string
  * @input_string: the string to parse.
@@ -209,7 +211,7 @@
 {
 	struct proc_dir_entry *entry = NULL;
 
-        /* are these acceptable values? */
+	/* are these acceptable values? */
 	entry = create_proc_entry("cpufreq", S_IFREG|S_IRUGO|S_IWUSR, 
 				  &proc_root);
 

Index: userspace.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/userspace.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- userspace.c	7 Mar 2003 10:30:20 -0000	1.4
+++ userspace.c	19 Aug 2003 13:38:33 -0000	1.5
@@ -158,7 +158,7 @@
 /*********************** cpufreq_sysctl interface ********************/
 static int
 cpufreq_procctl(ctl_table *ctl, int write, struct file *filp,
-		void *buffer, size_t *lenp)
+		void __user *buffer, size_t *lenp)
 {
 	char buf[16], *p;
 	int cpu = (int) ctl->extra1;
@@ -195,9 +195,9 @@
 }
 
 static int
-cpufreq_sysctl(ctl_table *table, int *name, int nlen,
-	       void *oldval, size_t *oldlenp,
-	       void *newval, size_t newlen, void **context)
+cpufreq_sysctl(ctl_table *table, int __user *name, int nlen,
+	       void __user *oldval, size_t __user *oldlenp,
+	       void __user *newval, size_t newlen, void **context)
 {
 	int cpu = (int) table->extra1;
 
@@ -524,10 +524,10 @@
 		cpu_min_freq[cpu] = policy->min;
 		cpu_max_freq[cpu] = policy->max;
 		if (policy->max < cpu_cur_freq[cpu])
-			cpufreq_driver_target(&current_policy[cpu], policy->max, 
+			__cpufreq_driver_target(&current_policy[cpu], policy->max, 
 			      CPUFREQ_RELATION_H);
 		else if (policy->min > cpu_cur_freq[cpu])
-			cpufreq_driver_target(&current_policy[cpu], policy->min, 
+			__cpufreq_driver_target(&current_policy[cpu], policy->min, 
 			      CPUFREQ_RELATION_L);
 		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
 		up(&userspace_sem);
