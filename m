From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] 1/2 Improve Error reporting
Date: Mon, 21 Nov 2005 12:02:29 -0600
Message-ID: <B3870AD84389624BAF87A3C7B831499302935311@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

On Monday, November 21, 2005 9:36 AM Dave Jones wrote:
> (Also: Please make your patches so that they apply with -p1

here is the cleanup patch again, to be applied w/ -p1 flag.

---

Improve Error reporting in powernow-k8.

This patch also gets rid of "limiting to cpu failed" printk's when
compiled with CONFIG_CPU_HOTPLUG.

Jacob Shin <jacob.shin@amd.com>

--- linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig
2005-11-19 19:25:03.000000000 -0800
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005-11-21
09:27:05.192971592 -0800
@@ -45,7 +45,7 @@
=20
 #define PFX "powernow-k8: "
 #define BFX PFX "BIOS error: "
-#define VERSION "version 1.50.4"
+#define VERSION "version 1.50.5"
 #include "powernow-k8.h"
=20
 /* serialize freq changes  */
@@ -464,7 +464,7 @@ static int check_supported_cpu(unsigned=20
 	set_cpus_allowed(current, cpumask_of_cpu(cpu));
=20
 	if (smp_processor_id() !=3D cpu) {
-		printk(KERN_ERR "limiting to cpu %u failed\n", cpu);
+		printk(KERN_ERR PFX "limiting to cpu %u failed\n", cpu);
 		goto out;
 	}
=20
@@ -517,22 +517,28 @@ static int check_pst_table(struct powern
 			printk(KERN_ERR BFX "maxvid exceeded with pstate
%d\n", j);
 			return -ENODEV;
 		}
-		if ((pst[j].fid > MAX_FID)
-		    || (pst[j].fid & 1)
-		    || (j && (pst[j].fid < HI_FID_TABLE_BOTTOM))) {
+		if (pst[j].fid > MAX_FID) {
+			printk(KERN_ERR BFX "maxfid exceeded with pstate
%d\n", j);
+			return -ENODEV;
+		}
+		if (pst[j].fid & 1) {
+			printk(KERN_ERR BFX "fid invalid - %d : 0x%x\n",
j, pst[j].fid);
+			return -EINVAL;
+		}
+		if (j && (pst[j].fid < HI_FID_TABLE_BOTTOM)) {
 			/* Only first fid is allowed to be in "low"
range */
-			printk(KERN_ERR PFX "two low fids - %d :
0x%x\n", j, pst[j].fid);
+			printk(KERN_ERR BFX "two low fids - %d :
0x%x\n", j, pst[j].fid);
 			return -EINVAL;
 		}
 		if (pst[j].fid < lastfid)
 			lastfid =3D pst[j].fid;
 	}
 	if (lastfid & 1) {
-		printk(KERN_ERR PFX "lastfid invalid\n");
+		printk(KERN_ERR BFX "lastfid invalid\n");
 		return -EINVAL;
 	}
 	if (lastfid > LO_FID_TABLE_TOP)
-		printk(KERN_INFO PFX  "first fid not from lo freq
table\n");
+		printk(KERN_INFO BFX  "lastfid not from lo freq
table\n");
=20
 	return 0;
 }
@@ -912,7 +918,7 @@ static int powernowk8_target(struct cpuf
 	set_cpus_allowed(current, cpumask_of_cpu(pol->cpu));
=20
 	if (smp_processor_id() !=3D pol->cpu) {
-		printk(KERN_ERR "limiting to cpu %u failed\n",
pol->cpu);
+		printk(KERN_ERR PFX "limiting to cpu %u failed\n",
pol->cpu);
 		goto err_out;
 	}
=20
@@ -982,6 +988,9 @@ static int __init powernowk8_cpu_init(st
 	cpumask_t oldmask =3D CPU_MASK_ALL;
 	int rc, i;
=20
+	if (!cpu_online(pol->cpu))
+		return -ENODEV;
+
 	if (!check_supported_cpu(pol->cpu))
 		return -ENODEV;
=20
@@ -1021,7 +1030,7 @@ static int __init powernowk8_cpu_init(st
 	set_cpus_allowed(current, cpumask_of_cpu(pol->cpu));
=20
 	if (smp_processor_id() !=3D pol->cpu) {
-		printk(KERN_ERR "limiting to cpu %u failed\n",
pol->cpu);
+		printk(KERN_ERR PFX "limiting to cpu %u failed\n",
pol->cpu);
 		goto err_out;
 	}
=20
@@ -1162,7 +1171,7 @@ static void __exit powernowk8_exit(void)
 	cpufreq_unregister_driver(&cpufreq_amd64_driver);
 }
=20
-MODULE_AUTHOR("Paul Devriendt <paul.devriendt@amd.com> and Mark
Langsdorf <mark.langsdorf@amd.com.");
+MODULE_AUTHOR("Paul Devriendt <paul.devriendt@amd.com> and Mark
Langsdorf <mark.langsdorf@amd.com>");
 MODULE_DESCRIPTION("AMD Athlon 64 and Opteron processor frequency
driver.");
 MODULE_LICENSE("GPL");

On Thursday, November 10, 2005 4:52 PM Langsdorf, Mark wrote:
> This patch cleans up some error messages in the
> powernow-k8 driver and makes them more understandable.
>=20
> Signed-off-by: Jacob Shin <jacob.shin@amd.com>
> Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
