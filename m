From: Dave Jones <davej@redhat.com>
Subject: Re: my dothan didn't work with cpufreq...
Date: Mon, 2 Aug 2004 21:29:00 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040802202900.GB12724@redhat.com>
References: <20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
	<20040722060437.GA8888@dominikbrodowski.de>
	<1090479407.4351.6.camel@localhost>
	<20040722093126.GA8418@dominikbrodowski.de>
	<1090517665.5267.9.camel@ixodes.goop.org>
	<20040723193859.GC8441@dominikbrodowski.de>
	<1090632444.2950.1.camel@localhost>
	<20040802192608.GA17023@redhat.com>
	<1091477873.18905.1.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091477873.18905.1.camel@localhost>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, Aug 02, 2004 at 01:17:53PM -0700, Jeremy Fitzhardinge wrote:
 > On Mon, 2004-08-02 at 20:26 +0100, Dave Jones wrote:
 > > I merged this, but something occurred to me whilst eyeballing
 > > the diffs.  Rather than duplicating X86_VENDOR_INTEL in every
 > > entry of the struct, how about we check it in one place?
 > > 
 > > I'm unaware of any vendor planning to duplicate speedstep,
 > > but even if AMD/VIA threw away their current implementations
 > > in favour of a bit-for-bit compatible implementation, it
 > > wouldn't be hard to add an extra if()
 > 
 > I had the same thought.  I already added the vendor check at the top of
 > the init function, so in theory nothing else should need to look at it.
 > 
 > So, we can just drop the vendor entries in those tables without having
 > to do anything else.

Groovy. I just nuked it in my tree with this patch.
It'll go to Linus with the next batch

If some vendor does clone speedstep, I think it'd be better
done without having to dupe the vendor ID in every entry,
by having per-vendor tables.

		Dave

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/08/02 21:27:47+01:00 davej@redhat.com 
#   [CPUFREQ] speedstep-centrino: Remove unnecessary vendor checks.
#   
#   This is only used on Intel, and if some other vendor ever clones speedstep,
#   we can add an additional check in the init routine.
#   
#   Signed-off-by: Dave Jones <davej@redhat.com>
# 
# arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
#   2004/08/02 21:27:39+01:00 davej@redhat.com +3 -5
#   [CPUFREQ] speedstep-centrino: Remove unnecessary vendor checks.
#   
#   This is only used on Intel, and if some other vendor ever clones speedstep,
#   we can add an additional check in the init routine.
#   
#   Signed-off-by: Dave Jones <davej@redhat.com>
# 
diff -Nru a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-02 21:28:42 +01:00
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-02 21:28:42 +01:00
@@ -40,7 +40,6 @@
 
 struct cpu_id
 {
-	__u8	x86_vendor;     /* CPU vendor */
 	__u8	x86;            /* CPU family */
 	__u8	x86_model;	/* model */
 	__u8	x86_mask;	/* stepping */
@@ -53,9 +52,9 @@
 };
 
 static const struct cpu_id cpu_ids[] = {
-	[CPU_BANIAS]	= { X86_VENDOR_INTEL,	6,  9, 5 },
-	[CPU_DOTHAN_A1]	= { X86_VENDOR_INTEL,	6, 13, 1 },
-	[CPU_DOTHAN_B0]	= { X86_VENDOR_INTEL,	6, 13, 6 },
+	[CPU_BANIAS]	= { 6,  9, 5 },
+	[CPU_DOTHAN_A1]	= { 6, 13, 1 },
+	[CPU_DOTHAN_B0]	= { 6, 13, 6 },
 };
 #define N_IDS	(sizeof(cpu_ids)/sizeof(cpu_ids[0]))
 
@@ -265,7 +264,6 @@
 static int centrino_verify_cpu_id(const struct cpuinfo_x86 *c, const struct cpu_id *x)
 {
 	if ((c->x86 == x->x86) &&
-	    (c->x86_vendor == x->x86_vendor) &&
 	    (c->x86_model == x->x86_model) &&
 	    (c->x86_mask == x->x86_mask))
 		return 1;
