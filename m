From: Dmitry Torokhov <dtor_core@ameritech.net>
Subject: Re: [PATCH] fix cpufreq_update_policy
Date: Wed, 28 Jan 2004 17:12:30 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <200401281712.30477.dtor_core@ameritech.net>
References: <20040128215249.GA4727@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040128215249.GA4727@dominikbrodowski.de>
Content-Disposition: inline
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Wednesday 28 January 2004 04:52 pm, Dominik Brodowski wrote:
> Fix a brown paper bug in drivers/cpufreq/cpufreq.c which accessed
> random memory instead of the correct struct.
>
> Please apply,
>
> diff -ruN linux-original/drivers/cpufreq/cpufreq.c
> linux/drivers/cpufreq/cpufreq.c ---
> linux-original/drivers/cpufreq/cpufreq.c	2004-01-16 20:30:59.000000000
> +0100 +++ linux/drivers/cpufreq/cpufreq.c	2004-01-28 22:16:38.099398456
> +0100 @@ -868,7 +868,7 @@
>  	down(&data->lock);
>
>  	memcpy(&policy,
> -	       &data,
> +	       data,
>  	       sizeof(struct cpufreq_policy));
>  	policy.min = data->user_policy.min;
>  	policy.max = data->user_policy.max;

Why not change it to:

	policy = *data;

?

-- 
Dmitry
