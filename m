From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] cpufreq_(ondemand|conservative)
Date: Fri, 4 Feb 2005 21:39:08 +0100
Message-ID: <20050204203908.GC8049@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB6003E65CFF@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6003E65CFF@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, Alexander Clouter <alex@digriz.org.uk>

On Mon, Jan 31, 2005 at 03:40:24PM -0800, Pallipadi, Venkatesh wrote:
> >> > @@ -398,10 +455,10 @@
> >> >  		
> >> >  			j_dbs_info->prev_cpu_idle_up = 
> >> >  				kstat_cpu(j).cpustat.idle +
> >> > -				kstat_cpu(j).cpustat.iowait;
> >> > -			j_dbs_info->prev_cpu_idle_down = 
> >> > -				kstat_cpu(j).cpustat.idle +
> >> > -				kstat_cpu(j).cpustat.iowait;
> >> > +				kstat_cpu(j).cpustat.iowait +
> >> > +				kstat_cpu(j).cpustat.nice;
> >> 
> >> Why are you adding cpustat.nice here unconditionally? You 
> >don't do so in the
> >> sysfs write method, so I assume you should make this dependant on 
> >> ignore_nice here as well.
> >> 
> >Well by default 'ignore_nice = 0' so is there a need?  Look in 
> >the next hunk.
> >
> 
> Probably it is better idea to have a if, even if the default is 0, as
> If we change the default in future, we don't have to look for all these
> dependent changes.

AFAICS we _do_ need it, as prev_cpu_idle_up is calculated
	idle time +
	iowait time +
	(ignore_nice ? ignore time : NULL)
in many other places.

	Dominik
