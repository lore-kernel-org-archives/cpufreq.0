From: Ari Pollak <ajp@aripollak.com>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Wed, 25 Aug 2004 09:46:42 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <cgi57v$pga$1@sea.gmane.org>
References: <84EA05E2CA77634C82730353CBE3A8439913D5@SAUSEXMB1.amd.com>
	<20040825093156.GM29560@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040825093156.GM29560@poupinou.org>
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
To: cpufreq@www.linux.org.uk

Thanks! I just tried this patch out and it seems to work properly:
ACPI: Processor [CPU1] (supports C1)
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x2 (1500 mV)
powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x6 (1400 mV)
powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8: cpu_init done, current fid 0xc, vid 0x2

Unfortunately, bumping the CPU speed down to 1 GHz doesn't seem to make 
the CPU run any cooler or the CPU fan run any slower :(

> 
> --- linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004/08/24 13:49:16	1.1
> +++ linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004/08/25 11:01:56
> @@ -47,6 +47,9 @@
>  
>  static struct powernow_k8_data *powernow_data[NR_CPUS];
>  
> +
> +#define OVERRIDE_MAX (3)
> +
>  /* Return a frequency in MHz, given an input fid */
>  static u32 find_freq_from_fid(u32 fid)
>  {
> @@ -794,6 +797,68 @@
>  static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, unsigned int index) { return; }
>  #endif /* CONFIG_X86_POWERNOW_K8_ACPI */
>  
> +static int powernow_k8_cpu_init_override(struct powernow_k8_data *data)
> +{
> +	struct cpufreq_frequency_table *powernow_table;
> +	u32 fid, vid;
> +
> +	/* fill in data->powernow_table */
> +	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table)
> +		* (OVERRIDE_MAX + 1)), GFP_KERNEL);
> +	if (!powernow_table) {
> +		dprintk(KERN_ERR PFX "powernow_table memory alloc failure\n");
> +		goto err_out;
> +	}
> +
> +	/* 2000 GHz  1.50V */
> +	fid = 0xc;
> +	vid = 2;
> +	dprintk(KERN_INFO PFX "   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
> +	powernow_table[0].index = fid; /* lower 8 bits */
> +	powernow_table[0].index |= (vid << 8); /* upper 8 bits */
> +	powernow_table[0].frequency = find_khz_freq_from_fid(fid);
> +
> +	/* 1800 GHz  1.40V */
> +	fid = 0xa;
> +	vid = 6;
> +	dprintk(KERN_INFO PFX "   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
> +	powernow_table[1].index = fid; /* lower 8 bits */
> +	powernow_table[1].index |= (vid << 8); /* upper 8 bits */
> +	powernow_table[1].frequency = find_khz_freq_from_fid(fid);
> +
> +	/* 1000 GHz  1.10V */
> +	fid = 0x2;
> +	vid = 0x12;
> +	dprintk(KERN_INFO PFX "   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
> +	powernow_table[2].index = fid; /* lower 8 bits */
> +	powernow_table[2].index |= (vid << 8); /* upper 8 bits */
> +	powernow_table[2].frequency = find_khz_freq_from_fid(fid);
> +
> +	powernow_table[3].index = 0;
> +	powernow_table[3].frequency = CPUFREQ_TABLE_END;
> +
> +	data->powernow_table = powernow_table;
> +
> +	/* fill in data */
> +	data->numps = 3;
> +	data->irt = 3;
> +	data->rvo = 2;
> +	data->plllock = 2;
> +	data->vidmvs = 1;
> +	data->vstable = 5;
> +	data->acpi_data.state_count = 0;
> +	print_basics(data);
> +	return 0;
> +
> +err_out:
> +	/*acpi_processor_unregister_performance(&data->acpi_data, data->cpu);*/
> +
> +	/* data->acpi_data.state_count informs us at ->exit() whether ACPI was used */
> +	data->acpi_data.state_count = 0;
> +
> +	return -ENODEV;
> +}
> +
>  /* Take a frequency, and issue the fid/vid transition command */
>  static int transition_frequency(struct powernow_k8_data *data, unsigned int index)
>  {
> @@ -942,6 +1007,13 @@
>  
>  	data->cpu = pol->cpu;
>  
> +	if (powernow_k8_cpu_init_override(data)) {
> +		printk(KERN_ERR PFX "Oops, can't override the powernow table for cpu %d\n", pol->cpu);
> +		kfree(data);
> +		return -ENODEV;
> +	} else
> +		goto the_next;
> +
>  	if (powernow_k8_cpu_init_acpi(data)) {
>  		/*
>  		 * Use the PSB BIOS structure. This is only availabe on
> @@ -964,6 +1036,7 @@
>  			return -ENODEV;
>  		}
>  	}
> +the_next:
>  
>  	/* only run on specific CPU from here on */
>  	oldmask = current->cpus_allowed;
> 
> 
> 
> 
> Cheers,
> 
