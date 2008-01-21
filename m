From: "Akinobu Mita" <mita@fixstars.com>
Subject: Re: [Cbe-oss-dev] Subject: cell: add spu aware cpufreq governor
Date: Mon, 21 Jan 2008 12:09:23 +0900 (JST)
Message-ID: <60952.202.227.43.1.1200884963.squirrel@m.fixstars.com>
References: <20080118171119.3faa4a6a@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080118171119.3faa4a6a@de.ibm.com>
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
To: Christian Krafft <krafft@de.ibm.com>
Cc: cpufreq@lists.linux.org.uk, cbe-oss-dev@ozlabs.org

> +/*
> + * module init and destoy
> + */
> +
> +static int __init spu_gov_init(void)
> +{
> +if (!machine_is(cell))
> +return -ENODEV;
> +
> +kspugov_wq = create_workqueue("kspugov");
> +if (!kspugov_wq) {
> +printk(KERN_ERR "creation of kspugov failed\n");
> +return -EFAULT;
> +}
> +
> +return cpufreq_register_governor(&spu_governor);

Missing an error handling. This line should be something like:

    err = cpufreq_register_governor(&spu_governor);
    if (err) {
        destroy_workqueue(kspugov_wq);
        return err;
    }

    return 0;

It seems like this is copied from drivers/cpufreq/cpufreq_governor.c
Althought this is not big problem, it would be nice to fix as well.

> +}
