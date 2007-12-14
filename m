From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH] Powernow-k8: Update to support the latest Turion
 processors
Date: Fri, 14 Dec 2007 13:00:23 -0600
Message-ID: <200712141300.23975.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk
Cc: Joachim Deguara <joachim.deguara@amd.com>, lkml@vger.kernel.org, bhavana.nagendra@amd.com

The latest series of Turion X2 processors have a new XFAM
model.  Add support for them to powernow-k8.h.

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

--- linux-2.6.23-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.h.old	2007-12-14 12:15:06.000000000 -0600
+++ linux-2.6.23-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.h	2007-12-14 12:15:27.000000000 -0600
@@ -47,7 +47,7 @@ struct powernow_k8_data {
 #define CPUID_XFAM			0x0ff00000	/* extended family */
 #define CPUID_XFAM_K8			0
 #define CPUID_XMOD			0x000f0000	/* extended model */
-#define CPUID_XMOD_REV_MASK		0x00080000
+#define CPUID_XMOD_REV_MASK		0x000c0000
 #define CPUID_XFAM_10H			0x00100000	/* family 0x10 */
 #define CPUID_USE_XFAM_XMOD		0x00000f00
 #define CPUID_GET_MAX_CAPABILITIES	0x80000000
