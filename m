From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH >=2.6.4] single-line,
	but KERN_WARNING message in p4-clockmod
Date: Sat, 14 Feb 2004 16:41:42 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040214164142.GA29606@redhat.com>
References: <20040214160105.GA7747@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040214160105.GA7747@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Sat, Feb 14, 2004 at 05:01:05PM +0100, Dominik Brodowski wrote:
 > As Pavel Machek told me, a single line warning is better, and KERN_DEBUG might
 > be missed if reading from /var/log/messages.
 > 
 >  arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |    8 ++------
 >  1 files changed, 2 insertions(+), 6 deletions(-)
 > 
 > diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
 > --- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-13 17:09:58.000000000 +0100
 > +++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-14 16:51:47.012905264 +0100
 > @@ -181,9 +181,7 @@
 >  {
 >  	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
 >  		/* Pentium M */
 > -		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
 > -		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
 > -		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
 > +		printk(KERN_WARNING PFX "Warning: Pentium M detected. The speedstep_centrino module offers voltage scaling in addition of frequency scaling. You should use that instead of p4-clockmod, if possible.\n");
 >  		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
 >  	}
 >  
 > @@ -193,9 +191,7 @@
 >  	}
 >  
 >  	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
 > -		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
 > -		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
 > -		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
 > +		printk(KERN_WARNING PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq modules offers voltage scaling in addition of frequency scaling. You should use either one instead of p4-clockmod, if possible.\n");
 >  		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
 >  	}

I'd rather keep them multi-line in the source. It looks a lot more readable than just
one line IMHO. I've no objection to killing off the \n's though.

	Dave
