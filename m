From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Thu, 23 Oct 2003 16:17:04 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031023141703.GG643@openzaurus.ucw.cz>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>

Hi!

> Patch 3/3: New dynamic cpufreq driver (called 
> DemandBasedSwitch driver), which periodically monitors CPU 
> usage and changes the CPU frequency based on the demand.
> 
> diffstat dbs3.patch 
> drivers/cpufreq/Kconfig       |   25 ++++
> drivers/cpufreq/Makefile      |    1 
> drivers/cpufreq/cpufreq_dbs.c |  214
> 
Could you name it cpufreq_demand? We have enough
TLAs as is.
				Pavwl


-- 
				Pavel
Written on sharp zaurus, because my Velo1 broke. If you have Velo you don't need...
