From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Problem powernow an Athlon 2600+ XP[solved]
Date: Thu, 27 May 2004 12:28:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040527102805.GR4933@poupinou.org>
References: <6db520449336f134fa4831d9de3965b7@82.49.140.94>
	<20040527092838.GQ4933@poupinou.org>
	<20040527093942.GA8235@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040527093942.GA8235@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk
Cc: davej@redhat.com

On Thu, May 27, 2004 at 11:39:42AM +0200, Dominik Brodowski wrote:
> On Thu, May 27, 2004 at 11:28:38AM +0200, Bruno Ducrot wrote:
> > On Wed, May 26, 2004 at 11:42:38PM +0200, Forcarlo wrote:
> > > "powernow_k7.powernow_acpi_force=1", "powernow_k7.acpi_force=1" don't work.
> 
> BTW, how about avoiding the double "powernow" in the module parameter? The
> description
> MODULE_PARM_DESC(acpi_force, "Force ACPI to be used");
> 
> also only mentions "acpi_force" instead of "powernow_acpi_force".

You are indeed correct..

--- arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/05/19 15:50:50	1.1
+++ arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/05/27 10:25:23
@@ -95,7 +95,7 @@
  * configuration purpose.
  */
 
-static int powernow_acpi_force;
+static int acpi_force;
 
 static struct cpufreq_frequency_table *powernow_table;
 
@@ -558,7 +558,7 @@
 	}
 	dprintk(KERN_INFO PFX "FSB: %3d.%03d MHz\n", fsb/1000, fsb%1000);
 
-	if ((dmi_broken & BROKEN_CPUFREQ) || powernow_acpi_force) {
+	if ((dmi_broken & BROKEN_CPUFREQ) || acpi_force) {
 		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
 		result = powernow_acpi_init();
 	} else {
@@ -638,7 +638,7 @@
 		kfree(powernow_table);
 }
 
-module_param(powernow_acpi_force,  int, 0444);
+module_param(acpi_force,  int, 0444);
 
 MODULE_PARM_DESC(acpi_force, "Force ACPI to be used");
 


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
