From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: new p4-clockmod capable CPUs
Date: Fri, 6 Oct 2006 20:27:09 -0400
Message-ID: <20061007002709.GA7839@dominikbrodowski.de>
References: <EB12A50964762B4D8111D55B764A8454ABC718@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454ABC718@scsmsx413.amr.corp.intel.com>
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
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Tue, Oct 03, 2006 at 11:44:58AM -0700, Pallipadi, Venkatesh wrote:
> >Hi,
> >
> >On Mon, Oct 02, 2006 at 04:23:17PM -0700, Pallipadi, Venkatesh wrote:
> >> >- Is the method in pentiumM_get_frequency() for these CPUs?
> >> May not work and will need change. The bus speed will not be 
> >100 on all
> >> these CPUs..
> >
> >What's the register to look at, and the values? Can't find anything in
> >245472-012, unfortunately, which would help me for this...
> >
> 
> MSR_FSB_FREQ - Latest SDM vol 3b (253669-020) has the information under
> Core/Core2 MSRs (Ap B2).

Ah. Thanks. Now only the new Celerons and Xeons confuse me -- they're
family 6, model 14, stepping 8. Is Ap B1 still valid, as they're called
Xeons (and Celerons)?

I am confused by all these marketing names being re-used and re-used and
re-used and re-used.... sorry ;)

Thanks,
	Dominik


PS: This is what I have so far:


From: Dominik Brodowski <linux@dominikbrodowski.net>

Several more Intel CPUs are now capable using the p4-clockmod cpufreq
driver. As it is of limited use most of the time, print a big bold warning
if a better cpufreq driver might be available.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c b/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
index 304d2ea..4c097ce 100644
--- a/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
+++ b/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
@@ -163,29 +163,29 @@ static int cpufreq_p4_verify(struct cpuf
 
 static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
 {
-	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
-		/* Pentium M (Banias) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
-		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
-	}
-
-	if ((c->x86 == 0x06) && (c->x86_model == 0x0D)) {
-		/* Pentium M (Dothan) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
-		/* on P-4s, the TSC runs with constant frequency independent whether
-		 * throttling is active or not. */
-		p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
-		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+	if (c->x86 == 0x06) {
+		if (cpu_has(c, X86_FEATURE_EST))
+			printk(KERN_WARNING PFX "Warning: EST-capable CPU detected. "
+			       "The acpi-cpufreq module offers voltage scaling"
+			       " in addition of frequency scaling. You should use "
+			       "that instead of p4-clockmod, if possible.\n");
+		switch (c->x86_model) {
+		case 0x0E: /* Celeron, Xeon */
+			printk(KERN_WARNING PFX "Not loading p4-clockmod therefore.\n");
+			return 0; /* unknown */
+		case 0x0F: /* Core Duo */
+			p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
+			return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PCORE);
+		case 0x0D: /* Pentium M (Dothan) */
+			p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
+			/* fall through */
+		case 0x09: /* Pentium M (Banias) */
+			return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+		}
 	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <cpufreq@lists.linux.org.uk>\n");
 		return 0;
 	}
 
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
index 4f46cac..6623a56 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
@@ -123,6 +123,36 @@ static unsigned int pentiumM_get_frequen
 	return (msr_tmp * 100 * 1000);
 }
 
+static unsigned int pentium_core_get_frequency(void)
+{
+	u32 fsb = 0;
+	u32 msr_lo, msr_tmp;
+
+	rdmsr(MSR_FSB_FREQ, msr_lo, msr_tmp);
+	/* see table B-2 of 24547212.pdf */
+	switch (msr_lo & 0x07) {
+	case 5:
+		fsb = 400;
+		break;
+	case 1:
+		fsb = 533;
+		break;
+	case 3:
+		fsb = 667;
+		break;
+	default:
+		printk(KERN_ERR "PCORE - MSR_FSB_FREQ undefined value");
+	}
+
+	rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_tmp);
+	dprintk("PCORE - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
+
+	msr_tmp = (msr_lo >> 22) & 0x1f;
+	dprintk("bits 22-26 are 0x%x, speed is %u\n", msr_tmp, (msr_tmp * fsb * 1000));
+
+	return (msr_tmp * fsb * 1000);
+}
+
 
 static unsigned int pentium4_get_frequency(void)
 {
@@ -174,6 +204,8 @@ static unsigned int pentium4_get_frequen
 unsigned int speedstep_get_processor_frequency(unsigned int processor)
 {
 	switch (processor) {
+	case SPEEDSTEP_PROCESSOR_PCORE:
+		return pentium_core_get_frequency();
 	case SPEEDSTEP_PROCESSOR_PM:
 		return pentiumM_get_frequency();
 	case SPEEDSTEP_PROCESSOR_P4D:
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
index b735429..b11bcc6 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
@@ -22,6 +22,7 @@ #define SPEEDSTEP_PROCESSOR_P4M			0x0000
  * the speedstep_get_processor_frequency() call. */
 #define SPEEDSTEP_PROCESSOR_PM			0xFFFFFF03  /* Pentium M  */
 #define SPEEDSTEP_PROCESSOR_P4D			0xFFFFFF04  /* desktop P4  */
+#define SPEEDSTEP_PROCESSOR_PCORE		0xFFFFFF05  /* Core */
 
 /* speedstep states -- only two of them */
 
diff --git a/include/asm-i386/msr.h b/include/asm-i386/msr.h
index 62b76cd..e2e98d6 100644
--- a/include/asm-i386/msr.h
+++ b/include/asm-i386/msr.h
@@ -95,6 +95,8 @@ #define MSR_IA32_UCODE_REV		0x8b
 
 #define MSR_P6_PERFCTR0		0xc1
 #define MSR_P6_PERFCTR1		0xc2
+#define MSR_FSB_FREQ		0xcd
+
 
 #define MSR_IA32_BBL_CR_CTL		0x119
