From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Fri, 4 Jun 2004 17:25:19 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040604152519.GB8490@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
	<20040604095945.GI13782@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040604095945.GI13782@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: davej@redhat.com, Cpufreq@www.linux.org.uk

On Fri, Jun 04, 2004 at 11:59:45AM +0200, Bruno Ducrot wrote:
> On Thu, Jun 03, 2004 at 04:42:22PM -0500, paul.devriendt@amd.com wrote:
> > 
> > > We could kludge around this by doing a compare of the tables before we
> > > abort, and if they are the same, just ignore one of them.
> > > If it differs, we do what we do now.
> > > 
> > > Ideally, this should be fixed in a BIOS update though, or 
> > > alternatively
> > > an ACPI fallback.
> > > 
> > > Paul ?
> > > 
> > > 	Dave
> > 
> > I'm willing to put it in the driver. It is easy to ignore certain
> > table entries (thanks Dominik!), and I already have to do so for
> > the case where BIOSs are filling out unused entries with -1 instead
> > of accurately reporting how many entries actually exist.
> 
> What about doing this kludge in drivers/acpi/processor.c in 
> acpi_processor_get_performance_states() so that all
> drivers will benefit for this?
> 
> Dominik?

Hm. First of all, it looks to be not to be invalid behaviour wrt the ACPI
specification -- even though it doesn't make sense. So, doing this
workaround in drivers/acpi/processor.c would be way more complicated: we'd
need to add a flag "VALID_STATE" [remember, processor.c doesn't know about
frequency table helpers, and I'd like to keep it that way!], check for it in
every ACPI-cpufreq driver [four at the moment], ... -- even though only
_one_ needs such a workaround, AFAICS. And it's really easy in powernow-k8,
AFAICS:




Ignore two identical low freq entries in the ACPI tables for the powernow-k8
driver.

Signed-off-by:	Dominik Brodowski <linux@brodo.de>

--- linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c~	2004-05-26 22:30:43.000000000 +0200
+++ linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-04 17:22:23.959400368 +0200
@@ -734,9 +734,21 @@
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
+			} else
+				cntlofreq = i;
 		}
                                                                                                             
 		if (powernow_table[i].frequency != (data->acpi_data.states[i].core_frequency * 1000)) {
