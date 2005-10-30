From: "Darrick J. Wong" <djwong@us.ibm.com>
Subject: Re: Can't load speedstep-centrino on IBM x336?
Date: Sat, 29 Oct 2005 19:34:36 -0700
Message-ID: <4364313C.4020902@us.ibm.com>
References: <88056F38E9E48644A0F562A38C64FB600625F151@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1507262490=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB600625F151@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Chris McDermott <lcm@us.ibm.com>, cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1507262490==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigFEC8D2C488CBF08E971C545F"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigFEC8D2C488CBF08E971C545F
Content-Type: multipart/mixed; boundary="------------040008080105050709070608"

This is a multi-part message in MIME format.
--------------040008080105050709070608
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Attached are patches against RHEL4 U2 and SLES9 SP2.

100-500ms is pretty bad; I guess it's worth the check removal.

--D

Pallipadi, Venkatesh wrote:
>  
> 
> 
>>-----Original Message-----
>>From: Darrick J. Wong [mailto:djwong@us.ibm.com] 
>>Sent: Thursday, October 27, 2005 5:54 PM
>>To: Pallipadi, Venkatesh
>>Cc: Dave Jones; cpufreq@lists.linux.org.uk; Chris McDermott
>>Subject: Re: Can't load speedstep-centrino on IBM x336?
>>
>>Venkatesh,
>>
>>It turns out that RHEL4 wasn't calling the SMM to tell it that the OS
>>would handle the p-state transitions.  Thus, the status register trap
>>never got set up, which is why I kept reading 0xFFFF.  RHEL4 also
>>obliterates the value of PSTATE_CNT if the FADT revision is 1.0, so I
>>sent RH a backport of mainline's cpufreq, which only obliterates
>>PSTATE_CNT if acpi=strict and also makes that call to SMM.  With that
>>patch, DBS works great.
>>
> 
> 
> Ok. That's good news. Can you share that patch here? Thanks.
> 
> 
>>However, I am curious about the removal of the status register check in
>>acpi_cpufreq--how slow is reading that status register?  
> 
> 
> It is really slow due to SMM. 100+ mS. One one system I measured it as
> 500 mS.
> 
> 
>>It seems to me
>>that it's a rather good idea to check that the operation actually
>>succeeded, instead of assuming that it does and changing the reported
>>clock speed as if it did, because any failures that happen will be
>>silent; we could only tell if the switch succeeded for sure by running
>>CPU benchmarks.  But, perhaps there's a justification for removing it
>>that I simply don't know about?
> 
> 
> It is mostly needed for enabling new platforms. But, once thinsg are
> working, it really is not required to be tested all the time. It doubles
> the time for a P-state transition.
> 
> Thanks,
> Venki
> 

--------------040008080105050709070608
Content-Type: text/x-patch;
 name="dbs-rhel4-x336_2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dbs-rhel4-x336_2.patch"

diff -Naur orig/arch/i386/kernel/cpu/cpufreq/acpi.c linux-2.6.9/arch/i386/kernel/cpu/cpufreq/acpi.c
--- orig/arch/i386/kernel/cpu/cpufreq/acpi.c	2005-10-27 13:26:30.000000000 -0700
+++ linux-2.6.9/arch/i386/kernel/cpu/cpufreq/acpi.c	2005-10-28 15:02:07.000000000 -0700
@@ -62,6 +62,8 @@
 
 static struct cpufreq_driver acpi_cpufreq_driver;
 
+static unsigned int acpi_pstate_strict;
+
 static int
 acpi_processor_write_port(
 	u16	port,
@@ -166,30 +168,40 @@
 	}
 
 	/*
-	 * Then we read the 'status_register' and compare the value with the
-	 * target state's 'status' to make sure the transition was successful.
-	 * Note that we'll poll for up to 1ms (100 cycles of 10us) before
-	 * giving up.
+	 * Assume the write went through when acpi_pstate_strict is not used.
+	 * As read status_register is an expensive operation and there
+	 * are no specific error cases where an IO port write will fail.
 	 */
+	if (acpi_pstate_strict) {
+		/*
+		 * Then we read the 'status_register' and compare the value with the
+		 * target state's 'status' to make sure the transition was successful.
+		 * Note that we'll poll for up to 1ms (100 cycles of 10us) before
+		 * giving up.
+		 */
 
-	port = data->acpi_data.status_register.address;
-	bit_width = data->acpi_data.status_register.bit_width;
+		port = data->acpi_data.status_register.address;
+		bit_width = data->acpi_data.status_register.bit_width;
 
-	ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
-		"Looking for 0x%08x from port 0x%04x\n",
-		(u32) data->acpi_data.states[state].status, port));
+		ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
+			"Looking for 0x%08x from port 0x%04x\n",
+			(u32) data->acpi_data.states[state].status, port));
 
-	for (i=0; i<100; i++) {
-		ret = acpi_processor_read_port(port, bit_width, &value);
-		if (ret) {	
-			ACPI_DEBUG_PRINT((ACPI_DB_WARN,
-				"Invalid port width 0x%04x\n", bit_width));
-			retval = ret;
-			goto migrate_end;
+		for (i=0; i<100; i++) {
+			ret = acpi_processor_read_port(port, bit_width, &value);
+			if (ret) {	
+				ACPI_DEBUG_PRINT((ACPI_DB_WARN,
+					"Invalid port width 0x%04x\n", bit_width));
+				retval = ret;
+				goto migrate_end;
+			}
+			if (value == (u32) data->acpi_data.states[state].status)
+				break;
+			udelay(10);
 		}
-		if (value == (u32) data->acpi_data.states[state].status)
-			break;
-		udelay(10);
+	} else {
+		i = 0;
+		value = (u32) data->acpi_data.states[state].status;
 	}
 
 	/* notify cpufreq */
@@ -436,6 +448,8 @@
 		goto err_freqfree;
 	}
 		
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
 
 	printk(KERN_INFO "cpufreq: CPU%u - ACPI performance management activated.\n",
 	       cpu);
@@ -520,6 +534,8 @@
 	return_VOID;
 }
 
+module_param(acpi_pstate_strict, uint, 0644);
+MODULE_PARM_DESC(acpi_pstate_strict, "value 0 or non-zero. non-zero -> strict ACPI checks are performed during frequency changes.");
 
 late_initcall(acpi_cpufreq_init);
 module_exit(acpi_cpufreq_exit);
diff -Naur orig/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux-2.6.9/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- orig/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-18 14:53:06.000000000 -0700
+++ linux-2.6.9/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2005-10-27 13:32:24.000000000 -0700
@@ -400,6 +400,9 @@
 	powernow_table[i].frequency = CPUFREQ_TABLE_END;
 	powernow_table[i].index = 0;
 
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 
 err2:
diff -Naur orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux-2.6.9/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005-10-27 13:26:30.000000000 -0700
+++ linux-2.6.9/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005-10-27 13:32:55.000000000 -0700
@@ -779,6 +779,10 @@
 	data->numps = data->acpi_data.state_count;
 	print_basics(data);
 	powernow_k8_acpi_pst_values(data, 0);
+
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 err_out:
 	acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
diff -Naur orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux-2.6.9/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-10-27 13:26:30.000000000 -0700
+++ linux-2.6.9/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-10-27 13:33:15.000000000 -0700
@@ -448,6 +448,9 @@
 			centrino_model[policy->cpu]->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
 	}
 
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 
  err_kfree_all:
diff -Naur orig/drivers/acpi/processor.c linux-2.6.9/drivers/acpi/processor.c
--- orig/drivers/acpi/processor.c	2005-10-27 13:26:34.000000000 -0700
+++ linux-2.6.9/drivers/acpi/processor.c	2005-10-27 15:08:09.000000000 -0700
@@ -770,7 +770,10 @@
  * policy is adjusted accordingly.
  */
 
-static int acpi_processor_ppc_is_init = 0;
+#define PPC_REGISTERED   1
+#define PPC_IN_USE       2
+
+static int acpi_processor_ppc_status = 0;
 
 static int acpi_processor_ppc_notifier(struct notifier_block *nb, 
 	unsigned long event,
@@ -828,6 +831,10 @@
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
@@ -852,17 +859,17 @@
 
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
@@ -1095,6 +1102,72 @@
 	return_VALUE(0);
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
 
 #ifdef CONFIG_X86_ACPI_CPUFREQ_PROC_INTF
 /* /proc/acpi/processor/../performance interface (DEPRECATED) */
@@ -1252,7 +1325,7 @@
 
 	ACPI_FUNCTION_TRACE("acpi_processor_register_performance");
 
-	if (!acpi_processor_ppc_is_init)
+	if (!(acpi_processor_ppc_status & PPC_REGISTERED))
 		return_VALUE(-EINVAL);
 
 	down(&performance_sem);
@@ -1293,9 +1366,6 @@
 
 	ACPI_FUNCTION_TRACE("acpi_processor_unregister_performance");
 
-	if (!acpi_processor_ppc_is_init)
-		return_VOID;
-
 	down(&performance_sem);
 
 	pr = processors[cpu];
diff -Naur orig/drivers/acpi/tables/tbconvrt.c linux-2.6.9/drivers/acpi/tables/tbconvrt.c
--- orig/drivers/acpi/tables/tbconvrt.c	2005-10-27 13:26:33.000000000 -0700
+++ linux-2.6.9/drivers/acpi/tables/tbconvrt.c	2005-10-27 14:47:28.000000000 -0700
@@ -49,6 +49,8 @@
 #define _COMPONENT          ACPI_TABLES
 	 ACPI_MODULE_NAME    ("tbconvrt")
 
+u8 acpi_fadt_is_v1;
+EXPORT_SYMBOL(acpi_fadt_is_v1);
 
 /*******************************************************************************
  *
@@ -212,6 +214,7 @@
 
 	/* ACPI 1.0 FACS */
 	/* The BIOS stored FADT should agree with Revision 1.0 */
+	acpi_fadt_is_v1 = 1;
 
 	/*
 	 * Copy the table header and the common part of the tables.
@@ -242,7 +245,8 @@
 	 * the SMI_CMD register to assume processor performance state control
 	 * responsibility. There isn't any equivalence in 1.0, leave it zeroed.
 	 */
-	local_fadt->pstate_cnt = 0;
+	if (acpi_strict)
+		local_fadt->pstate_cnt = 0;
 
 	/*
 	 * Support for the _CST object and C States change notification.
diff -Naur orig/include/acpi/actbl.h linux-2.6.9/include/acpi/actbl.h
--- orig/include/acpi/actbl.h	2004-10-18 14:54:08.000000000 -0700
+++ linux-2.6.9/include/acpi/actbl.h	2005-10-27 14:06:07.000000000 -0700
@@ -330,6 +330,8 @@
 #include "actbl1.h"   /* Acpi 1.0 table definitions */
 #include "actbl2.h"   /* Acpi 2.0 table definitions */
 
+extern u8 acpi_fadt_is_v1; /* is set to 1 if FADT is revision 1,
+			    * needed for certain workarounds */
 
 #pragma pack(1)
 /*
diff -Naur orig/include/acpi/processor.h linux-2.6.9/include/acpi/processor.h
--- orig/include/acpi/processor.h	2004-10-18 14:53:51.000000000 -0700
+++ linux-2.6.9/include/acpi/processor.h	2005-10-27 13:36:27.000000000 -0700
@@ -140,4 +140,8 @@
 	struct acpi_processor_performance * performance,
 	unsigned int cpu);
 
+/* note: this locks both the calling module and the processor module
+         if a _PPC object exists, rmmod is disallowed then */
+int acpi_processor_notify_smm(struct module *calling_module);
+
 #endif

--------------040008080105050709070608
Content-Type: text/x-patch;
 name="dbs-sles9-x336_2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dbs-sles9-x336_2.patch"

diff -Naur orig/arch/i386/kernel/cpu/cpufreq/acpi.c linux-2.6.5/arch/i386/kernel/cpu/cpufreq/acpi.c
--- orig/arch/i386/kernel/cpu/cpufreq/acpi.c	2005-10-27 17:24:58.000000000 -0700
+++ linux-2.6.5/arch/i386/kernel/cpu/cpufreq/acpi.c	2005-10-28 15:28:46.667369840 -0700
@@ -59,6 +59,7 @@
 
 static struct cpufreq_acpi_io	*acpi_io_data[NR_CPUS];
 
+static unsigned int acpi_pstate_strict;
 
 static int
 acpi_processor_write_port(
@@ -170,30 +171,40 @@
 	}
 
 	/*
-	 * Then we read the 'status_register' and compare the value with the
-	 * target state's 'status' to make sure the transition was successful.
-	 * Note that we'll poll for up to 1ms (100 cycles of 10us) before
-	 * giving up.
+	 * Assume the write went through when acpi_pstate_strict is not used.
+	 * As read status_register is an expensive operation and there
+	 * are no specific error cases where an IO port write will fail.
 	 */
-
-	port = data->acpi_data.status_register.address;
-	bit_width = data->acpi_data.status_register.bit_width;
-
-	ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
-		"Looking for 0x%08x from port 0x%04x\n",
-		(u32) data->acpi_data.states[state].status, port));
-
-	for (i=0; i<100; i++) {
-		ret = acpi_processor_read_port(port, bit_width, &value);
-		if (ret) {	
-			ACPI_DEBUG_PRINT((ACPI_DB_WARN,
-				"Invalid port width 0x%04x\n", bit_width));
-			retval = ret;
-			goto migrate_end;
+	if (acpi_pstate_strict) {
+		/*
+		 * Then we read the 'status_register' and compare the value with the
+		 * target state's 'status' to make sure the transition was successful.
+		 * Note that we'll poll for up to 1ms (100 cycles of 10us) before
+		 * giving up.
+		 */
+
+		port = data->acpi_data.status_register.address;
+		bit_width = data->acpi_data.status_register.bit_width;
+
+		ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
+			"Looking for 0x%08x from port 0x%04x\n",
+			(u32) data->acpi_data.states[state].status, port));
+
+		for (i=0; i<100; i++) {
+			ret = acpi_processor_read_port(port, bit_width, &value);
+			if (ret) {	
+				ACPI_DEBUG_PRINT((ACPI_DB_WARN,
+					"Invalid port width 0x%04x\n", bit_width));
+				retval = ret;
+				goto migrate_end;
+			}
+			if (value == (u32) data->acpi_data.states[state].status)
+				break;
+			udelay(10);
 		}
-		if (value == (u32) data->acpi_data.states[state].status)
-			break;
-		udelay(10);
+	} else {
+		i = 0;
+		value = (u32) data->acpi_data.states[state].status;
 	}
 
 	/* notify cpufreq */
@@ -410,6 +421,9 @@
 	if (result) {
 		goto err_freqfree;
 	}
+
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
 		
 
 	printk(KERN_INFO "cpufreq: CPU%u - ACPI performance management activated.\n",
@@ -491,6 +505,8 @@
 	return_VOID;
 }
 
+module_param(acpi_pstate_strict, uint, 0644);
+MODULE_PARM_DESC(acpi_pstate_strict, "value 0 or non-zero. non-zero -> strict ACPI checks are performed during frequency changes.");
 
 late_initcall(acpi_cpufreq_init);
 module_exit(acpi_cpufreq_exit);
diff -Naur orig/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux-2.6.5/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- orig/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2005-10-27 17:24:42.000000000 -0700
+++ linux-2.6.5/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2005-10-27 17:33:39.000000000 -0700
@@ -179,6 +179,9 @@
 	powernow_table[number_scales].frequency = CPUFREQ_TABLE_END;
 	powernow_table[number_scales].index = 0;
 
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 }
 
diff -Naur orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux-2.6.5/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005-10-27 17:25:03.000000000 -0700
+++ linux-2.6.5/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005-10-27 17:34:02.000000000 -0700
@@ -790,6 +790,10 @@
 	data->numps = data->acpi_data.state_count;
 	print_basics(data);
 	powernow_k8_acpi_pst_values(data, 0);
+
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 err_out:
 	acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
diff -Naur orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-10-27 17:24:55.000000000 -0700
+++ linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-10-27 17:34:18.000000000 -0700
@@ -456,6 +456,9 @@
 			centrino_model[policy->cpu]->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
 	}
 
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
 	return 0;
 
  err_kfree_all:
diff -Naur orig/drivers/acpi/osl.c linux-2.6.5/drivers/acpi/osl.c
--- orig/drivers/acpi/osl.c	2005-10-27 17:24:58.000000000 -0700
+++ linux-2.6.5/drivers/acpi/osl.c	2005-10-27 18:01:08.000000000 -0700
@@ -360,6 +360,7 @@
 	return AE_OK;
 }
 
+EXPORT_SYMBOL(acpi_os_write_port);
 acpi_status
 acpi_os_write_port(
 	acpi_io_address	port,
diff -Naur orig/drivers/acpi/processor.c linux-2.6.5/drivers/acpi/processor.c
--- orig/drivers/acpi/processor.c	2005-10-27 17:24:58.000000000 -0700
+++ linux-2.6.5/drivers/acpi/processor.c	2005-10-27 17:58:31.000000000 -0700
@@ -52,7 +52,7 @@
 #include <acpi/acpi_bus.h>
 #include <acpi/acpi_drivers.h>
 #include <acpi/processor.h>
-
+#include <acpi/acpiosxf.h>
 
 #define ACPI_PROCESSOR_COMPONENT	0x01000000
 #define ACPI_PROCESSOR_CLASS		"processor"
@@ -771,7 +771,10 @@
  * policy is adjusted accordingly.
  */
 
-static int acpi_processor_ppc_is_init = 0;
+#define PPC_REGISTERED   1
+#define PPC_IN_USE       2
+
+static int acpi_processor_ppc_status = 0;
 
 static int acpi_processor_ppc_notifier(struct notifier_block *nb, 
 	unsigned long event,
@@ -829,6 +832,10 @@
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
@@ -853,17 +860,17 @@
 
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
@@ -1088,6 +1095,72 @@
 	return_VALUE(0);
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
 
 #ifdef CONFIG_X86_ACPI_CPUFREQ_PROC_INTF
 /* /proc/acpi/processor/../performance interface (DEPRECATED) */
@@ -1245,7 +1318,7 @@
 
 	ACPI_FUNCTION_TRACE("acpi_processor_register_performance");
 
-	if (!acpi_processor_ppc_is_init)
+	if (!(acpi_processor_ppc_status & PPC_REGISTERED))
 		return_VALUE(-EINVAL);
 
 	down(&performance_sem);
@@ -1286,9 +1359,6 @@
 
 	ACPI_FUNCTION_TRACE("acpi_processor_unregister_performance");
 
-	if (!acpi_processor_ppc_is_init)
-		return_VOID;
-
 	down(&performance_sem);
 
 	pr = processors[cpu];
diff -Naur orig/drivers/acpi/tables/tbconvrt.c linux-2.6.5/drivers/acpi/tables/tbconvrt.c
--- orig/drivers/acpi/tables/tbconvrt.c	2005-10-27 17:25:03.000000000 -0700
+++ linux-2.6.5/drivers/acpi/tables/tbconvrt.c	2005-10-27 17:38:30.000000000 -0700
@@ -49,6 +49,8 @@
 #define _COMPONENT          ACPI_TABLES
 	 ACPI_MODULE_NAME    ("tbconvrt")
 
+u8 acpi_fadt_is_v1;
+EXPORT_SYMBOL(acpi_fadt_is_v1);
 
 /*******************************************************************************
  *
@@ -212,6 +214,7 @@
 
 	/* ACPI 1.0 FACS */
 	/* The BIOS stored FADT should agree with Revision 1.0 */
+	acpi_fadt_is_v1 = 1;
 
 	/*
 	 * Copy the table header and the common part of the tables.
@@ -242,7 +245,8 @@
 	 * the SMI_CMD register to assume processor performance state control
 	 * responsibility. There isn't any equivalence in 1.0, leave it zeroed.
 	 */
-	local_fadt->pstate_cnt = 0;
+	if (acpi_strict)
+		local_fadt->pstate_cnt = 0;
 
 	/*
 	 * Support for the _CST object and C States change notification.
diff -Naur orig/include/acpi/actbl.h linux-2.6.5/include/acpi/actbl.h
--- orig/include/acpi/actbl.h	2004-04-03 19:37:07.000000000 -0800
+++ linux-2.6.5/include/acpi/actbl.h	2005-10-27 17:38:51.000000000 -0700
@@ -343,5 +343,7 @@
 #include "actbl1.h"   /* Acpi 1.0 table definitions */
 #include "actbl2.h"   /* Acpi 2.0 table definitions */
 
+extern u8 acpi_fadt_is_v1; /* is set to 1 if FADT is revision 1,
+			    * needed for certain workarounds */
 
 #endif /* __ACTBL_H__ */
diff -Naur orig/include/acpi/processor.h linux-2.6.5/include/acpi/processor.h
--- orig/include/acpi/processor.h	2004-04-03 19:36:57.000000000 -0800
+++ linux-2.6.5/include/acpi/processor.h	2005-10-27 17:39:05.000000000 -0700
@@ -140,4 +140,8 @@
 	struct acpi_processor_performance * performance,
 	unsigned int cpu);
 
+/* note: this locks both the calling module and the processor module
+         if a _PPC object exists, rmmod is disallowed then */
+int acpi_processor_notify_smm(struct module *calling_module);
+
 #endif

--------------040008080105050709070608--

--------------enigFEC8D2C488CBF08E971C545F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFDZDFAa6vRYYgWQuURAsxYAJ4+pzPM+pXexEaaNTMtb3iLfyl4cACeN0rd
XcWcHj+qK2quP6qkOrBLVDY=
=nkIp
-----END PGP SIGNATURE-----

--------------enigFEC8D2C488CBF08E971C545F--


--===============1507262490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1507262490==--

