From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] cpufreq_(ondemand|conservative)
Date: Sat, 29 Jan 2005 21:00:20 +0100
Message-ID: <20050129200020.GA9542@dominikbrodowski.de>
References: <20050123150000.GA3888@inskipp>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050123150000.GA3888@inskipp>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Clouter <alex@digriz.org.uk>
Cc: cpufreq@lists.linux.org.uk

concerning patch #1:

On Sun, Jan 23, 2005 at 03:00:01PM +0000, Alexander Clouter wrote:
> @@ -398,10 +455,10 @@
>  		
>  			j_dbs_info->prev_cpu_idle_up = 
>  				kstat_cpu(j).cpustat.idle +
> -				kstat_cpu(j).cpustat.iowait;
> -			j_dbs_info->prev_cpu_idle_down = 
> -				kstat_cpu(j).cpustat.idle +
> -				kstat_cpu(j).cpustat.iowait;
> +				kstat_cpu(j).cpustat.iowait +
> +				kstat_cpu(j).cpustat.nice;

Why are you adding cpustat.nice here unconditionally? You don't do so in the
sysfs write method, so I assume you should make this dependant on 
ignore_nice here as well.

	Dominik
