From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq_set_policy removed
Date: Wed, 6 Jun 2007 19:13:43 -0400
Message-ID: <20070606231342.GA16771@redhat.com>
References: <20070606214243.GX15955@bakeyournoodle.com>
	<1181170878.31677.272.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1181170878.31677.272.camel@localhost.localdomain>
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
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: davej@codemonkey.org.uk, Christian Krafft <krafft@de.ibm.com>, Tony Breeds <tony@bakeyournoodle.com>, cpufreq@lists.linux.org.uk

On Thu, Jun 07, 2007 at 09:01:18AM +1000, Ben Herrenschmidt wrote:
 > On Thu, 2007-06-07 at 07:42 +1000, Tony Breeds wrote:
 > > Hi All,
 > > 	The git commit  632786ce9ff6206951ee4c84fe5c0d5c1d12f4cc reomved
 > > the "deprecated and buggy" cpufreq_set_policy().  In the linux powerpc
 > > tree we have a driver that's using it.
 > 
 > Ugh... we still use it ? I though we had fixed that ...
 > 
 > CC'ing Christian who maintains the CBE cpufreq driver.

Thomas mailed the following patch a few weeks ago..

	Dave

Subject: Re: removal of cpufreq_set_policy()
From: Thomas Renninger <trenn@suse.de>
Reply-To: trenn@suse.de
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: davej@redhat.com, Arnd Bergmann <arnd@arndb.de>,
        Christian Krafft <krafft@de.ibm.com>, cpufreq@lists.linux.org.uk
In-Reply-To: <1178529617.14928.4.camel@localhost.localdomain>
References: <1178522195.6353.246.camel@localhost.localdomain>
	 <1178528071.1231.942.camel@queen.suse.de>
	 <1178529617.14928.4.camel@localhost.localdomain>
Content-Type: multipart/mixed; boundary="=-Hzx+Pg+lBncYZX+nEfyQ"
Date: Mon, 21 May 2007 06:54:13 -0500
Message-Id: <1179748453.20299.68.camel@sublime.suse.de>


--=-Hzx+Pg+lBncYZX+nEfyQ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-05-07 at 19:20 +1000, Benjamin Herrenschmidt wrote:
> On Mon, 2007-05-07 at 10:54 +0200, Thomas Renninger wrote:
> 
> > set_policy is buggy:
> >   It calls verify_within_limits (where max_freq might get reduced)
> >   then sets
> >   data->user_policy.max = data->max;
> >   which is used to restore to highest freq with update_policy, but
> >   an already lowered freq might get assigned (e.g. if initialized
> >   on battery with limited freq, you will never ever reach higher
> >   freqs again).
> > 
> > I grepped the whole kernel and couldn't find cpufreq_set_policy to be
> > used anywhere else.
> 
> Looks like cbe_cpufreq driver was merged at the same time as you were
> removing set_polcy :-)
Yes.
> 
> > The cell cpufreq driver also does not match?:
> > linux-2.6.21_tests/arch/powerpc/platforms/cell/cbe_cpufreq.c
> > 
> > Can you give me a pointer to the code, is this an external project?
> 
> It should be in that cbe_cpufreq.c file in current -git. I'm not the
> author of the driver though, I'm just reporting the build failure :-) 
> 
> Arnd and Christian, can you check what's up ?
> 
> I think that driver uses set_policy to enforce new limits upon request
> from the system management.
> 
> I know I did something similar, though slightly different, for powermac,
> in drivers/macintosh/windfarm_cpufreq_clamp.c which is a module in my
> thermal control infrastructure that clamps down the cpufreq when an
> overtemp condition is detected.

I can reproduce this with -rc2.
cpufreq_set_policy came in with this one:
2007-04-23 Christian Krafft [POWERPC] cell: use pmi in cpufreq driver

Attached patch is setting the limit like it's done for x86 in
driver/acpi/processor_perflib.c
IMO the interface is more complicated as it needs to be (maybe I am
wrong),
but it seems that this is the way it's intended to work.

Please review, ehh, I don't have HW to test and don't even know what pmi
is,
can someone give this patch a test and try whether freq is limited and
increased again correctly if "pmi" kicks in (compile tested...).

       Thomas

Limit frequency for cell powerpc via cpufreq notifier chain

and get rid of cpufreq_set_policy call that caused a build
failure due interfering commits

Signed-off-by: Thomas Renninger <trenn@suse.de>


---
 arch/powerpc/platforms/cell/cbe_cpufreq.c |   28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

Index: linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
===================================================================
--- linux-2.6.22-rc2.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
+++ linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
@@ -67,6 +67,7 @@ static u64 MIC_Slow_Next_Timer_table[] =
 	0x00003FC000000000ull,
 };
 
+static unsigned int pmi_frequency_limit = 0;
 /*
  * hardware specific functions
  */
@@ -164,7 +165,6 @@ static int set_pmode(int cpu, unsigned i
 
 static void cbe_cpufreq_handle_pmi(struct of_device *dev, pmi_message_t pmi_msg)
 {
-	struct cpufreq_policy policy;
 	u8 cpu;
 	u8 cbe_pmode_new;
 
@@ -173,15 +173,27 @@ static void cbe_cpufreq_handle_pmi(struc
 	cpu = cbe_node_to_cpu(pmi_msg.data1);
 	cbe_pmode_new = pmi_msg.data2;
 
-	cpufreq_get_policy(&policy, cpu);
+	pmi_frequency_limit = cbe_freqs[cbe_pmode_new].frequency;
 
-	policy.max = min(policy.max, cbe_freqs[cbe_pmode_new].frequency);
-	policy.min = min(policy.min, policy.max);
+	pr_debug("cbe_handle_pmi: max freq=%d\n", pmi_frequency_limit);
+}
+
+static int pmi_notifier(struct notifier_block *nb,
+				       unsigned long event, void *data)
+{
+	struct cpufreq_policy *policy = data;
+
+	if (event != CPUFREQ_INCOMPATIBLE)
+		return 0;
 
-	pr_debug("cbe_handle_pmi: new policy.min=%d policy.max=%d\n", policy.min, policy.max);
-	cpufreq_set_policy(&policy);
+	cpufreq_verify_within_limits(policy, 0, pmi_frequency_limit);
+	return 0;
 }
 
+static struct notifier_block pmi_notifier_block = {
+	.notifier_call = pmi_notifier,
+};
+
 static struct pmi_handler cbe_pmi_handler = {
 	.type			= PMI_TYPE_FREQ_CHANGE,
 	.handle_pmi_message	= cbe_cpufreq_handle_pmi,
@@ -238,6 +250,10 @@ static int cbe_cpufreq_cpu_init(struct c
 
 	cpufreq_frequency_table_get_attr(cbe_freqs, policy->cpu);
 
+	/* frequency might get limited later, initialize limit with max_freq */
+	pmi_frequency_limit = max_freq;
+	cpufreq_register_notifier(&pmi_notifier_block, CPUFREQ_POLICY_NOTIFIER);
+
 	/* this ensures that policy->cpuinfo_min and policy->cpuinfo_max are set correctly */
 	return cpufreq_frequency_table_cpuinfo(policy, cbe_freqs);
 }


--=-Hzx+Pg+lBncYZX+nEfyQ
Content-Disposition: attachment; filename=ppc_cpufreq_pmi_notifier.patch
Content-Type: text/x-patch; name=ppc_cpufreq_pmi_notifier.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Limit frequency for cell powerpc via cpufreq notifier chain

and get rid of cpufreq_set_policy call that caused a build
failure due interfering commits

Signed-off-by: Thomas Renninger <trenn@suse.de>


---
 arch/powerpc/platforms/cell/cbe_cpufreq.c |   28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

Index: linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
===================================================================
--- linux-2.6.22-rc2.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
+++ linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
@@ -67,6 +67,7 @@ static u64 MIC_Slow_Next_Timer_table[] =
 	0x00003FC000000000ull,
 };
 
+static unsigned int pmi_frequency_limit = 0;
 /*
  * hardware specific functions
  */
@@ -164,7 +165,6 @@ static int set_pmode(int cpu, unsigned i
 
 static void cbe_cpufreq_handle_pmi(struct of_device *dev, pmi_message_t pmi_msg)
 {
-	struct cpufreq_policy policy;
 	u8 cpu;
 	u8 cbe_pmode_new;
 
@@ -173,15 +173,27 @@ static void cbe_cpufreq_handle_pmi(struc
 	cpu = cbe_node_to_cpu(pmi_msg.data1);
 	cbe_pmode_new = pmi_msg.data2;
 
-	cpufreq_get_policy(&policy, cpu);
+	pmi_frequency_limit = cbe_freqs[cbe_pmode_new].frequency;
 
-	policy.max = min(policy.max, cbe_freqs[cbe_pmode_new].frequency);
-	policy.min = min(policy.min, policy.max);
+	pr_debug("cbe_handle_pmi: max freq=%d\n", pmi_frequency_limit);
+}
+
+static int pmi_notifier(struct notifier_block *nb,
+				       unsigned long event, void *data)
+{
+	struct cpufreq_policy *policy = data;
+
+	if (event != CPUFREQ_INCOMPATIBLE)
+		return 0;
 
-	pr_debug("cbe_handle_pmi: new policy.min=%d policy.max=%d\n", policy.min, policy.max);
-	cpufreq_set_policy(&policy);
+	cpufreq_verify_within_limits(policy, 0, pmi_frequency_limit);
+	return 0;
 }
 
+static struct notifier_block pmi_notifier_block = {
+	.notifier_call = pmi_notifier,
+};
+
 static struct pmi_handler cbe_pmi_handler = {
 	.type			= PMI_TYPE_FREQ_CHANGE,
 	.handle_pmi_message	= cbe_cpufreq_handle_pmi,
@@ -238,6 +250,10 @@ static int cbe_cpufreq_cpu_init(struct c
 
 	cpufreq_frequency_table_get_attr(cbe_freqs, policy->cpu);
 
+	/* frequency might get limited later, initialize limit with max_freq */
+	pmi_frequency_limit = max_freq;
+	cpufreq_register_notifier(&pmi_notifier_block, CPUFREQ_POLICY_NOTIFIER);
+
 	/* this ensures that policy->cpuinfo_min and policy->cpuinfo_max are set correctly */
 	return cpufreq_frequency_table_cpuinfo(policy, cbe_freqs);
 }

--=-Hzx+Pg+lBncYZX+nEfyQ--


-- 
http://www.codemonkey.org.uk
