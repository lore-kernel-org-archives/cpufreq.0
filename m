From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Sun, 8 Aug 2004 19:57:27 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040808175726.GA15268@dominikbrodowski.de>
References: <4114D272.6070808@versanet.de>
	<20040807131432.GA8934@dominikbrodowski.de>
	<4114E9C1.8070409@versanet.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="azLHFNyN32YCQGCU"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4114E9C1.8070409@versanet.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Christian Heimanns <heimanns@versanet.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 07, 2004 at 04:40:01PM +0200, Christian Heimanns wrote:
> 
> >>) with 
> >>no success. The module won't load. I'm not sure that the mistake is 
> >>using kernel 2.6.8-rc3 instaed of rc2?
> >>
> >>modprobe acpi
> >>FATAL: Error inserting acpi 
> >>(/lib/modules/2.6.8-rc3-bk1/kernel/arch/i386/kernel/cpu/cpufreq/acpi.ko): 
> >>No such device
> >
> >
> >Just to make sure: the error doesn't appear without the patch?
> >
> 
> Compiling takes a while ;-)

Sorry for the effort you have to get cpufreq to work on your notebook.

> Without the patch the kernelmodule acpi.ko loads without problems. I'm 
> waiting for new orders :-)

oh yes, the patch contained a brown paper bag bug. This new version is
also tested by me, so maybe it helps now.

Thanks,
	Dominik


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.8-rc3-acpi_notify_smm"

[Follow-up to http://marc.theaimsgroup.com/?l=acpi4linux&m=107684287525298&w=2 
and 
which were the last tries of getting this right last February, and FIXME]

Notify SMM of cpufreq

Often, the BIOS changes the CPU frequency if a notebook is (dis)connected
from its AC adapter. This interferes with a) an user setting the CPU frequency
and b) kernel timing code which needs to know loops_per_jiffy, cpu_khz etc.

So, ACPI 2.0 offers a method to disable such BIOS changes -- writing
a value contained in the FADT (pstate_cnt) to the smi_cmd port. This patch
utilizes this method by doing this write in processor.c.

However, most current notebooks only offer 1.0 ACPI tables, where the
pstate_cnt entry is marked as "reserved". Unless ACPI is in strict mode,
the value in this "reserved" field is used as well, but a warning is
printed.

So, when is the BIOS notified? When should it be notified? The ACPI 
specification doesn't say much about it. This patch does it if either
of the following cpufreq drivers is pretty much done with a successful
registration:

- acpi
- powernow-k7 [if either it is blacklisted or acpi_force is used]
- powernow-k8 [if the preferred DSDT method is used -- normally, it is...]
- speedstep-centrino [if the preferred DSDT method is used -- normally, it is...]

There's a small problem with the whole pstate_cnt approach: if there is a 
pyhsical[*] platform limit, it might be necessary to adjust the CPU frequency
to avoid serious problems. Unless the BIOS is notified the kernel is aware of _PPC, 
the BIOS will likely do such adjustments on its own. As it is notified now that the 
OS is handling P-States, it might be that the BIOS won't handle such serious 
limits -- but if the cpufreq driver is "rmmod'ed" in between, it won't be handled. 
This is a serious error, but it will _also_ happen on _any_ OS if:
a) the pstate_cnt is written to the BIOS
b) the system locks up hard afterwards so that even IRQs are not handled any more
c) the physical platform limit event occurs

So, both the cpufreq driver and the acpi processor module are "locked" (i.e. rmmod
won't work any more) if the BIOS contains a _PPC entry, and acpi_processor_notify_smm()
is called.

[*] not the "we-want-to-have-X-hours-of-battery-time-in-that-test" type of platform limits...

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 arch/i386/kernel/cpu/cpufreq/acpi.c               |    4 -
 arch/i386/kernel/cpu/cpufreq/powernow-k7.c        |    3
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c        |    4 +
 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    3
 drivers/acpi/processor.c                          |   87 +++++++++++++++++++---
 drivers/acpi/tables/tbconvrt.c                    |   10 ++
 include/acpi/actbl.h                              |    2
 include/acpi/processor.h                          |    4 +
 8 files changed, 106 insertions(+), 11 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c linux/arch/i386/kernel/cpu/cpufreq/acpi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c	2004-08-05 17:45:13.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/acpi.c	2004-08-08 18:31:12.591798016 +0200
@@ -335,7 +335,9 @@
 	if (result) {
 		goto err_freqfree;
 	}
-		
+
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
 
 	printk(KERN_INFO "cpufreq: CPU%u - ACPI performance management activated.\n",
 	       cpu);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-08-05 17:45:13.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-08-08 18:31:12.595797408 +0200
@@ -400,6 +400,9 @@
 	powernow_table[i].frequency = CPUFREQ_TABLE_END;
 	powernow_table[i].index = 0;
 
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 
 err2:
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-08-05 17:45:13.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-08-08 18:31:12.596797256 +0200
@@ -768,6 +768,10 @@
 	data->numps = data->acpi_data.state_count;
 	print_basics(data);
 	powernow_k8_acpi_pst_values(data, 0);
+
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 
 err_out_mem:
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-06 21:56:12.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-08 18:31:12.761772176 +0200
@@ -423,6 +423,9 @@
 			centrino_model->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
 	}
 
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 
  err_kfree_all:
diff -ruN linux-original/drivers/acpi/processor.c linux/drivers/acpi/processor.c
--- linux-original/drivers/acpi/processor.c	2004-08-05 17:41:40.000000000 +0200
+++ linux/drivers/acpi/processor.c	2004-08-08 18:31:12.818763512 +0200
@@ -759,7 +759,10 @@
  * policy is adjusted accordingly.
  */
 
-static int acpi_processor_ppc_is_init = 0;
+#define PPC_REGISTERED   1
+#define PPC_IN_USE       2
+
+static int acpi_processor_ppc_status = 0;
 
 static int acpi_processor_ppc_notifier(struct notifier_block *nb, 
 	unsigned long event,
@@ -817,6 +820,10 @@
 	 * (e.g. 0 = states 0..n; 1 = states 1..n; etc.
 	 */
 	status = acpi_evaluate_integer(pr->handle, "_PPC", NULL, &ppc);
+
+	if (status != AE_NOT_FOUND)
+		acpi_processor_ppc_status |= PPC_IN_USE;
+
 	if(ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Error evaluating _PPC\n"));
 		return_VALUE(-ENODEV);
@@ -841,17 +848,17 @@
 
 static void acpi_processor_ppc_init(void) {
 	if (!cpufreq_register_notifier(&acpi_ppc_notifier_block, CPUFREQ_POLICY_NOTIFIER))
-		acpi_processor_ppc_is_init = 1;
+		acpi_processor_ppc_status |= PPC_REGISTERED;
 	else
 		printk(KERN_DEBUG "Warning: Processor Platform Limit not supported.\n");
 }
 
 
 static void acpi_processor_ppc_exit(void) {
-	if (acpi_processor_ppc_is_init)
+	if (acpi_processor_ppc_status & PPC_REGISTERED)
 		cpufreq_unregister_notifier(&acpi_ppc_notifier_block, CPUFREQ_POLICY_NOTIFIER);
 
-	acpi_processor_ppc_is_init = 0;
+	acpi_processor_ppc_status &= ~PPC_REGISTERED;
 }
 
 /*
@@ -1072,6 +1079,73 @@
 }
 
 
+int acpi_processor_notify_smm(struct module *calling_module) {
+	acpi_status		status;
+	static int		is_done = 0;
+
+	ACPI_FUNCTION_TRACE("acpi_processor_notify_smm");
+
+	if (!(acpi_processor_ppc_status & PPC_REGISTERED))
+		return_VALUE(-EBUSY);
+
+	if (!try_module_get(calling_module))
+		return_VALUE(-EINVAL);
+
+	/* is_done is set to negative if an error occured,
+	 * and to postitive if _no_ error occured, but SMM
+	 * was already notified. This avoids double notification
+	 * which might lead to unexpected results...
+	 */
+	if (is_done > 0) {
+		module_put(calling_module);
+		return_VALUE(0);
+	}
+	else if (is_done < 0) {
+		module_put(calling_module);
+		return_VALUE(is_done);
+	}
+
+	is_done = -EIO;
+
+	/* Can't write pstate_cnt to smi_cmd if either value is zero */
+	if ((!acpi_fadt.smi_cmd) ||
+	    (!acpi_fadt.pstate_cnt)) {
+		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
+			"No SMI port or pstate_cnt\n"));
+		module_put(calling_module);
+		return_VALUE(0);
+	}
+
+	ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Writing pstate_cnt [0x%x] to smi_cmd [0x%x]\n", acpi_fadt.pstate_cnt, acpi_fadt.smi_cmd));
+
+	/* FADT v1 doesn't support pstate_cnt, many BIOS vendors use
+	 * it anyway, so we need to support it... */
+	if (acpi_fadt_is_v1) {
+		ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Using v1.0 FADT reserved value for pstate_cnt\n"));
+	}
+
+	status = acpi_os_write_port (acpi_fadt.smi_cmd,
+				     (u32) acpi_fadt.pstate_cnt, 8);
+	if (ACPI_FAILURE (status)) {
+		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
+				  "Failed to write pstate_cnt [0x%x] to "
+				  "smi_cmd [0x%x]\n", acpi_fadt.pstate_cnt, acpi_fadt.smi_cmd));
+		module_put(calling_module);
+		return_VALUE(status);
+	}
+
+	/* Success. If there's no _PPC, we need to fear nothing, so
+	 * we can allow the cpufreq driver to be rmmod'ed. */
+	is_done = 1;
+
+	if (!(acpi_processor_ppc_status & PPC_IN_USE))
+		module_put(calling_module);
+
+	return_VALUE(0);
+}
+EXPORT_SYMBOL(acpi_processor_notify_smm);
+
+
 #ifdef CONFIG_X86_ACPI_CPUFREQ_PROC_INTF
 /* /proc/acpi/processor/../performance interface (DEPRECATED) */
 
@@ -1228,7 +1302,7 @@
 
 	ACPI_FUNCTION_TRACE("acpi_processor_register_performance");
 
-	if (!acpi_processor_ppc_is_init)
+	if (!(acpi_processor_ppc_status & PPC_REGISTERED))
 		return_VALUE(-EINVAL);
 
 	down(&performance_sem);
@@ -1269,9 +1343,6 @@
 
 	ACPI_FUNCTION_TRACE("acpi_processor_unregister_performance");
 
-	if (!acpi_processor_ppc_is_init)
-		return_VOID;
-
 	down(&performance_sem);
 
 	pr = processors[cpu];
diff -ruN linux-original/drivers/acpi/tables/tbconvrt.c linux/drivers/acpi/tables/tbconvrt.c
--- linux-original/drivers/acpi/tables/tbconvrt.c	2004-08-05 17:43:25.000000000 +0200
+++ linux/drivers/acpi/tables/tbconvrt.c	2004-08-08 18:31:12.931746336 +0200
@@ -50,6 +50,8 @@
 	 ACPI_MODULE_NAME    ("tbconvrt")
 
 
+u8 acpi_fadt_is_v1;
+
 /*******************************************************************************
  *
  * FUNCTION:    acpi_tb_get_table_count
@@ -212,6 +214,7 @@
 
 	/* ACPI 1.0 FACS */
 	/* The BIOS stored FADT should agree with Revision 1.0 */
+	acpi_fadt_is_v1 = 1;
 
 	/*
 	 * Copy the table header and the common part of the tables.
@@ -240,9 +243,12 @@
 	/*
 	 * Processor Performance State Control. This is the value OSPM writes to
 	 * the SMI_CMD register to assume processor performance state control
-	 * responsibility. There isn't any equivalence in 1.0, leave it zeroed.
+	 * responsibility. There isn't any equivalence in 1.0, but as many 1.x
+	 * ACPI tables contain _PCT and _PSS we also keep this value, unless
+	 * acpi_strict is set.
 	 */
-	local_fadt->pstate_cnt = 0;
+	if (acpi_strict)
+		local_fadt->pstate_cnt = 0;
 
 	/*
 	 * Support for the _CST object and C States change notification.
diff -ruN linux-original/include/acpi/actbl.h linux/include/acpi/actbl.h
--- linux-original/include/acpi/actbl.h	2004-08-05 17:41:46.000000000 +0200
+++ linux/include/acpi/actbl.h	2004-08-08 18:31:12.986737976 +0200
@@ -343,5 +343,7 @@
 #include "actbl1.h"   /* Acpi 1.0 table definitions */
 #include "actbl2.h"   /* Acpi 2.0 table definitions */
 
+extern u8 acpi_fadt_is_v1; /* is set to 1 if FADT is revision 1,
+			    * needed for certain workarounds */
 
 #endif /* __ACTBL_H__ */
diff -ruN linux-original/include/acpi/processor.h linux/include/acpi/processor.h
--- linux-original/include/acpi/processor.h	2004-08-05 17:41:46.000000000 +0200
+++ linux/include/acpi/processor.h	2004-08-08 18:31:12.986737976 +0200
@@ -140,4 +140,8 @@
 	struct acpi_processor_performance * performance,
 	unsigned int cpu);
 
+/* note: this locks both the calling module and the processor module
+         if a _PPC object exists, rmmod is disallowed then */
+int acpi_processor_notify_smm(struct module *calling_module);
+
 #endif

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--azLHFNyN32YCQGCU--

