From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [PATCH >=2.6.4] single-line,
	but KERN_WARNING message in p4-clockmod
Date: Sat, 14 Feb 2004 18:29:50 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040214182950.C16829@flint.arm.linux.org.uk>
References: <20040214160105.GA7747@dominikbrodowski.de>
	<20040214164142.GA29606@redhat.com>
	<20040214182330.GA5097@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040214182330.GA5097@dominikbrodowski.de>;
	from linux@dominikbrodowski.de on Sat, Feb 14, 2004 at 07:23:30PM
	+0100
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
To: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Sat, Feb 14, 2004 at 07:23:30PM +0100, Dominik Brodowski wrote:
>  	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
>  		/* Pentium M */
> -		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
> -		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
> -		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
> +		printk(KERN_WARNING PFX "Warning: Pentium M detected. ");
> +		printk("The speedstep_centrino module offers voltage scaling");
> +		printk(" in addition of frequency scaling. You should use ");
> +		printk("that instead of p4-clockmod, if possible.\n");

I think that's a lot worse for one major reason - you loose the atomicity
of printk() if you do that, especially if you use serial console.

I haven't seen this done anywhere else in the kernel... lets not start
doing it now.

		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
		       "The speedstep_centrino module offers voltage scaling "
		       "in addition of frequency scaling. You should use "
		       "that instead of p4-clockmod, if possible.\n");

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
