From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 15:52:08 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414135208.GG8953@poupinou.org>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
	<20040414132854.GE8953@poupinou.org>
	<20040414133117.GI24970@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414133117.GI24970@redhat.com>
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
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 14, 2004 at 02:31:17PM +0100, Dave Jones wrote:
> 
> oops. just send me a patch backing out that bit..
> 

I'm very sorry.  I include the late_initcall btw.  I think it's needed
for ACPI perflib.

--- linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 12:32:12	1.4
+++ linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 13:54:31
@@ -481,13 +481,7 @@ static int powernow_decode_bios (int max
 			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
 			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
 
-			printk (KERN_INFO PFX "Trying ACPI perflib\n");
-			ret = powernow_acpi_init();
-			if (ret) {
-				printk (KERN_INFO PFX "ACPI and legacy methods failed\n");
-				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
-			}
-			return ret;
+			return -EINVAL;
 		}
 		p++;
 	}
@@ -568,7 +562,12 @@ static int __init powernow_cpu_init (str
 	} else {
 		result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
 		if (result) {
+			printk (KERN_INFO PFX "Trying ACPI perflib\n");
 			result = powernow_acpi_init();
+			if (result) {
+				printk (KERN_INFO PFX "ACPI and legacy methods failed\n");
+				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
+			}
 		} else {
 			/* SGTC use the bus clock as timer */
 			latency = fixup_sgtc();
@@ -638,6 +637,6 @@ MODULE_AUTHOR ("Dave Jones <davej@codemo
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");
 
-module_init(powernow_init);
+late_initcall(powernow_init);
 module_exit(powernow_exit);
 

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
