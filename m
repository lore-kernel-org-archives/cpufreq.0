From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Help! Cpufreq makes my laptop crash!
Date: Thu, 15 Jul 2004 16:30:28 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040715143028.GR6326@poupinou.org>
References: <40F549D5.8030100@fuckup.homelinux.com>
	<20040714115717.4gsocksks0s8o4wc@carlthompson.net>
	<40F58B6C.60606@fuckup.homelinux.com>
	<20040714140944.g0k8c40swcskss8g@carlthompson.net>
	<20040715095710.GN6326@poupinou.org>
	<40F68E0D.8000307@fuckup.homelinux.com>
	<20040715140507.GP6326@poupinou.org>
	<20040715141904.GQ6326@poupinou.org>
	<40F69343.6000908@fuckup.homelinux.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40F69343.6000908@fuckup.homelinux.com>
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
To: olgaAr <olgaAr@fuckup.homelinux.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Jul 15, 2004 at 04:22:59PM +0200, olgaAr wrote:
> Bruno Ducrot wrote:
> 
> >Compile it as a module in fact, then 'modprobe processor' after your
> >testings (or after 30 minutes).
> >A mobile AMD athlon XP without the ACPI idle loop could potentially
> >overheat fast...
> >
> >Cheers,
> >
> > 
> >
> Well, I had it compiled as module before. I already tried unloading 
> powernow_k7, thermal and processor. When reloading powernow_k7, the 
> "processor" module was reloaded as well?!
> 

Yes.  This patch should fix that.  Sorry...
PS: this will never go to mainline.  It's only for testing purpose.

--- linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/07/15 14:24:42	1.4
+++ linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/07/15 14:26:19
@@ -28,7 +28,7 @@
 #include <asm/io.h>
 #include <asm/system.h>
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#if defined(CONFIG_ACPI_PROCESSOR)
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 #endif
@@ -63,7 +63,7 @@ struct pst_s {
 	u8 numpstates;
 };
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#if defined(CONFIG_ACPI_PROCESSOR)
 union powernow_acpi_control_t {
 	struct {
 		unsigned long fid:5,
@@ -293,7 +293,7 @@ static void change_speed (unsigned int i
 }
 
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#if defined(CONFIG_ACPI_PROCESSOR)
 
 struct acpi_processor_performance *acpi_processor_perf;
 
@@ -644,7 +644,7 @@ static int __init powernow_init (void)
 
 static void __exit powernow_exit (void)
 {
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#if defined(CONFIG_ACPI_PROCESSOR)
 	if (acpi_processor_perf) {
 		acpi_processor_unregister_performance(acpi_processor_perf, 0);
 		kfree(acpi_processor_perf);

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
