From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2/8]cpufreq: acpi-cpufreq: reorganize code to make MSR
	support addition easier
Date: Tue, 3 Oct 2006 01:21:51 +0200
Message-ID: <20061002232151.GB29320@isilmar.linta.de>
References: <EB12A50964762B4D8111D55B764A8454ABC262@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454ABC262@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>

On Mon, Oct 02, 2006 at 04:04:25PM -0700, Pallipadi, Venkatesh wrote:
> >On Sun, Oct 01, 2006 at 07:09:29AM -0700, Venkatesh Pallipadi wrote:
> >> +static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
> >> +{
> >> +	struct acpi_cpufreq_data		*data = drv_data[cpu];
> >> +	unsigned int				freq;
> >> +
> >> +	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
> >> +
> >> +	if (unlikely(data == NULL ||
> >> +	             data->acpi_data == NULL ||
> >> +	             data->freq_table == NULL)) {
> >> +		return 0;
> >>  	}
> >>  
> >> -	dprintk("Transition successful after %d 
> >microseconds\n", i * 10);
> >> +	freq = extract_freq(get_cur_val(cpumask_of_cpu(cpu)), data);
> >
> >Does this _finally_ work according to ACPI spec? That you can 
> >determine the
> >current frequency this way?
> >
> >
> 
> Nope. ACPI spec only goes to say you can check whether transitions was
> successful or not by looking at the status. 

Then this might get us all sorts of strange results if using the IO methods
in the acpi-cpufreq driver?

	Dominik
