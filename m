From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2/8]cpufreq: acpi-cpufreq: reorganize code to make MSR
	support addition easier
Date: Mon, 2 Oct 2006 02:41:26 +0200
Message-ID: <20061002004126.GA17412@isilmar.linta.de>
References: <20061001070929.B16392@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061001070929.B16392@unix-os.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>

Hi,

On Sun, Oct 01, 2006 at 07:09:29AM -0700, Venkatesh Pallipadi wrote:
> +static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
> +{
> +	struct acpi_cpufreq_data		*data = drv_data[cpu];
> +	unsigned int				freq;
> +
> +	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
> +
> +	if (unlikely(data == NULL ||
> +	             data->acpi_data == NULL ||
> +	             data->freq_table == NULL)) {
> +		return 0;
>  	}
>  
> -	dprintk("Transition successful after %d microseconds\n", i * 10);
> +	freq = extract_freq(get_cur_val(cpumask_of_cpu(cpu)), data);

Does this _finally_ work according to ACPI spec? That you can determine the
current frequency this way?


Other than that, this patch looks fine.

	Dominik
