From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 updates
Date: Wed, 10 Mar 2004 12:09:41 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040310110941.GC28592@poupinou.org>
References: <20040309214830.GA1240@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040309214830.GA1240@elf.ucw.cz>
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
To: Pavel Machek <pavel@suse.cz>
Cc: patches@x86-64.org, davej@redhat.com, kernel list <linux-kernel@vger.kernel.org>, Cpufreq mailing list <cpufreq@www.linux.org.uk>

On Tue, Mar 09, 2004 at 10:48:31PM +0100, Pavel Machek wrote:
> Hi!
> 
> This adds powernow-k8-acpi driver, which likes on more machines than
> powernow-k8, but depends on acpi. I'd like to get this into
> 2.6.5... Does it look okay?
> 
> Also if you have problems with your eMachines cpufreq, apply this and
> switch to -acpi driver. It should fix it for you.
> 								Pavel
> 
> 
> --- clean/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-02-05 01:53:54.000000000 +0100
> +++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-03-03 23:07:26.000000000 +0100
> @@ -93,6 +93,19 @@
>  	depends on CPU_FREQ && EXPERIMENTAL
>  	help
>  	  This adds the CPUFreq driver for mobile AMD Opteron/Athlon64 processors.
> +	  It relies on old "PST" tables. Unfortunately, many BIOSes get this table
> +	  wrong. 
> +
> +	  For details, take a look at linux/Documentation/cpu-freq. 
> +
> +	  If in doubt, say N.
> +
> +config X86_POWERNOW_K8_ACPI
> +	tristate "AMD Opteron/Athlon64 PowerNow! using ACPI"
> +	depends on CPU_FREQ && EXPERIMENTAL

Why there is no dependency with ACPI here?

...

> --- clean/arch/i386/kernel/cpu/cpufreq/powernow-k8-acpi.c	2004-03-03 12:30:35.000000000 +0100
> +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8-acpi.c	2004-03-06 00:31:44.000000000 +0100
> @@ -0,0 +1,987 @@
> +/*
> + *   (c) 2003, 2004 Advanced Micro Devices, Inc.
> + *  Your use of this code is subject to the terms and conditions of the
> + *  GNU general public license version 2. See COPYING or

...

> +/*
> + * Each processor may have
> + * a different number of entries in its array. I.e., processor 0 may have
> + * 3 pstates, processor 1 may have 5 pstates.
> + */

No.  That will break current ACPI v2.0c specification.  All processors
shall have the same number of states.  More, they have to support the
same set of pairs of frequency/power consuption.

If that is not acceptable by AMD, then you have to contact ACPI SIG
at <http://www.acpi.info/> in order to change specs.

...

For the last time, why on earth you still do not consider the ACPI
perflib.  Links to the cpufreq-developper mailing list with even a kind
of public access have been posted.  That will eliminate the following
functions amongst other things.  Look at drivers/acpi/processor.c

> +static u32 query_ac(void)
> +{
> +	acpi_status rc;
> +	unsigned long state;
> +
> +	if (psrh) {
> +		rc = acpi_evaluate_integer(psrh, NULL, NULL, &state);
> +		if (ACPI_SUCCESS(rc)) {
> +			if (state == 1)
> +				return POW_AC;
> +			else if (state == 0)
> +				return POW_BAT;
> +			else
> +				printk(EFX "psr state %lx\n", state);
> +		}
> +		else {
> +			printk(EFX "error %x evaluating psr\n", rc );
> +		}
> +	}
> +	return POW_UNK;
> +}
> +
> +/* gives us the (optional) battery/thermal restrictions */
> +static int process_ppc(acpi_handle objh)
> +{
> +	acpi_status rc;
> +	unsigned long state;
> +
> +	if (objh) {
> +		ppch = objh;
> +	} else {
> +		if (ppch) {
> +			objh = ppch;
> +		} else {
> +			rstps = 0;
> +			return 0;   
> +		}
> +	}
> +
> +	if (num_online_cpus() > 1) {
> +		/* For future thermal support (next release?), rstps needs   */
> +		/* to be per processor, and handled for the SMP case. Later. */
> +		dprintk(EFX "ignoring attempt to restrict pstates for SMP\n");
> +	}
> +	else {
> +		rc = acpi_evaluate_integer(objh, NULL, NULL, &state);
> +		if (ACPI_SUCCESS(rc)) {
> +			rstps = state & 0x0f;
> +			//dprintk(DFX "pstate restrictions %x\n", rstps);
> +			if (!seenrst)
> +				seenrst = rstps;
> +		}
> +		else {
> +			rstps = 0;
> +			printk(EFX "error %x processing ppc\n", rc);
> +			return -ENODEV;
> +		}
> +	}
> +	return 0;
> +}

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
