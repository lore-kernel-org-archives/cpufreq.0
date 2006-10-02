From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 4/8]cpufreq: acpi-cpufreq: Mark speedstep-centrino ACPI
	as deprecated
Date: Mon, 2 Oct 2006 02:48:04 +0200
Message-ID: <20061002004804.GC17412@isilmar.linta.de>
References: <20061001071143.D16392@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061001071143.D16392@unix-os.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>

Hi,

>  	help
> -	  Use primarily the information provided in the BIOS ACPI tables
> +	  This is deprecated and this functionality is now merged into
> +	  acpi_cpufreq (X86_ACPI_CPUFREQ). Use that driver instead of
> +	  speedstep_centrino.
> +	  Was used primarily the information provided in the BIOS ACPI tables
>  	  to determine valid CPU frequency and voltage pairings.

Even though I'm no expert in the English language, this new sentence ("Was
used ...") looks a bit strange to me - maybe just leave it with "Use" and
only add the paragraph above?

	Dominik
