From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH][powernow-k7] correcting SGTC.  Timer is based upon FSB.
Date: Wed, 14 Apr 2004 12:36:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414103646.GB8953@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

Hi Dave,

I think this patch is needed especially if the FSB is around 166MHz or
200MHz, or else I believe we get instabilities on some K7's motherboard
powernow capable (it's called Cool'n Quiet IIRC).


* Deduce fsb from cpu_khz and the max multiplier.  It will be given as kHz now,
  so that frequency associated to a multiplier will be computate more
  accurately.  Also, we need it for SGTC (see below).
* Fix how cpuid is computed in powernow_decode_bios().
* Be more restrictive for PST.  It may be possible (on desktop shipped with
  low power Athlon models) that FSB can be changed by dip switchs on
  motherboard for example.
* Fix computation for SGTC.  It use the bus timer (and then the bus
  frequency given by fsb).

 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |  152 ++++++++++++++++++++++-------
 1 files changed, 119 insertions(+), 33 deletions(-)

--- linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 09:25:59	1.1
+++ linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 10:18:59
@@ -85,6 +85,14 @@
 static unsigned int latency;
 static char have_a0;
 
+static int check_fsb(unsigned int fsbspeed)
+{
+	int delta;
+	unsigned int f = fsb / 1000;
+
+	delta = (fsbspeed > f) ? fsbspeed - f : f - fsbspeed;
+	return (delta < 5);
+}
 
 static int check_powernow(void)
 {
@@ -140,7 +148,8 @@
 
 static int get_ranges (unsigned char *pst)
 {
-	unsigned int j, speed;
+	unsigned int j;
+	unsigned int speed;
 	u8 fid, vid;
 
 	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (number_scales + 1)), GFP_KERNEL);
@@ -151,12 +160,12 @@
 	for (j=0 ; j < number_scales; j++) {
 		fid = *pst++;
 
-		powernow_table[j].frequency = fsb * fid_codes[fid] * 100;
+		powernow_table[j].frequency = (fsb * fid_codes[fid]) / 10;
 		powernow_table[j].index = fid; /* lower 8 bits */
 
-		speed = fsb * (fid_codes[fid]/10);
+		speed = powernow_table[j].frequency;
+
 		if ((fid_codes[fid] % 10)==5) {
-			speed += fsb/2;
 #if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
 			if (have_a0 == 1)
 				powernow_table[j].frequency = CPUFREQ_ENTRY_INVALID;
@@ -164,7 +173,7 @@
 		}
 
 		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
-			fid_codes[fid] / 10, fid_codes[fid] % 10, speed);
+			fid_codes[fid] / 10, fid_codes[fid] % 10, speed/1000);
 
 		if (speed < minimum_speed)
 			minimum_speed = speed;
@@ -234,7 +243,8 @@
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 	cfid = fidvidstatus.bits.CFID;
-	freqs.old = fsb * fid_codes[cfid] * 100;
+	freqs.old = fsb * fid_codes[cfid] / 10;
+
 	freqs.new = powernow_table[index].frequency;
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -266,15 +276,12 @@
 {
 	struct psb_s *psb;
 	struct pst_s *pst;
-	struct cpuinfo_x86 *c = cpu_data;
 	unsigned int i, j;
 	unsigned char *p;
 	unsigned int etuple;
 	unsigned int ret;
 
 	etuple = cpuid_eax(0x80000001);
-	etuple &= 0xf00;
-	etuple |= (c->x86_model<<4)|(c->x86_mask);
 
 	for (i=0xC0000; i < 0xffff0 ; i+=16) {
 
@@ -305,7 +312,6 @@
 			}
 			dprintk (KERN_INFO PFX "Settling Time: %d microseconds.\n", psb->settlingtime);
 			dprintk (KERN_INFO PFX "Has %d PST tables. (Only dumping ones relevant to this CPU).\n", psb->numpst);
-			latency *= 100;	/* SGTC needs to be in units of 10ns */
 
 			p += sizeof (struct psb_s);
 
@@ -315,7 +321,8 @@
 				pst = (struct pst_s *) p;
 				number_scales = pst->numpstates;
 
-				if ((etuple == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))
+				if ((etuple == pst->cpuid) && check_fsb(pst->fsbspeed) &&
+				    (maxfid==pst->maxfid) && (startvid==pst->startvid))
 				{
 					dprintk (KERN_INFO PFX "PST:%d (@%p)\n", i, pst);
 					dprintk (KERN_INFO PFX " cpuid: 0x%x\t", pst->cpuid);
@@ -323,7 +330,6 @@
 					dprintk ("maxFID: 0x%x\t", pst->maxfid);
 					dprintk ("startvid: 0x%x\n", pst->startvid);
 
-					fsb = pst->fsbspeed;
 					ret = get_ranges ((char *) pst + sizeof (struct pst_s));
 					return ret;
 
@@ -365,6 +371,33 @@
 	return cpufreq_frequency_table_verify(policy, powernow_table);
 }
 
+/*
+ * We use the fact that the bus frequency is somehow
+ * a multiple of 100000/3 khz, then we compute sgtc according
+ * to this multiple.
+ * That way, we match more how AMD thinks all of that work.
+ * We will then get the same kind of behaviour already tested under
+ * the "well-known" other OS.
+ */
+static int __init fixup_sgtc(void)
+{
+	unsigned int sgtc;
+	unsigned int m;
+
+	m = fsb / 3333;
+	if ((m % 10) >= 5)
+		m += 5;
+
+	m /= 10;
+
+	sgtc = 100 * m * latency;
+	sgtc = sgtc / 3;
+	if (sgtc > 0xfffff) {
+		printk(KERN_WARNING PFX "SGTC too large %d\n", sgtc);
+		sgtc = 0xfffff;
+	}
+	return sgtc;
+}
 
 static int __init powernow_cpu_init (struct cpufreq_policy *policy)
 {
@@ -376,18 +409,28 @@
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
+	/* A K7 with powernow technology is set to max frequency by BIOS */
+	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	if (!fsb) {
+		printk(KERN_WARNING PFX "can not determine bus frequency\n");
+		return -EINVAL;
+	}
+	dprintk(KERN_INFO PFX "FSB: %3d.%03d MHz\n", fsb/1000, fsb%1000);
+
 	result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
 	if (result)
 		return result;
 
 	printk (KERN_INFO PFX "Minimum speed %d MHz. Maximum speed %d MHz.\n",
-				minimum_speed, maximum_speed);
+				minimum_speed/1000, maximum_speed/1000);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
-	/* latency is in 10 ns (look for SGTC above) for each VID
-	 * and FID transition, so multiply that value with 20 */
-	policy->cpuinfo.transition_latency = latency * 20;
+	policy->cpuinfo.transition_latency = latency * 2;
+
+	/* SGTC use the bus clock as timer */
+	latency = fixup_sgtc();
+	printk(KERN_INFO PFX "SGTC: %d\n", latency);
 
 	policy->cur = maximum_speed;
 


Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
