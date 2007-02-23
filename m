From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH] Handle RevF processors with large cpufreq numbers
Date: Fri, 23 Feb 2007 13:27:26 -0600
Message-ID: <1449F58C868D8D4E9C72945771150BDFD9665D@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

The PowerNow! driver is not working on some RevF parts
because the CPUID limit is too low.  This patch sets
it to the correct value to handle newer RevF processors.

This was originally detected and corrected by
Hannes Mayer [kontakt@ecarux.de].

Signed-Off-by: Mark Langsdorf <mark.langsdorf@amd.com>


--- arch/i386/kernel/cpu/cpufreq/powernow-k8.h.orig	2007-02-20
23:26:45.832577558 +0100
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2007-02-20
23:26:28.805175194 +0100
@@ -46,7 +46,7 @@
 #define CPUID_XFAM			0x0ff00000	/* extended
family */
 #define CPUID_XFAM_K8			0
 #define CPUID_XMOD			0x000f0000	/* extended
model */
-#define CPUID_XMOD_REV_G		0x00060000
+#define CPUID_XMOD_REV_G		0x00080000
 #define CPUID_XFAM_10H 			0x00100000	/*
family 0x10 */
 #define CPUID_USE_XFAM_XMOD		0x00000f00
 #define CPUID_GET_MAX_CAPABILITIES	0x80000000
