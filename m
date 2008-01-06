From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH]add gcc printf format checking and fix wrong
	format in speedstep-smi.c
Date: Sun, 6 Jan 2008 21:18:05 +0100
Message-ID: <200801062118.05964.deller@gmx.de>
References: <200801061427.01811.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200801061427.01811.deller@gmx.de>
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
Cc: davej@codemonkey.org.uk

Updated patch below
==============

[PATCH] [CPUFREQ] add gcc printf format checking to cpufreq.h

ist_info.signature and the other variables in speedstep-smi.c are of type 
"unsigned int", not "unsigned long". Detected with the added printf
format check.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c b/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
index f2b5a62..f0dffe9 100644
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
@@ -368,7 +368,7 @@ static int __init speedstep_init(void)
 		return -ENODEV;
 	}
 
-	dprintk("signature:0x%.8lx, command:0x%.8lx, event:0x%.8lx, perf_level:0x%.8lx.\n",
+	dprintk("signature:0x%.8x, command:0x%.8x, event:0x%.8x, perf_level:0x%.8x.\n",
 		ist_info.signature, ist_info.command, ist_info.event, ist_info.perf_level);
 
 	/* Error if no IST-SMI BIOS or no PARM
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 23932d7..774add6 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -365,7 +365,7 @@ void cpufreq_frequency_table_put_attr(unsigned int cpu);
 #ifdef CONFIG_CPU_FREQ_DEBUG
 
 extern void cpufreq_debug_printk(unsigned int type, const char *prefix, 
-				 const char *fmt, ...);
+		const char *fmt, ...) __attribute__ ((format(printf,3,4)));
 
 #else
