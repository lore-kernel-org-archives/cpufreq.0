From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] [1/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 10:50:30 -0600
Message-ID: <B3870AD84389624BAF87A3C7B83149930293565E@SAUSEXMB2.amd.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>, Andi Kleen <ak@suse.de>

On Tuesday, February 28, 2006 10:23 AM Dave Jones wrote:
> On Mon, Feb 27, 2006 at 07:54:36PM -0600, shin, jacob wrote:
>  > +	data->currvid =3D data->currvid;
>  > +	data->currfid =3D data->currfid;

Sorry about that, here we go again..

powernow-k8: Let cpufreq driver handle affected CPUs

Let the cpufreq driver manage AMD Dual-Core CPUs being tied together.

Since cpufreq driver's affected CPUs data, cpufreq_policy->cpus, already
knows about which cores are tied together, powernow driver does not have
keep its internal data for every core.  (even a pointer.. it will never
be called on)  Telling cpufreq driver about cpu_core_map at init time is
sufficient.

Signed-off-by: Jacob Shin <jacob.shin@amd.com>

---

--- linux.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2006-02-27 =
06:40:23.000000000 -0600
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2006-02-28 =
04:38:30.000000000 -0600
@@ -45,7 +45,7 @@
=20
 #define PFX "powernow-k8: "
 #define BFX PFX "BIOS error: "
-#define VERSION "version 1.60.0"
+#define VERSION "version 1.60.1"
 #include "powernow-k8.h"
=20
 /* serialize freq changes  */
@@ -909,7 +909,6 @@ static int powernowk8_target(struct cpuf
 	u32 checkvid =3D data->currvid;
 	unsigned int newstate;
 	int ret =3D -EIO;
-	int i;
=20
 	/* only run on specific CPU from here on */
 	oldmask =3D current->cpus_allowed;
@@ -955,12 +954,6 @@ static int powernowk8_target(struct cpuf
 		up(&fidvid_sem);
 		goto err_out;
 	}
-
-	/* Update all the fid/vids of our siblings */
-	for_each_cpu_mask(i, cpu_core_map[pol->cpu]) {
-		powernow_data[i]->currvid =3D data->currvid;
-		powernow_data[i]->currfid =3D data->currfid;
-	}=09
 	up(&fidvid_sem);
=20
 	pol->cur =3D find_khz_freq_from_fid(data->currfid);
@@ -984,7 +977,7 @@ static int __cpuinit powernowk8_cpu_init
 {
 	struct powernow_k8_data *data;
 	cpumask_t oldmask =3D CPU_MASK_ALL;
-	int rc, i;
+	int rc;
=20
 	if (!cpu_online(pol->cpu))
 		return -ENODEV;
@@ -1070,9 +1063,7 @@ static int __cpuinit powernowk8_cpu_init
 	printk("cpu_init done, current fid 0x%x, vid 0x%x\n",
 	       data->currfid, data->currvid);
=20
-	for_each_cpu_mask(i, cpu_core_map[pol->cpu]) {
-		powernow_data[i] =3D data;
-	}
+	powernow_data[pol->cpu] =3D data;
=20
 	return 0;
=20
