From: Andrew Morton <akpm@osdl.org>
Subject: Re: 2.6.11 cpufreq: Device or resource busy
Date: Tue, 8 Mar 2005 23:48:16 -0800
Message-ID: <20050308234816.245f35b4.akpm@osdl.org>
References: <20050308222516.GA20370@carfax.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050308222516.GA20370@carfax.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Hugo Mills <hugo-lkml@carfax.org.uk>
Cc: davej@codemonkey.org.uk, cpufreq@ZenII.linux.org.uk, linux-kernel@vger.kernel.org

Hugo Mills <hugo-lkml@carfax.org.uk> wrote:
>
>    I've just upgraded my laptop (ASUS M3000 -- see below) from 2.6.10
>  to 2.6.11. It now seems to be unable to load the acpi_cpufreq module:
> 
>  hrm@joshua:hrm $ sudo modprobe acpi-cpufreq
>  FATAL: Error inserting acpi_cpufreq (/lib/modules/2.6.11-plain/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): Device or resource busy

Presumably there's already a cpufreq driver regisered when you try to load
the acpi_cpufreq module.

If you can work out how to enable cpufreq debugging, then do so.  Or apply
the below patch, see what driver is being registered.

--- 25/drivers/cpufreq/cpufreq.c~a	2005-03-08 23:45:21.000000000 -0800
+++ 25-akpm/drivers/cpufreq/cpufreq.c	2005-03-08 23:45:28.000000000 -0800
@@ -1351,7 +1351,7 @@ int cpufreq_register_driver(struct cpufr
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
 		return -EINVAL;
 
-	dprintk("trying to register driver %s\n", driver_data->name);
+	printk("trying to register driver %s\n", driver_data->name);
 
 	if (driver_data->setpolicy)
 		driver_data->flags |= CPUFREQ_CONST_LOOPS;
_
