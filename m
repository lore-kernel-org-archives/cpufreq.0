From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] powernow-k7: stupid bug in a printk introduced
Date: Mon, 22 Mar 2004 13:43:43 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322124343.GQ28592@poupinou.org>
References: <20040322092543.GN28592@poupinou.org>
	<20040322093851.GO28592@poupinou.org>
	<20040322095135.GD29733@redhat.com>
	<20040322123614.GP28592@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040322123614.GP28592@poupinou.org>
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
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

> +static int powernow_acpi_init(void)
> +{
> +	printk(KERN_INFO PFX "no support for ACPI processor found."
> +	       "  Please recompile your kernel with ACPI processor");
                                                                  ^
                                                           seems a \n is
							     needed here
> +	return -EINVAL;
> +}
>  #endif


--- linux-2.6.5-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/22 12:43:46	1.4
+++ linux-2.6.5-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/22 12:44:20
@@ -418,7 +418,7 @@ err0:
 static int powernow_acpi_init(void)
 {
 	printk(KERN_INFO PFX "no support for ACPI processor found."
-	       "  Please recompile your kernel with ACPI processor");
+	       "  Please recompile your kernel with ACPI processor\n");
 	return -EINVAL;
 }
 #endif

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
