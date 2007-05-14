From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH] Minor updates to powernow-k8
Date: Mon, 14 May 2007 16:21:37 -0500
Message-ID: <4648D2E1.5030802@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

I've submitted the following patches before, but they don't
seem to have made it into the tree yet.

Update the processor ID check to support newer RevF Turions
and indicate number of processors and cores more cleanly
in startup messages.

Signed-Off-By: Mark Langsdorf <mark.langsdorf@amd.com>
--- arch/i386/kernel/cpu/cpufreq/powernow-k8.c.old	2007-05-14 
16:15:34.000000000 -0500
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2007-05-14 
16:16:11.000000000 -0500
@@ -1330,8 +1330,8 @@ static int __cpuinit powernowk8_init(voi

  	if (supported_cpus == num_online_cpus()) {
  		printk(KERN_INFO PFX "Found %d %s "
-			"processors (" VERSION ")\n", supported_cpus,
-			boot_cpu_data.x86_model_id);
+			"processors (%d cpu cores) (" VERSION ")\n", 
supported_cpus/cpu_data[0].booted_cores,
+			boot_cpu_data.x86_model_id, supported_cpus);
  		return cpufreq_register_driver(&cpufreq_amd64_driver);
  	}

--- arch/i386/kernel/cpu/cpufreq/powernow-k8.h.old	2007-05-14 
16:15:44.000000000 -0500
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2007-05-14 
16:16:43.000000000 -0500
@@ -46,7 +46,7 @@ struct powernow_k8_data {
  #define CPUID_XFAM			0x0ff00000	/* extended family */
  #define CPUID_XFAM_K8			0
  #define CPUID_XMOD			0x000f0000	/* extended model */
-#define CPUID_XMOD_REV_G		0x00060000
+#define CPUID_XMOD_REV_G		0x00080000
  #define CPUID_XFAM_10H 			0x00100000	/* family 0x10 */
  #define CPUID_USE_XFAM_XMOD		0x00000f00
  #define CPUID_GET_MAX_CAPABILITIES	0x80000000
