From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-smi.c, 1.1.2.2,
	1.1.2.3
Date: Mon, 10 Nov 2003 11:22:47 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E1AJA87-0003Ea-2A@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv12418/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	speedstep-smi.c 
Log Message:
There is no module_parm in 2.4.


Index: speedstep-smi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c,v
retrieving revision 1.1.2.2
retrieving revision 1.1.2.3
diff -u -r1.1.2.2 -r1.1.2.3
--- speedstep-smi.c	10 Nov 2003 10:44:00 -0000	1.1.2.2
+++ speedstep-smi.c	10 Nov 2003 11:22:44 -0000	1.1.2.3
@@ -349,9 +349,9 @@
 	cpufreq_unregister_driver(&speedstep_driver);
 }
 
-module_param(smi_port,  int, 0444);
-module_param(smi_cmd,   int, 0444);
-module_param(smi_sig,  uint, 0444);
+MODULE_PARM(smi_port, "i");
+MODULE_PARM(smi_cmd, "i");
+MODULE_PARM(smi_sig, "i");
 
 MODULE_PARM_DESC(smi_port, "Override the BIOS-given IST port with this value -- Intel's default setting is 0xb2");
 MODULE_PARM_DESC(smi_cmd, "Override the BIOS-given IST command with this value -- Intel's default setting is 0x82");
