From: Len Brown <len.brown@intel.com>
Subject: try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled
Date: 08 Dec 2004 00:44:01 -0500
Message-ID: <1102484641.2193.12.camel@d845pe>
References: <e256efa404120516422cb37625@mail.gmail.com>
	<20041206162452.GA14746@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041206162452.GA14746@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: davej@codemonkey.org.uk, "cpufreq@www.linux.org.uk" <cpufreq@www.linux.org.uk>

Dave,
FYI, I just checked this trivial patch into the acpi tree.

-Len

diff -Nru a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-12-08
00:41:55 -05:00
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-12-08
00:41:55 -05:00
@@ -249,7 +249,7 @@
 		/* Matched a non-match */
 		printk(KERN_INFO PFX "no table support for CPU model \"%s\": \n",
 		       cpu->x86_model_id);
-#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+#ifndef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
 		printk(KERN_INFO PFX "try compiling with
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
 #endif
 		return -ENOENT;
