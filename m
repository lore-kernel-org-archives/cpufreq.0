From: Tony Lindgren <tony@atomide.com>
Subject: Re: powernow-k8-buggy-bios-override-for-266.patch
Date: Thu, 13 May 2004 08:19:45 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040513151945.GA8480@atomide.com>
References: <20040513144721.GA8015@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040513144721.GA8015@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, akpm@osdl.org, cpufreq@www.linux.org.uk, pavel@ucw.cz

* Dominik Brodowski <linux@dominikbrodowski.de> [040513 07:51]:
> Tony,
> 
> Can you post such patches on the cpufreq mailing list
> (cpufreq@www.linux.org.uk) too, in future, please?

Oops, sorry, will do.

> > This patch should be safe to apply, even if Pavel's ACPI table check is
> > added to the driver.
> 
> Which check? I thought the powernow-k8 driver is quite up to date, Pavel?

Hmmm, maybe it's integrated already? Have to check. But the driver by
default does not work for me.

> -	if (query_current_values_with_pending_wait(data)) {
> -		kfree(powernow_table);
> -		return -EIO;
> -	}
> -
> 
> Why do you remove this check?

Just moved it a bit earlier in the code as the values are needed earlier :)

Regards,

Tony
