From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Sun, 20 Feb 2005 15:53:50 +0100
Message-ID: <20050220145350.GD20702@isilmar.linta.de>
References: <20050220131518.GB4495@inskipp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050220131518.GB4495@inskipp>
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
Cc: cpufreq@lists.linux.org.uk, alex-kernel@digriz.org.uk, davej@redhat.com

On Sun, Feb 20, 2005 at 01:15:18PM +0000, Alexander Clouter wrote:
> +			( !dbs_tuners_ins.ignore_nice
> +			  ? kstat_cpu(j).cpustat.nice : NULL );
NULL is a pointer, 0 is a number. You most probably want "0" here.

> +				( !dbs_tuners_ins.ignore_nice
> +				  ? kstat_cpu(j).cpustat.nice : NULL );
dito.

	Dominik
