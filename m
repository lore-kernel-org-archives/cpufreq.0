From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Implementation of fast-up algorithm in ondemand governor
Date: Thu, 6 Nov 2003 07:50:00 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031106065000.GA4188@brodo.de>
References: <CFF522B18982EA4481D3A3E23B83141C24B53F@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <CFF522B18982EA4481D3A3E23B83141C24B53F@orsmsx407.jf.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Moore, Robert" <robert.moore@intel.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Nov 05, 2003 at 02:34:07PM -0800, Moore, Robert wrote:
> 
> 
> Will this simple change implement the fast-up algorithm correctly?

"the" fast-up algorithm? Well, it surely _is_ a fast-up algorithm what you
propose:


> -	if (idle_ticks < (DBS_RATE / 5))
> -		cpufreq_driver_target(cpu_dbs_info[cpu].cur_policy,
> -			cpu_dbs_info[cpu].cur_policy->cur + 1, 
> -			CPUFREQ_RELATION_L);
> 
> +	if (idle_ticks < (DBS_RATE / 5))
> +		cpufreq_driver_target(cpu_dbs_info[cpu].cur_policy,
> +			cpu_dbs_info[cpu].cur_policy->max, 
> +			CPUFREQ_RELATION_L);		

However, please set CPUFREQ_RELATION_H here -- you don't want to go higher
than cur_policy->max.

	Dominik
