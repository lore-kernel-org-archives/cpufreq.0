From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-piix4.c,1.10,1.11
Date: Tue, 20 Jan 2004 16:29:18 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1Aiykg-0007UR-Ki@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv28766/linux/arch/i386/kernel/cpufreq

Modified Files:
	speedstep-piix4.c 
Log Message:
At last, if people want that speedstep-piix4 to be kept, it should compile.


Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.10
retrieving revision 1.11
diff -u -r1.10 -r1.11
--- speedstep-piix4.c	3 Sep 2003 07:42:31 -0000	1.10
+++ speedstep-piix4.c	20 Jan 2004 16:29:15 -0000	1.11
@@ -84,6 +84,8 @@
 	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
 	freqs.new = speedstep_freqs[state].frequency;
 	freqs.cpu = 0; /* speedstep.c is UP only driver */
+
+	dprintk(KERN_DEBUG "cpufreq: before %d MHz\n", speedstep_get_processor_frequency(speedstep_processor));
 	
 	if (notify)
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -168,6 +170,8 @@
 
 	local_irq_restore(flags);
 
+	dprintk(KERN_DEBUG "cpufreq: after %d MHz\n", speedstep_get_processor_frequency(speedstep_processor));
+
 	if (speedstep_get_processor_frequency(speedstep_processor) != freqs.old) {
 		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
 	} else {
@@ -270,9 +274,7 @@
 		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? "low" : "high",
 		(speed / 1000));
 
-	/* cpuinfo and default policy values */
-	policy->policy = (speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? 
-		CPUFREQ_POLICY_POWERSAVE : CPUFREQ_POLICY_PERFORMANCE;
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
