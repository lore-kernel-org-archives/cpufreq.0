From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] Re: ACPI / cpufreq on Presario R3120
Date: Sat, 5 Jun 2004 15:47:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040605134747.GC9126@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
	<20040604095945.GI13782@poupinou.org>
	<20040604152519.GB8490@dominikbrodowski.de>
	<40C0A99C.3030308@pacific.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40C0A99C.3030308@pacific.edu>
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
To: Ken Hughes <khughes@pacific.edu>
Cc: davej@redhat.com, Bruno Ducrot <ducrot@poupinou.org>, Cpufreq@www.linux.org.uk

On Fri, Jun 04, 2004 at 09:55:56AM -0700, Ken Hughes wrote:
> I patched 2.6.7-rc2 with this, and get this output from the module:
> 
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (versio1.00.09b)
> powernow-k8: invalid freq entries 4294967295 kHz vs. 800000 kHz

Awww. Missed a "continue;" statement in the patch. Updated version attached.

> powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
> powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
> powernow-k8: cpu_init done, current fid 0x8, vid 0x6

So you only get two P-States? Paul, does this look OK?

	Dominik



Ignore two identical low freq entries in the ACPI tables for the powernow-k8
driver.

Signed-off-by:  Dominik Brodowski <linux@brodo.de>

--- linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.original	2004-05-26 22:30:43.000000000 +0200
+++ linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-05 15:44:31.429196000 +0200
@@ -734,9 +734,22 @@
 		}
 
 		/* verify only 1 entry from the lo frequency table */
-		if ((fid < HI_FID_TABLE_BOTTOM) && (cntlofreq++)) {
-			printk(KERN_ERR PFX "Too many lo freq table entries\n");
-			goto err_out;
+		if (fid < HI_FID_TABLE_BOTTOM) {
+			if (cntlofreq) {
+				/* if both entries are the same, ignore this
+				 * one... 
+				 */
+				if ((powernow_table[i].frequency != powernow_table[cntlofreq].frequency) ||
+				    (powernow_table[i].index != powernow_table[cntlofreq].index)) {
+					printk(KERN_ERR PFX "Too many lo freq table entries\n");
+					goto err_out;
+				}
+
+				dprintk(KERN_INFO PFX "double low frequency table entry, ignoring it.\n");
+				powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
+				continue;
+			} else
+				cntlofreq = i;
 		}
                                                                                                             
 		if (powernow_table[i].frequency != (data->acpi_data.states[i].core_frequency * 1000)) {
