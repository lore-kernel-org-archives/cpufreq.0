From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq Kconfig,1.6,1.7 Makefile,1.11,1.12 acpi.c,1.6,1.7 speedstep-piix4.c,1.6,1.7
Date: Fri, 11 Jul 2003 16:51:10 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19b0Aw-0008UM-10@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv32624

Modified Files:
	Kconfig Makefile acpi.c speedstep-piix4.c 
Log Message:
It's time for me to buy a brown bag.


Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Kconfig,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -r1.6 -r1.7
--- Kconfig	27 Jun 2003 10:22:03 -0000	1.6
+++ Kconfig	11 Jul 2003 15:51:06 -0000	1.7
@@ -42,6 +42,11 @@
 
 	  If in doubt, say N.
 
+config X86_ACPI_LIB
+       tristate
+       depends on X86_ACPI_CPUFREQ
+       default X86_ACPI_CPUFREQ
+
 config X86_ACPI_CPUFREQ_PROC_INTF
         bool "/proc/acpi/processor/../performance interface (deprecated)"
 	depends on X86_ACPI_CPUFREQ && PROC_FS

Index: Makefile
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Makefile,v
retrieving revision 1.11
retrieving revision 1.12
diff -u -r1.11 -r1.12
--- Makefile	17 Jun 2003 13:32:34 -0000	1.11
+++ Makefile	11 Jul 2003 15:51:06 -0000	1.12
@@ -6,6 +6,7 @@
 obj-$(CONFIG_X86_LONGRUN)	+= longrun.o  
 obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o
 obj-$(CONFIG_X86_ACPI_CPUFREQ)	+= acpi.o
+obj-$(CONFIG_X86_ACPI_LIB)	+= acpi-lib.o
 obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+= speedstep-piix4.o
 obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+= speedstep-ich.o
 obj-$(CONFIG_X86_SPEEDSTEP_LIB) += speedstep-lib.o

Index: acpi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/acpi.c,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -r1.6 -r1.7
--- acpi.c	16 Jun 2003 20:39:11 -0000	1.6
+++ acpi.c	11 Jul 2003 15:51:06 -0000	1.7
@@ -37,7 +37,8 @@
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 
-#define ACPI_PROCESSOR_COMPONENT	0x01000000
+#include "acpi-lib.h"
+
 #define ACPI_PROCESSOR_CLASS		"processor"
 #define ACPI_PROCESSOR_DRIVER_NAME	"ACPI Processor P-States Driver"
 #define ACPI_PROCESSOR_DEVICE_NAME	"Processor"
@@ -53,177 +54,6 @@
 
 static struct acpi_processor_performance	*performance;
 
-
-static int 
-acpi_processor_get_performance_control (
-	struct acpi_processor_performance *perf)
-{
-	int			result = 0;
-	acpi_status		status = 0;
-	struct acpi_buffer	buffer = {ACPI_ALLOCATE_BUFFER, NULL};
-	union acpi_object	*pct = NULL;
-	union acpi_object	obj = {0};
-	struct acpi_pct_register *reg = NULL;
-
-	ACPI_FUNCTION_TRACE("acpi_processor_get_performance_control");
-
-	status = acpi_evaluate_object(perf->pr->handle, "_PCT", NULL, &buffer);
-	if(ACPI_FAILURE(status)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Error evaluating _PCT\n"));
-		return_VALUE(-ENODEV);
-	}
-
-	pct = (union acpi_object *) buffer.pointer;
-	if (!pct || (pct->type != ACPI_TYPE_PACKAGE) 
-		|| (pct->package.count != 2)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Invalid _PCT data\n"));
-		result = -EFAULT;
-		goto end;
-	}
-
-	/*
-	 * control_register
-	 */
-
-	obj = pct->package.elements[0];
-
-	if ((obj.type != ACPI_TYPE_BUFFER) 
-		|| (obj.buffer.length < sizeof(struct acpi_pct_register)) 
-		|| (obj.buffer.pointer == NULL)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, 
-			"Invalid _PCT data (control_register)\n"));
-		result = -EFAULT;
-		goto end;
-	}
-
-	reg = (struct acpi_pct_register *) (obj.buffer.pointer);
-
-	if (reg->space_id != ACPI_ADR_SPACE_SYSTEM_IO) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-			"Unsupported address space [%d] (control_register)\n",
-			(u32) reg->space_id));
-		result = -EFAULT;
-		goto end;
-	}
-
-	perf->control_register = (u16) reg->address;
-
-	/*
-	 * status_register
-	 */
-
-	obj = pct->package.elements[1];
-
-	if ((obj.type != ACPI_TYPE_BUFFER) 
-		|| (obj.buffer.length < sizeof(struct acpi_pct_register)) 
-		|| (obj.buffer.pointer == NULL)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, 
-			"Invalid _PCT data (status_register)\n"));
-		result = -EFAULT;
-		goto end;
-	}
-
-	reg = (struct acpi_pct_register *) (obj.buffer.pointer);
-
-	if (reg->space_id != ACPI_ADR_SPACE_SYSTEM_IO) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-			"Unsupported address space [%d] (status_register)\n",
-			(u32) reg->space_id));
-		result = -EFAULT;
-		goto end;
-	}
-
-	perf->status_register = (u16) reg->address;
-
-	ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
-		"control_register[0x%04x] status_register[0x%04x]\n",
-		perf->control_register,
-		perf->status_register));
-
-end:
-	acpi_os_free(buffer.pointer);
-
-	return_VALUE(result);
-}
-
-
-static int 
-acpi_processor_get_performance_states (
-	struct acpi_processor_performance *	perf)
-{
-	int			result = 0;
-	acpi_status		status = AE_OK;
-	struct acpi_buffer	buffer = {ACPI_ALLOCATE_BUFFER, NULL};
-	struct acpi_buffer	format = {sizeof("NNNNNN"), "NNNNNN"};
-	struct acpi_buffer	state = {0, NULL};
-	union acpi_object 	*pss = NULL;
-	int			i = 0;
-
-	ACPI_FUNCTION_TRACE("acpi_processor_get_performance_states");
-
-	status = acpi_evaluate_object(perf->pr->handle, "_PSS", NULL, &buffer);
-	if(ACPI_FAILURE(status)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Error evaluating _PSS\n"));
-		return_VALUE(-ENODEV);
-	}
-
-	pss = (union acpi_object *) buffer.pointer;
-	if (!pss || (pss->type != ACPI_TYPE_PACKAGE)) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Invalid _PSS data\n"));
-		result = -EFAULT;
-		goto end;
-	}
-
-	ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Found %d performance states\n", 
-		pss->package.count));
-
-	if (pss->package.count > ACPI_PROCESSOR_MAX_PERFORMANCE) {
-		perf->state_count = ACPI_PROCESSOR_MAX_PERFORMANCE;
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
-			"Limiting number of states to max (%d)\n", 
-			ACPI_PROCESSOR_MAX_PERFORMANCE));
-	}
-	else
-		perf->state_count = pss->package.count;
-
-	if (perf->state_count > 1)
-		perf->pr->flags.performance = 1;
-
-	for (i = 0; i < perf->state_count; i++) {
-
-		struct acpi_processor_px *px = &(perf->states[i]);
-
-		state.length = sizeof(struct acpi_processor_px);
-		state.pointer = px;
-
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Extracting state %d\n", i));
-
-		status = acpi_extract_package(&(pss->package.elements[i]), 
-			&format, &state);
-		if (ACPI_FAILURE(status)) {
-			ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Invalid _PSS data\n"));
-			result = -EFAULT;
-			goto end;
-		}
-
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
-			"State [%d]: core_frequency[%d] power[%d] transition_latency[%d] bus_master_latency[%d] control[0x%x] status[0x%x]\n",
-			i, 
-			(u32) px->core_frequency, 
-			(u32) px->power, 
-			(u32) px->transition_latency, 
-			(u32) px->bus_master_latency,
-			(u32) px->control, 
-			(u32) px->status));
-	}
-
-end:
-	acpi_os_free(buffer.pointer);
-
-	return_VALUE(result);
-}
-
-
 static int
 acpi_processor_set_performance (
 	struct acpi_processor_performance	*perf,
@@ -385,7 +215,8 @@
         loff_t			*data)
 {
 	int			result = 0;
-	struct acpi_processor	*pr = (struct acpi_processor *) data;
+	struct seq_file		*m = (struct seq_file *) file->private_data;
+	struct acpi_processor	*pr = (struct acpi_processor *) m->private;
 	char			state_string[12] = {'\0'};
 	unsigned int            new_state = 0;
 	struct cpufreq_policy   policy;
@@ -484,7 +315,8 @@
 	if (result)
 		return_VALUE(result);
 
-	result = acpi_processor_set_performance (perf, next_state);
+	result = acpi_processor_set_performance (perf,
+						 next_state + perf->pr->limit.state.px);
 
 	return_VALUE(result);
 }

Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -r1.6 -r1.7
--- speedstep-piix4.c	11 Jul 2003 13:11:15 -0000	1.6
+++ speedstep-piix4.c	11 Jul 2003 15:51:06 -0000	1.7
@@ -124,8 +124,9 @@
 	value = inb_p(pmbase + gpo_hilo_port);
 
 	/* compute new state */
-	value &= ~(1 << gpo_hilo_shift);
-	value |= state << gpo_hilo_shift;
+	value = state ? (value | (1 << gpo_hilo_shift)) : \
+		        (value & ~(1 << gpo_hilo_shift));
+
 
 	/* disable bus master arbitration */
 	pm2_blk = inb(0x22);
