From: Andras Gefferth <Andras.Gefferth@soha.tmit.bme.hu>
Subject: PATCH: cpu-freq user-guide.txt
Date: Tue, 10 Jan 2006 12:43:31 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0601101230190.7990@soha.tmit.bme.hu>
References: <20060109025751.5942fe83.Andras.Gefferth@soha.tmit.bme.hu>
	<20060109200628.GA12100@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060109200628.GA12100@isilmar.linta.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

Dear Dominik,

I rewrote my previous version according to your comments, and also made 
some restructureing, all the new stuff is now at the beginning.

Short description of the patch:

Added a few words to the cpu-freq user-guide.txt so that the user can see 
what is needed to enable the feature.
Patch applies to kernels: 2.6.XX

Signed-off-by: Andras Gefferth <g_a at freemail dot hu>

This is the patch:
--- linux/Documentation/cpu-freq/user-guide.txt.orig    2006-01-10 
12:27:42.000000000 +0100
+++ linux/Documentation/cpu-freq/user-guide.txt 2006-01-10 
12:28:15.000000000 +0100
@@ -17,6 +17,11 @@

  Contents:
  ---------
+0. Prerequisites
+0.1 Processor
+0.2 Bios
+0.3 Kernel
+
  1. Supported Architectures and Processors
  1.1 ARM
  1.2 x86
@@ -32,6 +37,31 @@ Contents:
  3.1 Preferred interface: sysfs
  3.2 Deprecated interfaces

+0. Prerequisites
+================
+
+0.1 Processor
+-------------
+
+Check whether your processor supports scaling!
+See: "1. Supported Architectures and Processors"
+
+0.2 BIOS
+--------
+
+Check whether scaling is enabled in the BIOS!
+It might have various names, like "SpeedStep", or "PowerNow", etc.
+
+0.3 Kernel
+----------
+
+Scaling has to be enabled in the kernel.
+Look at "Power management options"/"CPU Frequency scaling"!
+Here you have to select the governor(s) you need (see section 2.2 
Governor),
+and the type of processor you have.
+If compiled as modules the governors can be found in
+/lib/modules/$(uname -r)/kernel/drivers/cpufreq/, and the processor 
drivers in
+/lib/modules/$(uname -r)/kernel/arch/i386/kernel/cpu/cpufreq/


  1. Supported Architectures and Processors
