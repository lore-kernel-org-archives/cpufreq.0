From: Ken Hughes <khughes@pacific.edu>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Fri, 04 Jun 2004 09:55:56 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40C0A99C.3030308@pacific.edu>
References: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>	<20040604095945.GI13782@poupinou.org>
	<20040604152519.GB8490@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040604152519.GB8490@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, Bruno Ducrot <ducrot@poupinou.org>, Cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

> Ignore two identical low freq entries in the ACPI tables for the powernow-k8
> driver.
> 
> Signed-off-by:	Dominik Brodowski <linux@brodo.de>
> 
> --- linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c~	2004-05-26 22:30:43.000000000 +0200
> +++ linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-04 17:22:23.959400368 +0200
> @@ -734,9 +734,21 @@
>  		}
>  
>  		/* verify only 1 entry from the lo frequency table */
> -		if ((fid < HI_FID_TABLE_BOTTOM) && (cntlofreq++)) {
> -			printk(KERN_ERR PFX "Too many lo freq table entries\n");
> -			goto err_out;
> +		if (fid < HI_FID_TABLE_BOTTOM) {
> +			if (cntlofreq) {
> +				/* if both entries are the same, ignore this
> +				 * one... 
> +				 */
> +				if ((powernow_table[i].frequency != powernow_table[cntlofreq].frequency) ||
> +				    (powernow_table[i].index != powernow_table[cntlofreq].index)) {
> +					printk(KERN_ERR PFX "Too many lo freq table entries\n");
> +					goto err_out;
> +				}
> +
> +				dprintk(KERN_INFO PFX "double low frequency table entry, ignoring it.\n");
> +				powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
> +			} else
> +				cntlofreq = i;
>  		}
>                                                                                                              
>  		if (powernow_table[i].frequency != (data->acpi_data.states[i].core_frequency * 1000)) {
> 

I patched 2.6.7-rc2 with this, and get this output from the module:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (versio1.00.09b)
powernow-k8: invalid freq entries 4294967295 kHz vs. 800000 kHz
powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
powernow-k8: cpu_init done, current fid 0x8, vid 0x6

Seems to be working OK.  Thanks for everyone's help.

Ken
