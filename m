From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 1/8] speedstep-smi: disable smi_detect_freqs() on buggy
	systems (bug #1422)
Date: Wed, 19 Nov 2003 19:30:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119183028.GB20576@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

The SMI call in speedstep_smi_get_freqs causes hangs on certain notebooks. A
failure of the function itself is non-critical, as a workaround exists.

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    6 ++++++
 1 files changed, 6 insertions(+)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 17:14:02.417137416 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 17:14:36.128012584 +0100
@@ -85,6 +85,9 @@
 
 /**
  * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
+ * Only available on later SpeedStep-enabled systems, returns false results or
+ * even hangs [cf. bugme.osdl.org # 1422] on earlier systems. Empirical testing
+ * shows that the latter occurs if !(ist_info.event & 0xFFFF).
  *
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
@@ -93,6 +96,9 @@
 	u32 state=0;
 	u32 function = GET_SPEEDSTEP_FREQS;
 
+	if (!(ist_info.event & 0xFFFF))
+		return -ENODEV;
+
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
 	__asm__ __volatile__("movl $0, %%edi\n"
