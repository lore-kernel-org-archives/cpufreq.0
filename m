From: Henne <henne@nachtwindheim.de>
Subject: Re: cpufreq on Toshiba Portege M100 Laptop
Date: Tue, 17 Jul 2007 18:07:19 +0200
Message-ID: <469CE937.5070301@nachtwindheim.de>
References: <653FFBB4508B9042B5D43DC9E18836F501249977@scsmsx415.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F501249977@scsmsx415.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

Pallipadi, Venkatesh schrieb:
> Hmmm.
> Looks like the new BIOS decided to take away the support for
> Speedstep. Can you look into the BIOS setup menu and check
> whether there are any options to enable speedstep.

There are 3 switches that seem to be related to it:
	Processing Speed: High/Low
	CPU Sleep Mode: Enabled/Disabled
	Cooling Method: Battery optimized/Performance/Maximum Performance

Eventually the option:
	 Device Config.: All Devices/Setup by OS
may have something to do with that, but I think every BIOS does there what it wants.

I tried every possible configuration and made acpidump's, but none worked with cpufreq.

Here's a snippet from Toshiba.com BIOS changelog:

	Change History

	      Version 1.50    09-29-2005
        	  o Applied an Intel-required Pentium-M update.
	          o Re-packaged on 2004-11-30. No BIOS code is changed. If you have already installed BIOS v1.50, there's no 
			need to reinstall.

That could have been it.

Maybe I should try to downgrade to V1.40 if possible, but I first have to make sure
that this doesn't break anything and if this is supported.
