From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH >=2.6.4] single-line,
	but KERN_WARNING message in p4-clockmod
Date: Sat, 14 Feb 2004 19:45:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040214184504.GA5635@dominikbrodowski.de>
References: <20040214160105.GA7747@dominikbrodowski.de>
	<20040214164142.GA29606@redhat.com>
	<20040214182330.GA5097@dominikbrodowski.de>
	<20040214182950.C16829@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040214182950.C16829@flint.arm.linux.org.uk>
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
To: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Sat, Feb 14, 2004 at 06:29:50PM +0000, Russell King wrote:
> On Sat, Feb 14, 2004 at 07:23:30PM +0100, Dominik Brodowski wrote:
> >  	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
> >  		/* Pentium M */
> > -		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
> > -		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
> > -		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
> > +		printk(KERN_WARNING PFX "Warning: Pentium M detected. ");
> > +		printk("The speedstep_centrino module offers voltage scaling");
> > +		printk(" in addition of frequency scaling. You should use ");
> > +		printk("that instead of p4-clockmod, if possible.\n");
> 
> I think that's a lot worse for one major reason - you loose the atomicity
> of printk() if you do that, especially if you use serial console.
> 
> I haven't seen this done anywhere else in the kernel... lets not start
> doing it now.
> 
> 		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
> 		       "The speedstep_centrino module offers voltage scaling "
> 		       "in addition of frequency scaling. You should use "
> 		       "that instead of p4-clockmod, if possible.\n");

Thanks,
	Dominik

Use KERN_WARNING for warning. Thanks to Dave Jones, Pavel Machel and Russell 
King for their help getting this patch right.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-14 19:22:23.907928496 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-14 19:41:32.135371392 +0100
@@ -181,21 +181,24 @@
 {
 	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
 		/* Pentium M */
-		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
-		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
+		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
+		       "The speedstep_centrino module offers voltage scaling"
+		       " in addition of frequency scaling. You should use "
+		       "that instead of p4-clockmod, if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
 	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_DEBUG PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
 		return 0;
 	}
 
 	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
-		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
-		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
+		printk(KERN_WARNING PFX "Warning: Pentium 4-M detected. "
+		       "The speedstep-ich or acpi cpufreq modules offers "
+		       "voltage scaling in addition of frequency scaling. "
+		       "You should use either one instead of p4-clockmod, "
+		       "if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
 	}
