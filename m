From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] Hardware P-state driver for AMD Opterons, etc.
Date: Sun, 4 Jun 2006 19:18:40 +0200
Message-ID: <20060604171840.GB25345@isilmar.linta.de>
References: <84EA05E2CA77634C82730353CBE3A843053503D0@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843053503D0@SAUSEXMB1.amd.com>
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
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Fri, Jun 02, 2006 at 05:45:24PM -0500, Langsdorf, Mark wrote:
> +static int cpu_family = CPU_OPTERON;

...

> +	if (cpu_family)
> +		return 0;
> +

...

> +	if (cpu_family) {
> +		rdmsr(MSR_PSTATE_STATUS, lo, hi);

...

I'd prefer it if all these if cases would be made explicit:


	if (cpu_family == CPU_OPTERON)

as that makes the code much more readable.


Thanks,
	Dominik
