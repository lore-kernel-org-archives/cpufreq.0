From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: my dothan didn't work with cpufreq...
Date: Fri, 23 Jul 2004 18:27:24 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1090632444.2950.1.camel@localhost>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
	<20040722060437.GA8888@dominikbrodowski.de>
	<1090479407.4351.6.camel@localhost>
	<20040722093126.GA8418@dominikbrodowski.de>
	<1090517665.5267.9.camel@ixodes.goop.org>
	<20040723193859.GC8441@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Doyb0ubbgqX8UHYEtM4I"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040723193859.GC8441@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq list <cpufreq@www.linux.org.uk>


--=-Doyb0ubbgqX8UHYEtM4I
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-07-23 at 21:38 +0200, Dominik Brodowski wrote: 
> Again IIRC, it's less about CodingStyle and more about some GCC 3.?
> warnings? Though, gcc 3.3.4 doesn't complain...

You mean the "[idx] = " syntax?

Anyway, having said that, I got it wrong (I had vendor and family
switched).  Fixed patch attached.

	J

--=-Doyb0ubbgqX8UHYEtM4I
Content-Disposition: attachment; filename=no-cyrix-est.patch
Content-Type: text/x-patch; name=no-cyrix-est.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit


A reduce-Jeremy's-mail patch:

 - Only Intel makes EST CPUs.  (Some Cyrix M IIs have the EST bit set - 
	I don't know what it means, but it isn't Enhanced Speedstep.)

 - If it's a known Dothan, but we're looking in the tables, give a
   useful message about using ACPI rather than mailing me.

 - Code cleanups:
  - Make the CPU ID stuff table driven
  - Turn centrino_verify_cpu_id into a proper boolean predicate

 - Diddle some whitespace


 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |   86 ++++++++++++----------
 1 files changed, 49 insertions(+), 37 deletions(-)

diff -puN arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~no-cyrix-est arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- local-2.6/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~no-cyrix-est	2004-07-21 20:22:16.000000000 -0700
+++ local-2.6-jeremy/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-07-23 16:15:31.726790060 -0700
@@ -40,33 +40,25 @@
 
 struct cpu_id
 {
-	__u8	x86;            /* CPU family */
 	__u8	x86_vendor;     /* CPU vendor */
+	__u8	x86;            /* CPU family */
 	__u8	x86_model;	/* model */
 	__u8	x86_mask;	/* stepping */
 };
 
-static const struct cpu_id cpu_id_banias = {
-	.x86_vendor = X86_VENDOR_INTEL,
-	.x86 = 6,
-	.x86_model = 9,
-	.x86_mask = 5,
-};
-
-static const struct cpu_id cpu_id_dothan_a1 = {
-	.x86_vendor = X86_VENDOR_INTEL,
-	.x86 = 6,
-	.x86_model = 13,
-	.x86_mask = 1,
-};
-
-static const struct cpu_id cpu_id_dothan_b0 = {
-	.x86_vendor = X86_VENDOR_INTEL,
-	.x86 = 6,
-	.x86_model = 13,
-	.x86_mask = 6,
+enum {
+	CPU_BANIAS,
+	CPU_DOTHAN_A1,
+	CPU_DOTHAN_B0,
 };
 
+static const struct cpu_id cpu_ids[] = {
+	[CPU_BANIAS]	= { X86_VENDOR_INTEL,	6,  9, 5 },
+	[CPU_DOTHAN_A1]	= { X86_VENDOR_INTEL,	6, 13, 1 },
+	[CPU_DOTHAN_B0]	= { X86_VENDOR_INTEL,	6, 13, 6 },
+};
+#define N_IDS	(sizeof(cpu_ids)/sizeof(cpu_ids[0]))
+
 struct cpu_model
 {
 	const struct cpu_id *cpu_id;
@@ -75,7 +67,7 @@ struct cpu_model
 
 	struct cpufreq_frequency_table *op_points; /* clock/voltage pairs */
 };
-static int centrino_verify_cpu_id(struct cpuinfo_x86 *c, const struct cpu_id *x);
+static int centrino_verify_cpu_id(const struct cpuinfo_x86 *c, const struct cpu_id *x);
 
 /* Operating points for current CPU */
 static struct cpu_model *centrino_model;
@@ -110,9 +102,9 @@ static struct cpufreq_frequency_table ba
 /* Ultra Low Voltage Intel Pentium M processor 1000MHz (Banias) */
 static struct cpufreq_frequency_table banias_1000[] =
 {
-	OP(600,  844),
-	OP(800,  972),
-	OP(900,  988),
+	OP(600,   844),
+	OP(800,   972),
+	OP(900,   988),
 	OP(1000, 1004),
 	{ .frequency = CPUFREQ_TABLE_END }
 };
@@ -206,13 +198,13 @@ static struct cpufreq_frequency_table ba
 	.max_freq	= (max)*1000,	\
 	.op_points	= banias_##max,	\
 }
-#define BANIAS(max)	_BANIAS(&cpu_id_banias, max, #max)
+#define BANIAS(max)	_BANIAS(&cpu_ids[CPU_BANIAS], max, #max)
 
 /* CPU models, their operating frequency range, and freq/voltage
    operating points */
 static struct cpu_model models[] = 
 {
-	_BANIAS(&cpu_id_banias, 900, " 900"),
+	_BANIAS(&cpu_ids[CPU_BANIAS], 900, " 900"),
 	BANIAS(1000),
 	BANIAS(1100),
 	BANIAS(1200),
@@ -221,6 +213,11 @@ static struct cpu_model models[] = 
 	BANIAS(1500),
 	BANIAS(1600),
 	BANIAS(1700),
+
+	/* NULL model_name is a wildcard */
+	{ &cpu_ids[CPU_DOTHAN_A1], NULL, 0, NULL },
+	{ &cpu_ids[CPU_DOTHAN_B0], NULL, 0, NULL },
+
 	{ NULL, }
 };
 #undef _BANIAS
@@ -231,17 +228,28 @@ static int centrino_cpu_init_table(struc
 	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
 	struct cpu_model *model;
 
-	for(model = models; model->model_name != NULL; model++)
-		if ((strcmp(cpu->x86_model_id, model->model_name) == 0) &&
-		    (!centrino_verify_cpu_id(cpu, model->cpu_id)))
+	for(model = models; model->cpu_id != NULL; model++)
+		if (centrino_verify_cpu_id(cpu, model->cpu_id) &&
+		    (model->model_name == NULL ||
+		     strcmp(cpu->x86_model_id, model->model_name) == 0))
 			break;
-	if (model->model_name == NULL) {
+	
+	if (model->cpu_id == NULL) {
+		/* No match at all */
 		printk(KERN_INFO PFX "no support for CPU model \"%s\": "
 		       "send /proc/cpuinfo to " MAINTAINER "\n",
 		       cpu->x86_model_id);
 		return -ENOENT;
 	}
 
+	if (model->op_points == NULL) {
+		/* Matched a non-match */
+		printk(KERN_INFO PFX "no table support for CPU model \"%s\": \n",
+		       cpu->x86_model_id);
+		printk(KERN_INFO PFX "try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
+		return -ENOENT;
+	}
+		
 	centrino_model = model;
 		
 	printk(KERN_INFO PFX "found \"%s\": max frequency: %dkHz\n",
@@ -254,14 +262,14 @@ static int centrino_cpu_init_table(struc
 static inline int centrino_cpu_init_table(struct cpufreq_policy *policy) { return -ENODEV; }
 #endif /* CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE */
 
-static int centrino_verify_cpu_id(struct cpuinfo_x86 *c, const struct cpu_id *x)
+static int centrino_verify_cpu_id(const struct cpuinfo_x86 *c, const struct cpu_id *x)
 {
 	if ((c->x86 == x->x86) &&
 	    (c->x86_vendor == x->x86_vendor) &&
 	    (c->x86_model == x->x86_model) &&
 	    (c->x86_mask == x->x86_mask))
-		return 0;
-	return -ENODEV;
+		return 1;
+	return 0;
 }
 
 /* Extract clock in kHz from PERF_CTL value */
@@ -399,16 +407,20 @@ static int centrino_cpu_init(struct cpuf
 	unsigned freq;
 	unsigned l, h;
 	int ret;
+	int i;
 
 	if (policy->cpu != 0)
 		return -ENODEV;
 
-	if (!cpu_has(cpu, X86_FEATURE_EST))
+	/* Only Intel makes Enhanced Speedstep-capable CPUs */
+	if (cpu->x86_vendor != X86_VENDOR_INTEL || !cpu_has(cpu, X86_FEATURE_EST))
 		return -ENODEV;
 
-	if ((centrino_verify_cpu_id(cpu, &cpu_id_banias)) &&
-	    (centrino_verify_cpu_id(cpu, &cpu_id_dothan_a1)) &&
-		(centrino_verify_cpu_id(cpu, &cpu_id_dothan_b0))) {
+	for (i = 0; i < N_IDS; i++)
+		if (centrino_verify_cpu_id(cpu, &cpu_ids[i]))
+			break;
+
+	if (i == N_IDS) {
 		printk(KERN_INFO PFX "found unsupported CPU with Enhanced SpeedStep: "
 		       "send /proc/cpuinfo to " MAINTAINER "\n");
 		return -ENODEV;

_

--=-Doyb0ubbgqX8UHYEtM4I
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-Doyb0ubbgqX8UHYEtM4I--


