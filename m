From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-smi.c,1.1,1.1.2.1
Date: Thu, 04 Sep 2003 11:54:33 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19url3-0002g7-9t@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv10284/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	speedstep-smi.c 
Log Message:
- added speedstep-smi
- fix signature if int15 do not work


Index: speedstep-smi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c,v
retrieving revision 1.1
retrieving revision 1.1.2.1
diff -u -r1.1 -r1.1.2.1
--- speedstep-smi.c	3 Sep 2003 09:20:00 -0000	1.1
+++ speedstep-smi.c	4 Sep 2003 10:54:30 -0000	1.1.2.1
@@ -28,6 +28,7 @@
  * If user gives it, these are used.
  * 
  */
+static int		signature	= 0;
 static int		smi_port	= 0;
 static int		smi_cmd		= 0;
 
@@ -70,7 +71,7 @@
         u32     function = GET_SPEEDSTEP_OWNER;
 	unsigned char magic_data[] = "Copyright (c) 1999 Intel Corporation";
 
-        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);
+        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
 	magic = virt_to_phys(magic_data);
 
         __asm__ __volatile__(
@@ -91,7 +92,7 @@
         u32     state=0;
         u32	function = GET_SPEEDSTEP_FREQS;
 
-        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);
+        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
 
         __asm__ __volatile__("movl $0, %%edi\n"
             "out %%al, (%%dx)\n"
@@ -113,7 +114,7 @@
 	u32		function=GET_SPEEDSTEP_STATE;
 	u32		result, state, edi, command;
 
-        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);
+        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
 
         __asm__ __volatile__("movl $0, %%edi\n"
             "out %%al, (%%dx)\n"
@@ -153,7 +154,7 @@
 	/* Disable IRQs */
 	local_irq_save(flags);
 
-        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);
+        command = (signature & 0xffffff00) | (smi_cmd & 0xff);
         __asm__ __volatile__(
 	    "movl $0, %%edi\n"
             "out %%al, (%%dx)\n"
@@ -268,7 +269,8 @@
 	return cpufreq_frequency_table_cpuinfo(policy, &speedstep_freqs[0]);
 }
 
-
+/* have to be fixed properly */
+#if 0
 static int speedstep_resume(struct cpufreq_policy *policy)
 {
 	int result = speedstep_smi_ownership();
@@ -278,6 +280,7 @@
 
 	return result;
 }
+#endif
 
 
 static struct cpufreq_driver speedstep_driver = {
@@ -285,8 +288,7 @@
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
-	.resume		= speedstep_resume,
-	.owner		= THIS_MODULE,
+	/* .resume		= speedstep_resume, */
 };
 
 /**
@@ -309,6 +311,8 @@
 	if ((ist_info.signature !=  0x47534943) && ( 
 	    (smi_port == 0) || (smi_cmd == 0)))
 		return -ENODEV;
+
+	signature = 0x47534943;
 
 	/* setup smi_port from MODLULE_PARM or BIOS */
 	if ((smi_port > 0xff) || (smi_port < 0)) {
