From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] powernow-k7: example use for powernow_acpi_init()
Date: Mon, 22 Mar 2004 09:51:35 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322095135.GD29733@redhat.com>
References: <20040322092543.GN28592@poupinou.org>
	<20040322093851.GO28592@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040322093851.GO28592@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

On Mon, Mar 22, 2004 at 10:38:51AM +0100, Bruno Ducrot wrote:
 > 
 > This is an example for using the powernow-k7 ACPI perflib integration,
 > when the legacy PSB/PST tables are broken.
 > 
 > -			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
 > -			printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
 > -			return -EINVAL;
 > +			ret = powernow_acpi_init();
 > +			if (ret) {
 > +				printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
 > +				printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
 > +				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
 > +			}
 > +			return ret;
 >  		}
 >  		p++;
 >  	}

Looks good, though also mentioning that the acpi fallback failed is probably
a good idea too.

		Dave
