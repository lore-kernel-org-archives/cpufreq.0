From: David Moore <dcm@acm.org>
Subject: [PATCH] Enhanced Speedstep using ACPI in 2.5.73
Date: 24 Jun 2003 15:18:07 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056493087.3983.40.camel@aldebaran.caltech.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq list <cpufreq@www.linux.org.uk>

Here is my patch to drive Enhanced Speedstep using tables from ACPI
instead of hard-coded.  As discussed previously, this may not be the
best solution since it expands the scope of acpi.c to more than just
legacy ACPI.  However, I am posting it for reference anyway.

A similar patch could be applied to drivers/acpi/processor.c in 2.4.x,
but it's probably not a good idea since any calls to wrmsr() and rdmsr()
ought to stay inside arch/i386.

-David

--- linux-2.5.73/arch/i386/kernel/cpu/cpufreq/acpi.c.orig	2003-06-23 21:11:19.000000000 -0700
+++ linux-2.5.73/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-06-23 23:13:04.000000000 -0700
@@ -43,6 +43,9 @@
 #define ACPI_PROCESSOR_DEVICE_NAME	"Processor"
 #define ACPI_PROCESSOR_FILE_PERFORMANCE	"performance"
 
+#define ACPI_PDC_REVISION_ID		0x1
+#define ACPI_PDC_CAPABILITY_ENH_SS	0x1
+
 #define _COMPONENT		ACPI_PROCESSOR_COMPONENT
 ACPI_MODULE_NAME		("acpi_processor_perf")
 
@@ -60,13 +63,33 @@
 {
 	int			result = 0;
 	acpi_status		status = 0;
+	union acpi_object	arg0 = {ACPI_TYPE_BUFFER};
+	u32			arg0_buf[3];
+	struct acpi_object_list	arg_list = {1, &arg0};
 	struct acpi_buffer	buffer = {ACPI_ALLOCATE_BUFFER, NULL};
 	union acpi_object	*pct = NULL;
 	union acpi_object	obj = {0};
 	struct acpi_pct_register *reg = NULL;
+	struct cpuinfo_x86 	*cpu = cpu_data;
 
 	ACPI_FUNCTION_TRACE("acpi_processor_get_performance_control");
 
+	/* First call _PDC, if available, to indicate to ACPI that this
+	 * driver supports Enhanced Speedstep.
+	 * Documentation for the _PDC method is at:
+	 * http://www.microsoft.com/whdc/hwdev/tech/onnow/procperfctrl.mspx */
+	arg0.buffer.length = 12;
+	arg0.buffer.pointer = (u8 *) arg0_buf;
+	arg0_buf[0] = ACPI_PDC_REVISION_ID;
+	arg0_buf[1] = 1;
+	arg0_buf[2] = ACPI_PDC_CAPABILITY_ENH_SS;
+
+	status = acpi_evaluate_object(perf->pr->handle,
+		"_PDC", &arg_list, NULL);
+	if(ACPI_FAILURE(status)) {
+		ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Error evaluating _PDC, using legacy perf. control...\n"));
+	}
+
 	status = acpi_evaluate_object(perf->pr->handle, "_PCT", NULL, &buffer);
 	if(ACPI_FAILURE(status)) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Error evaluating _PCT\n"));
@@ -98,7 +121,14 @@
 
 	reg = (struct acpi_pct_register *) (obj.buffer.pointer);
 
-	if (reg->space_id != ACPI_ADR_SPACE_SYSTEM_IO) {
+	if (reg->space_id == ACPI_ADR_SPACE_FIXED_HARDWARE &&
+		cpu_has(cpu, X86_FEATURE_EST)) {
+		perf->control_type = ACPI_PROCESSOR_TYPE_ENH_SS;
+	}
+	else if (reg->space_id == ACPI_ADR_SPACE_SYSTEM_IO) {
+		perf->control_type = ACPI_PROCESSOR_TYPE_LEGACY;
+	}
+	else {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 			"Unsupported address space [%d] (control_register)\n",
 			(u32) reg->space_id));
@@ -125,7 +155,9 @@
 
 	reg = (struct acpi_pct_register *) (obj.buffer.pointer);
 
-	if (reg->space_id != ACPI_ADR_SPACE_SYSTEM_IO) {
+	if (!((reg->space_id == ACPI_ADR_SPACE_SYSTEM_IO) ||
+		((reg->space_id == ACPI_ADR_SPACE_FIXED_HARDWARE) &&
+		 cpu_has(cpu, X86_FEATURE_EST)))) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 			"Unsupported address space [%d] (status_register)\n",
 			(u32) reg->space_id));
@@ -230,7 +262,7 @@
 	int			state)
 {
 	u16			port = 0;
-	u8			value = 0;
+	u16			value = 0;
 	int			i = 0;
 	struct cpufreq_freqs    cpufreq_freqs;
 
@@ -281,9 +313,12 @@
 	value = (u16) perf->states[state].control;
 
 	ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
-		"Writing 0x%02x to port 0x%04x\n", value, port));
+		"Writing 0x%04x to register 0x%04x\n", value, port));
 
-	outb(value, port); 
+	if (perf->control_type == ACPI_PROCESSOR_TYPE_ENH_SS)
+		wrmsr(port, (u32) value, 0); 
+	else
+		outb(value, port); 
 
 	/*
 	 * Then we read the 'status_register' and compare the value with the
@@ -295,12 +330,19 @@
 	port = perf->status_register;
 
 	ACPI_DEBUG_PRINT((ACPI_DB_INFO, 
-		"Looking for 0x%02x from port 0x%04x\n",
+		"Looking for 0x%04x from register 0x%04x\n",
 		(u8) perf->states[state].status, port));
 
 	for (i=0; i<100; i++) {
-		value = inb(port);
-		if (value == (u8) perf->states[state].status)
+		u32 l, h;
+		if (perf->control_type == ACPI_PROCESSOR_TYPE_ENH_SS) {
+			rdmsr(port, l, h);
+			value = (u16)(l & 0xffff);
+		}
+		else {
+			value = (u16) inb(port);
+		}
+		if (value == perf->states[state].status)
 			break;
 		udelay(10);
 	}
--- linux-2.5.73/include/acpi/processor.h.orig	2003-06-23 22:10:34.000000000 -0700
+++ linux-2.5.73/include/acpi/processor.h	2003-06-23 22:12:46.000000000 -0700
@@ -15,6 +15,9 @@
 #define ACPI_PROCESSOR_MAX_THROTTLE	250	/* 25% */
 #define ACPI_PROCESSOR_MAX_DUTY_WIDTH	4
 
+#define ACPI_PROCESSOR_TYPE_LEGACY	0
+#define ACPI_PROCESSOR_TYPE_ENH_SS	1
+
 /* Power Management */
 
 struct acpi_processor_cx_policy {
@@ -70,6 +73,7 @@
 struct acpi_processor_performance {
 	int			state;
 	int			platform_limit;
+	u8			control_type;
 	u16			control_register;
 	u16			status_register;
 	int			state_count;
