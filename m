From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [powernow-k7] [dirty patch] introducing quirk_broken_bios. NEED
	TESTING
Date: Wed, 24 Mar 2004 15:39:34 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040324143934.GC19001@poupinou.org>
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
To: cpufreq@www.linux.org.uk


I would like that people with broken BIOS test this patch.  It's not
actually in a state to be submitted to Dave yet though.

You have to do something like that:
modprobe powernow-k7 quirk_broken_bios=1

I'm pretty sure it will work for:
Compaq NX9005,
Compaq Presario 2195US.

There are still some other known broken bios, like Acer, HP, eMachines (hint for
Paul ;) for example for which this may or may not work.

If that still fail, please use the dump_psb util from
http://www.poupinou.org/cpufreq/powernow-k7/dump_psb.c

sudo ./dump_psb
would give you the number of PST, and dump them, that the bios think she have.
sudo ./dump_psb <number>

will override the number of PST that the bios think she have.

So far, increasing it 'a little' will (or will not!) dump more
PST.

For example, on the NX9005 and on the Presario 2195US, there is
14 PSTs reported even though there is actually 18 of such PSTs.

if you do
sudo ./dump_psb 18
you will see all the missing PSTs (look at my mail yesterday on the list
for those dumps).



--- linus-bk-newest/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/24 13:54:03	1.1
+++ linus-bk-newest/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/24 14:15:24
@@ -83,6 +83,7 @@ static unsigned int maximum_speed;
 static unsigned int number_scales;
 static unsigned int fsb;
 static unsigned int latency;
+static int quirk_broken_bios;
 static char have_a0;
 
 
@@ -259,20 +260,35 @@ static void change_speed (unsigned int i
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 }
 
+static int cpuid_is_valide(unsigned int cpuid)
+{
+
+	switch(cpuid) {
+	case 0x760:
+	case 0x761:
+	case 0x762:
+	case 0x770:
+	case 0x771:
+	case 0x780:
+	case 0x781:
+	case 0x7a0:
+		return 1;
+	default:
+		return 0;
+	}
+	return 0;
+}
 
 static int powernow_decode_bios (int maxfid, int startvid)
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
 
@@ -309,10 +325,13 @@ static int powernow_decode_bios (int max
 
 			pst = (struct pst_s *) p;
 
-			for (i = 0 ; i <psb->numpst; i++) {
+			for (i = 0 ; i <psb->numpst || quirk_broken_bios; i++) {
 				pst = (struct pst_s *) p;
 				number_scales = pst->numpstates;
 
+				if (quirk_broken_bios && !cpuid_is_valide(pst->cpuid))
+					break;
+
 				if ((etuple == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))
 				{
 					dprintk (KERN_INFO PFX "PST:%d (@%p)\n", i, pst);
@@ -417,8 +436,11 @@ static struct cpufreq_driver powernow_dr
 static int __init powernow_init (void)
 {
 	if (dmi_broken & BROKEN_CPUFREQ) {
-		printk (KERN_INFO PFX "Disabled at boot time by DMI,\n");
-		return -ENODEV;
+		if (!quirk_broken_bios) {
+			printk (KERN_INFO PFX "Disabled at boot time by DMI\n");
+			return -ENODEV;
+		} else
+			printk (KERN_INFO PFX "your BIOS is broken.  Trying to continue anyway\n");
 	}
 	if (check_powernow()==0)
 		return -ENODEV;
@@ -433,6 +455,8 @@ static void __exit powernow_exit (void)
 		kfree(powernow_table);
 }
 
+MODULE_PARM (quirk_broken_bios, "i");
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
