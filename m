From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Protect user from himself
Date: Thu, 6 Jul 2006 15:50:30 -0400
Message-ID: <20060706195030.GP13168@redhat.com>
References: <44A8AD7C.5030402@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44A8AD7C.5030402@interia.pl>
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
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jul 03, 2006 at 07:39:08AM +0200, Rafał Bilski wrote:
 > This patch depens on "Longhaul - Use hardware support".
 > 
 > Older CPU's require transition time >=1ms.
 > Print message for C7 user (this is based on real story).
 > 
 > Signed-off-by: Rafał Bilski <rafalbilski@interia.pl>
 > 
 > ---
 > 
 > --- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c.orig	2006-07-03 06:43:54.000000000 +0200
 > +++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-03 07:33:38.000000000 +0200
 > @@ -633,6 +633,13 @@ static int __init longhaul_cpu_init(stru
 >  		break;
 >  	};
 >  
 > +#if (CONFIG_HZ > 250)
 > +	if (longhaul_version != TYPE_POWERSAVER) {
 > +		printk (KERN_INFO PFX "Timer frequency to high. Aborting\n");
 > +		return -EINVAL;
 > +	}
 > +#endif

This seems wrong.  We should adjust the timings based on HZ to sleep 
for less/more instead.

 > @@ -691,8 +698,9 @@ static int __init longhaul_init(void)
 >  	switch (c->x86_model) {
 >  	case 6 ... 9:
 >  		return cpufreq_register_driver(&longhaul_driver);
 > -	default:
 > -		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\n");
 > +	}
 > +	if (c->x86_model > 9) {
 > +		printk(KERN_INFO PFX "VIA C7 (or better) CPU. Use \"ACPI Processor P-States driver\".\n");

It can also use speedstep-centrino with some additional patches which I
need to dust off.

		Dave

-- 
http://www.codemonkey.org.uk
