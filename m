From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] kernel crash in powernow-k8 after lost ticks
 detected
Date: Mon, 27 Mar 2006 09:57:20 -0600
Message-ID: <B3870AD84389624BAF87A3C7B831499302935767@SAUSEXMB2.amd.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>, Jan Beulich <jbeulich@novell.com>
Cc: Pavel Machek <pavel@suse.de>, cpufreq@lists.linux.org.uk, "Langsdorf,
	Mark" <mark.langsdorf@amd.com>, davej@redhat.com

On Sunday, March 26, 2006 2:25 AM Dominik Brodowski wrote:

> cpufreq_driver->get() can get called for _any_ CPU -- that's the
> semantics of that funciton, which I would not want to be changed.
> Therefore I prefer the patch by Andi which fixes powernow-k8.c and
> which is in Linus' git tree by now.

Andi's patch will not work properly with CPU Hotplug.
Please use the following patch instead.

Signed-off-by: Jacob Shin <jacob.shin@amd.com>

---
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

Index: linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
@@ -1103,10 +1103,15 @@ static int __devexit powernowk8_cpu_exit
=20
 static unsigned int powernowk8_get (unsigned int cpu)
 {
-	struct powernow_k8_data *data =3D powernow_data[cpu];
+	struct powernow_k8_data *data;
 	cpumask_t oldmask =3D current->cpus_allowed;
 	unsigned int khz =3D 0;
=20
+	data =3D powernow_data[first_cpu(cpu_core_map[cpu])];
+
+	if (!data)
+		return -EINVAL;
+
 	set_cpus_allowed(current, cpumask_of_cpu(cpu));
 	if (smp_processor_id() !=3D cpu) {
 		printk(KERN_ERR PFX "limiting to CPU %d failed in powernowk8_get\n", =
cpu);
