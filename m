From: Gary Hade <garyhade@us.ibm.com>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Fri, 10 Nov 2006 11:20:47 -0800
Message-ID: <20061110192047.GA8934@us.ibm.com>
References: <20061106233923.GA15063@us.ibm.com>
	<20061107021441.GA10457@isilmar.linta.de>
	<200611070209.39817.len.brown@intel.com>
	<20061107184902.GA11620@us.ibm.com>
	<20061108232119.GB28012@us.ibm.com>
	<20061108232955.GL3309@redhat.com>
	<20061109000031.GD28012@us.ibm.com>
	<20061109002208.GA805@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061109002208.GA805@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Wed, Nov 08, 2006 at 07:22:08PM -0500, Dave Jones wrote:
> On Wed, Nov 08, 2006 at 04:00:31PM -0800, Gary Hade wrote:
> 
>  > > Argh. I sat on the fence on this one until the dest settled,
>  > > and now, as soon as I merge it, this happens. Bah!
>  > Dave, I'm sorry.  I just discovered the problem. :(
> 
> Ok, I just tried to reconstruct my git tree without that diff
> and hit problems trying to get the older patches applying against
> a current tree, so I don't want to go down the route of making
> everyone rediff and resend the 20 or so patches already queued.
> However..
> 
>  > > Send an incremental against cpufreq.git so I don't have to
>  > > reconstruct the whole git tree?  
>  > Okay, I'll try to figure out how to do that.
> 
> git revert has nuked the change, but leaves a mess in the commits,
> but I think we can live with that.  So just send the right fix,
> and we'll make like this never happened :-)

Dave, I apologize again for the trouble.  Improved patch
which does essentially the same thing but avoids modifying
the in-kernel ACPI data is included below.

Thanks!
Gary

-- 
Gary Hade
IBM Linux Technology Center
503-578-4503  IBM T/L: 775-4503
garyhade@us.ibm.com
http://www.ibm.com/linux/ltc


On some systems there could be bits set in the upper half of 
the control value provided by the _PSS object.  These bits are 
only relevant for cpufreq drivers that use IO ports which are not 
currently supported by the speedstep-centrino driver.  The current 
MSR oriented code assumes that upper bits are not set and thus 
fails to work correctly when they are.  e.g. the control and status 
value equality check failed on the IBM x3650 even though the ACPI 
spec allows inequality. 

Signed-off-by: Gary Hade <garyhade@us.ibm.com>

--- linux-2.6.19-rc5/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c.orig	2006-11-07 18:24:20.000000000 -0800
+++ linux-2.6.19-rc5/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2006-11-10 09:02:29.000000000 -0800
@@ -36,6 +36,7 @@
 
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "speedstep-centrino", msg)
 
+#define INTEL_MSR_RANGE	(0xffff)
 
 struct cpu_id
 {
@@ -463,8 +464,9 @@ static int centrino_cpu_init_acpi(struct
 	}
 
 	for (i=0; i<p->state_count; i++) {
-		if (p->states[i].control != p->states[i].status) {
-			dprintk("Different control (%llu) and status values (%llu)\n",
+		if ((p->states[i].control & INTEL_MSR_RANGE) != 
+		    (p->states[i].status & INTEL_MSR_RANGE)) {
+			dprintk("Different MSR bits in control (%llu) and status (%llu)\n",
 				p->states[i].control, p->states[i].status);
 			result = -EINVAL;
 			goto err_unreg;
@@ -500,7 +502,7 @@ static int centrino_cpu_init_acpi(struct
         }
 
         for (i=0; i<p->state_count; i++) {
-		centrino_model[cpu]->op_points[i].index = p->states[i].control;
+		centrino_model[cpu]->op_points[i].index = p->states[i].control & INTEL_MSR_RANGE;
 		centrino_model[cpu]->op_points[i].frequency = p->states[i].core_frequency * 1000;
 		dprintk("adding state %i with frequency %u and control value %04x\n", 
 			i, centrino_model[cpu]->op_points[i].frequency, centrino_model[cpu]->op_points[i].index);
