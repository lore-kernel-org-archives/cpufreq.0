From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] powernow-k7: example use for powernow_acpi_init()
Date: Mon, 22 Mar 2004 13:36:14 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322123614.GP28592@poupinou.org>
References: <20040322092543.GN28592@poupinou.org>
	<20040322093851.GO28592@poupinou.org>
	<20040322095135.GD29733@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040322095135.GD29733@redhat.com>
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
Cc: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

On Mon, Mar 22, 2004 at 09:51:35AM +0000, Dave Jones wrote:
> On Mon, Mar 22, 2004 at 10:38:51AM +0100, Bruno Ducrot wrote:
>  > 
>  > This is an example for using the powernow-k7 ACPI perflib integration,
>  > when the legacy PSB/PST tables are broken.
>  > 
>  > -			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
>  > -			printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
>  > -			return -EINVAL;
>  > +			ret = powernow_acpi_init();
>  > +			if (ret) {
>  > +				printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
>  > +				printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
>  > +				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
>  > +			}
>  > +			return ret;
>  >  		}
>  >  		p++;
>  >  	}
> 
> Looks good, though also mentioning that the acpi fallback failed is probably
> a good idea too.

Indeed.  And making ACPI perflib in case of known broken BIOS via
DMI may be good (the ASUS should work with that patch, if I read
correctly the DSDT).  There may be though one little annoying thing for
the ASUS bug: FSB will be reported at 100MHz whereas it is at
133MHz, but it's only cosmetic, I hope.

The real trouble is that I don't know how to retrieve FSB on a
athlon/duron: MSR_IA32_EBL_CR_POWERON do not give it :(


 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)


--- linux-2.6.5-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/22 09:50:04	1.3
+++ linux-2.6.5-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/22 12:36:25
@@ -410,11 +410,17 @@ err2:
 err1:
 	kfree(acpi_processor_perf);
 err0:
+	printk(KERN_WARNING PFX "ACPI perflib can not be used in this platform");
 	acpi_processor_perf = NULL;
 	return retval;
 }
 #else
-static int powernow_acpi_init(void) {return -EINVAL;}
+static int powernow_acpi_init(void)
+{
+	printk(KERN_INFO PFX "no support for ACPI processor found."
+	       "  Please recompile your kernel with ACPI processor");
+	return -EINVAL;
+}
 #endif
 
 static int powernow_decode_bios (int maxfid, int startvid)
@@ -427,6 +433,11 @@ static int powernow_decode_bios (int max
 	unsigned int etuple;
 	unsigned int ret;
 
+	if (dmi_broken & BROKEN_CPUFREQ) {
+		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI perflib\n");
+		return (powernow_acpi_init());
+	}
+
 	etuple = cpuid_eax(0x80000001);
 	etuple &= 0xf00;
 	etuple |= (c->x86_model<<4)|(c->x86_mask);
@@ -488,10 +499,12 @@ static int powernow_decode_bios (int max
 						p+=2;
 				}
 			}
+			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
+			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
+			printk (KERN_INFO PFX "Trying ACPI perflib\n");
 			ret = powernow_acpi_init();
 			if (ret) {
-				printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
-				printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
+				printk (KERN_INFO PFX "ACPI and leagcy methods failed\n");
 				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
 			}
 			return ret;
@@ -576,10 +589,6 @@ static struct cpufreq_driver powernow_dr
 
 static int __init powernow_init (void)
 {
-	if (dmi_broken & BROKEN_CPUFREQ) {
-		printk (KERN_INFO PFX "Disabled at boot time by DMI,\n");
-		return -ENODEV;
-	}
 	if (check_powernow()==0)
 		return -ENODEV;
 	return cpufreq_register_driver(&powernow_driver);



-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
