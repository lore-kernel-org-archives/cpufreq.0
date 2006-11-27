From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] Correct symlink cpufreq handling when offlining dual/ht
	core machines
Date: Mon, 27 Nov 2006 16:06:15 +0100
Message-ID: <1164639976.4656.188.camel@queen.suse.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-e1l1bBPU2mXIvqj+ycQ5"
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
To: cpufreq <cpufreq@www.linux.org.uk>
Cc: Dave Jones <davej@redhat.com>


--=-e1l1bBPU2mXIvqj+ycQ5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The bug does not break anything currently (AFAIK), the fix is just for
correctness...

Here an example:
l -d cpu*/cpufreq
cpu0/cpufreq/
cpu1/cpufreq -> ../../../../devices/system/cpu/cpu0/cpufreq/
cpu2/cpufreq/
cpu3/cpufreq -> ../../../../devices/system/cpu/cpu2/cpufreq/

echo 0 >cpu2/online
cpu0/cpufreq/
cpu1/cpufreq -> ../../../../devices/system/cpu/cpu0/cpufreq/
cpu3/cpufreq/

Without the patch the last dir (cpu3/cpufreq/, which previously was a
symlink) would be missing now.

echo 1 >cpu2/online

l -d cpu*/cpufreq
cpu0/cpufreq/
cpu1/cpufreq -> ../../../../devices/system/cpu/cpu0/cpufreq/
cpu2/cpufreq -> ../../../../devices/system/cpu/cpu3/cpufreq/
cpu3/cpufreq/

Difference after offlining/onlining one "main" core with this patch:
The CPU which has a symlink cpufreq and the CPU which has the origin dir
have will be exchanged if the core without the symlink got
offlined/onlined.

Patch is against 2.6.18 with my previous one ("If a CPU gets onlined set
the governor to the one that is run on other CPUs") also applied,
therefore it might fuz a bit...

Please consider to apply to 2.6.20-rc1




Correct symlink cpufreq handling when offlining dual/ht core machines

If you offline a main CPU, the symlink of the cpufreq dir of the managed
CPU just vanished. Now it get's it's own cpufreq managing directory. As soon
as the sibling core is onlined again, this one gets a symlinked cpufreq dir.

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 drivers/cpufreq/cpufreq.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

Index: linux-2.6.18_cpufreq_symlink_problem/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.18_cpufreq_symlink_problem.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.18_cpufreq_symlink_problem/drivers/cpufreq/cpufreq.c
@@ -817,7 +817,7 @@ static int cpufreq_remove_dev (struct sy
 	unsigned long flags;
 	struct cpufreq_policy *data;
 #ifdef CONFIG_SMP
-	struct sys_device *cpu_sys_dev;
+	struct sys_device *cpu_sys_dev = NULL;
 	unsigned int j;
 #endif
 
@@ -910,6 +910,12 @@ static int cpufreq_remove_dev (struct sy
 	kfree(data);
 
 	cpufreq_debug_enable_ratelimit();
+
+	if (cpu_sys_dev){
+		dprintk("Registering managed CPU as managing CPU");
+		cpufreq_add_dev(cpu_sys_dev);
+	}
+
 	return 0;
 }
 


--=-e1l1bBPU2mXIvqj+ycQ5
Content-Disposition: attachment; filename=cpufreq_recover_symlinks.patch
Content-Type: text/x-patch; name=cpufreq_recover_symlinks.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Correct symlink cpufreq handling when offlining dual/ht core machines

If you offline a main CPU, the symlink of the cpufreq dir of the managed
CPU just vanished. Now it get's it's own cpufreq managing directory, as soon
as the sibling core is onlined again, this one gets a symlinked cpufreq dir.

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 drivers/cpufreq/cpufreq.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

Index: linux-2.6.18_cpufreq_symlink_problem/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.18_cpufreq_symlink_problem.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.18_cpufreq_symlink_problem/drivers/cpufreq/cpufreq.c
@@ -817,7 +817,7 @@ static int cpufreq_remove_dev (struct sy
 	unsigned long flags;
 	struct cpufreq_policy *data;
 #ifdef CONFIG_SMP
-	struct sys_device *cpu_sys_dev;
+	struct sys_device *cpu_sys_dev = NULL;
 	unsigned int j;
 #endif
 
@@ -910,6 +910,12 @@ static int cpufreq_remove_dev (struct sy
 	kfree(data);
 
 	cpufreq_debug_enable_ratelimit();
+
+	if (cpu_sys_dev){
+		dprintk("Registering managed CPU as managing CPU");
+		cpufreq_add_dev(cpu_sys_dev);
+	}
+
 	return 0;
 }
 

--=-e1l1bBPU2mXIvqj+ycQ5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--=-e1l1bBPU2mXIvqj+ycQ5--


