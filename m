From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES 4/5] speedstep-smi: allow to load it in P4-Ms
	again
Date: Sat, 29 Jan 2005 20:43:35 +0100
Message-ID: <20050129194335.GD9382@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

The speedstep-smi driver actually works on >=1 notebook with a
Pentium 4-M CPU where all other cpufreq drivers fail. Therefore,
allow speedstep-smi on P4Ms again, but warn users of likely failure

Sigend-off-by: Dominik Brodowski <linux@brodo.de>
---

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    2 ++
 1 files changed, 2 insertions(+)

Index: 2.6.11-rc2+/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
===================================================================
--- 2.6.11-rc2+.orig/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-12-25 09:59:47.000000000 +0100
+++ 2.6.11-rc2+/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2005-01-29 20:32:26.000000000 +0100
@@ -357,6 +357,8 @@
 	case SPEEDSTEP_PROCESSOR_PIII_C:
 	case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
 		break;
+	case SPEEDSTEP_PROCESSOR_P4M:
+		printk(KERN_INFO "speedstep-smi: you're trying to use this cpufreq driver on a Pentium 4-based CPU. Most likely it will not work.\n");
 	default:
 		speedstep_processor = 0;
 	}
