From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] [RFC] [2/2] powernow-k7.  Recalibrate cpu_khz.
Date: Thu, 18 Nov 2004 17:12:58 +0100
Message-ID: <20041118161258.GC31422@poupinou.org>
References: <20041118161034.GA31422@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041118161034.GA31422@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

We have to recalibrate cpu_khz in order to use the current FID instead the
max FID since some BIOS do not put the processor at maximum frequency at POST.
Also, some BIOS will change the processor frequency at our back after cpu_khz
was calibrate.  Finally, this will fix a long standing bug when we do something
like this:
# rmmod powernow-k7
# modprobe powernow-k7

Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>

 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

--- linux-2.6.10-rc2/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/11/18 13:32:09	1.1
+++ linux-2.6.10-rc2/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/11/18 15:24:01
@@ -23,6 +23,7 @@
 #include <linux/dmi.h>
 
 #include <asm/msr.h>
+#include <asm/timer.h>
 #include <asm/timex.h>
 #include <asm/io.h>
 #include <asm/system.h>
@@ -586,8 +587,12 @@ static int __init powernow_cpu_init (str
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
-	/* A K7 with powernow technology is set to max frequency by BIOS */
-	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	/* We have to recalibrate cpu_khz unfortunately */
+	result = recalibrate_cpu_khz();
+	if (result)
+		return result;
+
+	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
