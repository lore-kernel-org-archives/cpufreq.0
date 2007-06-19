From: Thomas Renninger <trenn@suse.de>
Subject: Re: cpufreq_set_policy removed
Date: Tue, 19 Jun 2007 14:14:30 +0200
Message-ID: <1182255270.28514.620.camel@queen.suse.de>
References: <20070606214243.GX15955@bakeyournoodle.com>
	<1181170878.31677.272.camel@localhost.localdomain>
	<20070606231342.GA16771@redhat.com>
	<1181929526.3436.8.camel@kp-core.localdomain>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-mGSbGhUDv/T+SwvFEKXB"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1181929526.3436.8.camel@kp-core.localdomain>
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
To: "Klaus.K Pedersen (Nokia-M/Helsinki)" <klaus.k.pedersen@nokia.com>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>


--=-mGSbGhUDv/T+SwvFEKXB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-06-15 at 20:45 +0300, Klaus.K Pedersen (Nokia-M/Helsinki)
wrote:
> I currently use set_policy() to get around some peculiar features 
> of OMAP2420, so at first I was a little scared. But now after fixing
> my code - I agree that it is much better to only rely on the
> CPUFREQ_POLICY_NOTIFIER chain.
> 
> I have some comments to patch in-line:
> 
> On Thu, 2007-06-07 at 00:14 +0000, an unknown sender wrote:
> ... 
> > On Mon, 2007-05-07 at 19:20 +1000, Benjamin Herrenschmidt wrote:
> ... 
> > Index: linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
> > ===================================================================
> > --- linux-2.6.22-rc2.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
> > +++ linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
> ...
> > @@ -173,15 +173,27 @@ static void cbe_cpufreq_handle_pmi(struc
> >  	cpu = cbe_node_to_cpu(pmi_msg.data1);
> >  	cbe_pmode_new = pmi_msg.data2;
> >  
> > -	cpufreq_get_policy(&policy, cpu);
> > +	pmi_frequency_limit = cbe_freqs[cbe_pmode_new].frequency;
> >  
> > -	policy.max = min(policy.max, cbe_freqs[cbe_pmode_new].frequency);
> > -	policy.min = min(policy.min, policy.max);
> > +	pr_debug("cbe_handle_pmi: max freq=%d\n", pmi_frequency_limit);
> > +}
> 
> Shouldn't cpufreq_update_policy() be called from this function? 

Yes, I think you are right, is that better?
Still a real-life test whether all that pmi things are working as
expected would be great...

Thanks for the detailed info and review,

    Thomas


Update the policy on pmi frequency changes

Also fixes a compile dependency, PPC_PMI is needed for cell cpufreq.

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 arch/powerpc/platforms/cell/Kconfig       |    2 +-
 arch/powerpc/platforms/cell/cbe_cpufreq.c |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

Index: linux-2.6.22-rc5/arch/powerpc/platforms/cell/cbe_cpufreq.c
===================================================================
--- linux-2.6.22-rc5.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
+++ linux-2.6.22-rc5/arch/powerpc/platforms/cell/cbe_cpufreq.c
@@ -175,6 +175,8 @@ static void cbe_cpufreq_handle_pmi(struc
 
 	pmi_frequency_limit = cbe_freqs[cbe_pmode_new].frequency;
 
+	cpufreq_update_policy(cpu);
+
 	pr_debug("cbe_handle_pmi: max freq=%d\n", pmi_frequency_limit);
 }
 
Index: linux-2.6.22-rc5/arch/powerpc/platforms/cell/Kconfig
===================================================================
--- linux-2.6.22-rc5.orig/arch/powerpc/platforms/cell/Kconfig
+++ linux-2.6.22-rc5/arch/powerpc/platforms/cell/Kconfig
@@ -66,7 +66,7 @@ config CBE_THERM
 
 config CBE_CPUFREQ
 	tristate "CBE frequency scaling"
-	depends on CBE_RAS && CPU_FREQ
+	depends on PPC_PMI && CBE_RAS && CPU_FREQ
 	default m
 	help
 	  This adds the cpufreq driver for Cell BE processors.


--=-mGSbGhUDv/T+SwvFEKXB
Content-Disposition: attachment; filename=cpufreq_cell_update_policy.patch
Content-Type: text/x-patch; name=cpufreq_cell_update_policy.patch;
	charset=utf-8
Content-Transfer-Encoding: 7bit

Update the policy on pmi frequency changes

Also fixes a compile dependency, PPC_PMI is needed for cell cpufreq.

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 arch/powerpc/platforms/cell/Kconfig       |    2 +-
 arch/powerpc/platforms/cell/cbe_cpufreq.c |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

Index: linux-2.6.22-rc5/arch/powerpc/platforms/cell/cbe_cpufreq.c
===================================================================
--- linux-2.6.22-rc5.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
+++ linux-2.6.22-rc5/arch/powerpc/platforms/cell/cbe_cpufreq.c
@@ -175,6 +175,8 @@ static void cbe_cpufreq_handle_pmi(struc
 
 	pmi_frequency_limit = cbe_freqs[cbe_pmode_new].frequency;
 
+	cpufreq_update_policy(cpu);
+
 	pr_debug("cbe_handle_pmi: max freq=%d\n", pmi_frequency_limit);
 }
 
Index: linux-2.6.22-rc5/arch/powerpc/platforms/cell/Kconfig
===================================================================
--- linux-2.6.22-rc5.orig/arch/powerpc/platforms/cell/Kconfig
+++ linux-2.6.22-rc5/arch/powerpc/platforms/cell/Kconfig
@@ -66,7 +66,7 @@ config CBE_THERM
 
 config CBE_CPUFREQ
 	tristate "CBE frequency scaling"
-	depends on CBE_RAS && CPU_FREQ
+	depends on PPC_PMI && CBE_RAS && CPU_FREQ
 	default m
 	help
 	  This adds the cpufreq driver for Cell BE processors.

--=-mGSbGhUDv/T+SwvFEKXB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--=-mGSbGhUDv/T+SwvFEKXB--


