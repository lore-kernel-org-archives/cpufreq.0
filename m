From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: patch-06 [Re: [PATCHES] cpufreq_get(), cpufreq->get()]
Date: Mon, 12 Apr 2004 00:01:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040411220112.GE8160@dominikbrodowski.de>
References: <20040411215912.GA8160@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040411215912.GA8160@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Handle CPUFREQ_RESUMECHANGE notifications in i386, sparc64, x86_64, sh-sci
and sa11xx-pcmcia notifiers. sa1100-framebuffer doesn't seem to be able
to handle frequency transitions behind its back well. So, sa11xx will be marked
CPUFREQ_PANIC_OUTOFSYNC | CPUFREQ_PANIC_RESUME_OUTOFSYNC in patch 19. Russell,
do you think sa1100fb will be able to handle such an out of sync situation?

 arch/i386/kernel/timers/timer_tsc.c |    3 ++-
 arch/sparc64/kernel/time.c          |    3 ++-
 arch/x86_64/kernel/time.c           |    3 ++-
 drivers/char/sh-sci.c               |    3 ++-
 drivers/pcmcia/sa11xx_core.c        |    2 ++
 drivers/serial/sh-sci.c             |    3 ++-
 6 files changed, 12 insertions(+), 5 deletions(-)


diff -ruN linux-original/arch/i386/kernel/timers/timer_tsc.c linux/arch/i386/kernel/timers/timer_tsc.c
--- linux-original/arch/i386/kernel/timers/timer_tsc.c	2004-04-04 14:13:49.000000000 +0200
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2004-04-11 13:28:50.560219864 +0200
@@ -356,7 +356,8 @@
 	}
 
 	if ((val == CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
-	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new)) {
+	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new) ||
+	    (val == CPUFREQ_RESUMECHANGE)) {
 		if (variable_tsc)
 			cpu_data[freq->cpu].loops_per_jiffy = cpufreq_scale(loops_per_jiffy_ref, ref_freq, freq->new);
 #ifndef CONFIG_SMP
diff -ruN linux-original/arch/sparc64/kernel/time.c linux/arch/sparc64/kernel/time.c
--- linux-original/arch/sparc64/kernel/time.c	2004-03-12 22:26:56.000000000 +0100
+++ linux/arch/sparc64/kernel/time.c	2004-04-11 13:29:27.000000000 +0200
@@ -1035,7 +1035,8 @@
 		ft->clock_tick_ref = cpu_data(cpu).clock_tick;
 	}
 	if ((val == CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
-	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new)) {
+	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new) ||
+	    (val == CPUFREQ_RESUMECHANGE)) {
 		cpu_data(cpu).udelay_val =
 			cpufreq_scale(ft->udelay_val_ref,
 				      ft->ref_freq,
diff -ruN linux-original/arch/x86_64/kernel/time.c linux/arch/x86_64/kernel/time.c
--- linux-original/arch/x86_64/kernel/time.c	2004-03-12 22:26:57.000000000 +0100
+++ linux/arch/x86_64/kernel/time.c	2004-04-11 13:30:00.000000000 +0200
@@ -531,7 +531,8 @@
 		cpu_khz_ref = cpu_khz;
 	}
         if ((val == CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
-            (val == CPUFREQ_POSTCHANGE && freq->old > freq->new)) {
+            (val == CPUFREQ_POSTCHANGE && freq->old > freq->new) ||
+	    (val == CPUFREQ_RESUMECHANGE)) {
                 *lpj =
 		cpufreq_scale(loops_per_jiffy_ref, ref_freq, freq->new);
 
diff -ruN linux-original/drivers/char/sh-sci.c linux/drivers/char/sh-sci.c
--- linux-original/drivers/char/sh-sci.c	2004-03-12 22:26:59.000000000 +0100
+++ linux/drivers/char/sh-sci.c	2004-04-11 13:30:57.000000000 +0200
@@ -1239,7 +1239,8 @@
 	struct cpufreq_freqs *freqs = p;
 	int i;
 
-	if (phase == CPUFREQ_POSTCHANGE) {
+	if ((phase == CPUFREQ_POSTCHANGE) ||
+	    (phase == CPUFREQ_RESUMECHANGE)) {
 		for (i = 0; i < SCI_NPORTS; i++) {
 			/*
 			 * This will force a baud rate change in hardware.
diff -ruN linux-original/drivers/pcmcia/sa11xx_core.c linux/drivers/pcmcia/sa11xx_core.c
--- linux-original/drivers/pcmcia/sa11xx_core.c	2004-04-04 14:13:52.000000000 +0200
+++ linux/drivers/pcmcia/sa11xx_core.c	2004-04-11 13:32:27.000000000 +0200
@@ -933,6 +933,8 @@
 		if (freqs->new < freqs->old)
 			sa1100_pcmcia_update_mecr(freqs->new);
 		break;
+	case CPUFREQ_RESUMECHANGE:
+		sa1100_pcmcia_update_mecr(freqs->new);
 	}
 
 	return 0;
diff -ruN linux-original/drivers/serial/sh-sci.c linux/drivers/serial/sh-sci.c
--- linux-original/drivers/serial/sh-sci.c	2004-04-04 14:13:54.000000000 +0200
+++ linux/drivers/serial/sh-sci.c	2004-04-11 13:33:19.000000000 +0200
@@ -748,7 +748,8 @@
 	struct cpufreq_freqs *freqs = p;
 	int i;
 
-	if (phase == CPUFREQ_POSTCHANGE) {
+	if ((phase == CPUFREQ_POSTCHANGE) ||
+	    (phase == CPUFREQ_RESUMECHANGE)){
 		for (i = 0; i < SCI_NPORTS; i++) {
 			struct uart_port *port = &sci_ports[i];
