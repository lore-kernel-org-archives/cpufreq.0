From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-smi.c, 1.1.2.1,
	1.1.2.2
Date: Mon, 10 Nov 2003 10:44:03 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AJ9Wd-0002qW-Im@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
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
In directory flint:/tmp/cvs-serv10937/cpufreq/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	speedstep-smi.c 
Log Message:
implement module parameter 'smi_sig' as in 2.6.
cleanup from 2.6.


Index: speedstep-smi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c,v
retrieving revision 1.1.2.1
retrieving revision 1.1.2.2
diff -u -r1.1.2.1 -r1.1.2.2
--- speedstep-smi.c	4 Sep 2003 10:54:30 -0000	1.1.2.1
+++ speedstep-smi.c	10 Nov 2003 10:44:00 -0000	1.1.2.2
@@ -22,20 +22,19 @@
 
 #include "speedstep-lib.h"
 
+#define PFX "speedstep-smi: "
+
 /* speedstep system management interface port/command.
  *
  * These parameters are got from IST-SMI BIOS call.
  * If user gives it, these are used.
  * 
  */
-static int		signature	= 0;
 static int		smi_port	= 0;
 static int		smi_cmd		= 0;
+static unsigned int	smi_sig		= 0;
 
 
-#define SPEEDSTEP_HIGH	0x00000000
-#define SPEEDSTEP_LOW   0x00000001
-
 /* 
  *   There are only two frequency states for each processor. Values
  * are in kHz for the time being.
@@ -67,43 +66,45 @@
  */
 static int speedstep_smi_ownership (void)
 {
-        u32     command, result, magic;
-        u32     function = GET_SPEEDSTEP_OWNER;
+	u32 command, result, magic;
+	u32 function = GET_SPEEDSTEP_OWNER;
 	unsigned char magic_data[] = "Copyright (c) 1999 Intel Corporation";
 
-        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
+	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 	magic = virt_to_phys(magic_data);
 
-        __asm__ __volatile__(
-            "out %%al, (%%dx)\n"
-            : "=D" (result)
-            : "a" (command), "b" (function), "c" (0), "d" (smi_port), "D" (0), "S" (magic)
-        );
+	__asm__ __volatile__(
+		"out %%al, (%%dx)\n"
+		: "=D" (result)
+		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "D" (0), "S" (magic)
+	);
 
-        return result;
+	return result;
 }
+
 /**
  * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
  *
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
 {
-        u32     command, result, edi, high_mhz, low_mhz;
-        u32     state=0;
-        u32	function = GET_SPEEDSTEP_FREQS;
-
-        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
-
-        __asm__ __volatile__("movl $0, %%edi\n"
-            "out %%al, (%%dx)\n"
-            : "=a" (result), "=b" (high_mhz), "=c" (low_mhz), "=d" (state), "=D" (edi)
-            : "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
-        );
+	u32 command, result, edi, high_mhz, low_mhz;
+	u32 state=0;
+	u32 function = GET_SPEEDSTEP_FREQS;
+
+	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
+
+	__asm__ __volatile__("movl $0, %%edi\n"
+		"out %%al, (%%dx)\n"
+		: "=a" (result), "=b" (high_mhz), "=c" (low_mhz), "=d" (state), "=D" (edi)
+		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
+	);
 	*high = high_mhz * 1000;
 	*low  = low_mhz  * 1000;
 
 	return result;
 } 
+
 /**
  * speedstep_get_state - set the SpeedStep state
  * @state: processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
@@ -111,17 +112,17 @@
  */
 static int speedstep_get_state (void)
 {
-	u32		function=GET_SPEEDSTEP_STATE;
-	u32		result, state, edi, command;
+	u32 function=GET_SPEEDSTEP_STATE;
+	u32 result, state, edi, command;
+
+	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
-        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
+	__asm__ __volatile__("movl $0, %%edi\n"
+		"out %%al, (%%dx)\n"
+		: "=a" (result), "=b" (state), "=D" (edi)
+		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0)
+	);
 
-        __asm__ __volatile__("movl $0, %%edi\n"
-            "out %%al, (%%dx)\n"
-            : "=a" (result), "=b" (state), "=D" (edi)
-            : "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0)
-        );
-	
 	return state;
 }
 
@@ -132,10 +133,10 @@
  */
 static void speedstep_set_state (unsigned int state, unsigned int notify)
 {
-	unsigned int		old_state, result, command, new_state;
-	unsigned long		flags;
-	struct cpufreq_freqs	freqs;
-	unsigned int		function=SET_SPEEDSTEP_STATE;
+	unsigned int old_state, result, command, new_state;
+	unsigned long flags;
+	struct cpufreq_freqs freqs;
+	unsigned int function=SET_SPEEDSTEP_STATE;
 
 	if (state > 0x1)
 		return;
@@ -144,7 +145,7 @@
 	freqs.old = speedstep_freqs[old_state].frequency;
 	freqs.new = speedstep_freqs[state].frequency;
 	freqs.cpu = 0; /* speedstep.c is UP only driver */
-	
+
 	if (old_state == state)
 		return;
 
@@ -154,13 +155,13 @@
 	/* Disable IRQs */
 	local_irq_save(flags);
 
-        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
-        __asm__ __volatile__(
-	    "movl $0, %%edi\n"
-            "out %%al, (%%dx)\n"
-            : "=b" (new_state), "=D" (result)
-            : "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
-        );
+	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
+	__asm__ __volatile__(
+		"movl $0, %%edi\n"
+		"out %%al, (%%dx)\n"
+		: "=b" (new_state), "=D" (result)
+		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
+	);
 
 	/* enable IRQs */
 	local_irq_restore(flags);
@@ -187,10 +188,9 @@
  * Sets a new CPUFreq policy/freq.
  */
 static int speedstep_target (struct cpufreq_policy *policy,
-			     unsigned int target_freq,
-			     unsigned int relation)
+			unsigned int target_freq, unsigned int relation)
 {
-	unsigned int	newstate = 0;
+	unsigned int newstate = 0;
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
@@ -216,8 +216,8 @@
 
 static int speedstep_cpu_init(struct cpufreq_policy *policy)
 {
-	int		result;
-	unsigned int	speed,state;
+	int result;
+	unsigned int speed,state;
 
 	/* capability check */
 	if (policy->cpu != 0)
@@ -230,25 +230,25 @@
 
 	/* detect low and high frequency */
 	result = speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].frequency,
-				         &speedstep_freqs[SPEEDSTEP_HIGH].frequency);
+				&speedstep_freqs[SPEEDSTEP_HIGH].frequency);
 	if (result) {
 		/* fall back to speedstep_lib.c dection mechanism: try both states out */
 		unsigned int speedstep_processor = speedstep_detect_processor();
 
-		dprintk(KERN_INFO "speedstep-smi: could not detect low and high frequencies by SMI call.\n");
+		dprintk(KERN_INFO PFX "could not detect low and high frequencies by SMI call.\n");
 		if (!speedstep_processor)
 			return -ENODEV;
 
-		result = (int) speedstep_get_freqs(speedstep_processor,
-					     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
-					     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
-					     &speedstep_set_state);
+		result = speedstep_get_freqs(speedstep_processor,
+				&speedstep_freqs[SPEEDSTEP_LOW].frequency,
+				&speedstep_freqs[SPEEDSTEP_HIGH].frequency,
+				&speedstep_set_state);
 
 		if (result) {
-			dprintk(KERN_INFO "speedstep-smi: could not detect two different speeds -- aborting.\n");
+			dprintk(KERN_INFO PFX "could not detect two different speeds -- aborting.\n");
 			return result;
 		} else
-			dprintk(KERN_INFO "speedstep-smi: workaround worked.\n");
+			dprintk(KERN_INFO PFX "workaround worked.\n");
 	}
 
 	/* get current speed setting */
@@ -300,19 +300,27 @@
  */
 static int __init speedstep_init(void)
 {
-	/* Error if no IST-SMI BIOS or no PARM 
-		 sig= 'ISGE' aka 'Intel Speedstep Gate E' */
-	/* Don't understand: 0x47534943 is GSIC, meaning
-	 * Geyserville System Interface Control perhaps. */
+    struct cpuinfo_x86 *c = cpu_data;
+
+    if (c->x86_vendor != X86_VENDOR_INTEL) {
+		printk (KERN_INFO PFX "No Intel CPU detected.\n");
+		return -ENODEV;
+	}
 
-	dprintk(KERN_INFO "speedstep-smi: IST_SMI: signature:0x%.8lx, command:0x%.8lx, event:0x%.8lx, perf_level:0x%.8lx\n",
-		ist_info.signature, ist_info.command, ist_info.event,ist_info.perf_level);
+	dprintk(KERN_DEBUG PFX "signature:0x%.8lx, command:0x%.8lx, event:0x%.8lx, perf_level:0x%.8lx.\n", 
+		ist_info.signature, ist_info.command, ist_info.event, ist_info.perf_level);
 
+
+	/* Error if no IST-SMI BIOS or no PARM 
+		 sig= 'ISGE' aka 'Intel Speedstep Gate E' */
 	if ((ist_info.signature !=  0x47534943) && ( 
 	    (smi_port == 0) || (smi_cmd == 0)))
 		return -ENODEV;
 
-	signature = 0x47534943;
+	if (smi_sig == 1)
+		smi_sig = 0x47534943;
+	else
+		smi_sig = ist_info.signature;
 
 	/* setup smi_port from MODLULE_PARM or BIOS */
 	if ((smi_port > 0xff) || (smi_port < 0)) {
@@ -341,8 +349,13 @@
 	cpufreq_unregister_driver(&speedstep_driver);
 }
 
-MODULE_PARM (smi_port, "i");
-MODULE_PARM (smi_cmd, "i");
+module_param(smi_port,  int, 0444);
+module_param(smi_cmd,   int, 0444);
+module_param(smi_sig,  uint, 0444);
+
+MODULE_PARM_DESC(smi_port, "Override the BIOS-given IST port with this value -- Intel's default setting is 0xb2");
+MODULE_PARM_DESC(smi_cmd, "Override the BIOS-given IST command with this value -- Intel's default setting is 0x82");
+MODULE_PARM_DESC(smi_sig, "Set to 1 to fake the IST signature when using the SMI interface.");
 
 MODULE_AUTHOR ("Hiroshi Miura");
 MODULE_DESCRIPTION ("Speedstep driver for IST applet SMI interface.");
