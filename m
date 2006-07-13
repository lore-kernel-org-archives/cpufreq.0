From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Only for "Powersaver"
Date: Thu, 13 Jul 2006 02:27:23 -0400
Message-ID: <20060713062723.GB12807@redhat.com>
References: <44B5E0DD.9090109@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44B5E0DD.9090109@interia.pl>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Thu, Jul 13, 2006 at 07:57:49AM +0200, Rafa=C5=82 Bilski wrote:
 > Looks like ACPI C3 don't work with older VIA CPUs. Motherboard is=20
 > ACPI C3 capable, but after C3 frequency is same as before.
 > So this patch below will make "longhaul" fail for older CPU's.
 > There is nothing what I can do to fix this. Looks like CPU with=20
 > BCR2 MSR is changing frequency only on halt. Processor with=20
 > Longhaul MSR is changing frequency on halt or ACPI C3.
 > Btw typo fixes.

Falling back to what we did in 2.6.17 for BCR2 systems may
get some of those working at least.  The whole notion of tying the
longhaul driver closely to acpi makes me nervous, as a lot of
those socket-370 boards have _dreadful_ ACPI BIOS implementations,
and in a large number of cases, will lack the necessary functionality
needed, as socket 370 Celerons were boring and had no fancy power
saving features to run in C3.

I really need to find time to dig out some of those old test systems, but t=
hat
won't happen now until after kernel summit/OLS/vacation.

 > @@ -627,7 +627,9 @@ static int __init longhaul_cpu_init(stru
 >  	switch (longhaul_version) {
 >  	case TYPE_LONGHAUL_V1:
 >  	case TYPE_LONGHAUL_V2:
 > -		printk ("Longhaul v%d supported.\n", longhaul_version);
 > +//		printk ("Longhaul v%d supported.\n", longhaul_version);
 > +		printk(KERN_ERR PFX "Processor don't support ACPI. Aborting.\n");

It's really a BIOS failing. The CPU cares nothing about how it's driven,
but if the DSDT lacks methods to do anything interesting, nothing happens.

 > @@ -691,8 +693,8 @@ static int __init longhaul_init(void)
 > =20
 >  #ifdef CONFIG_SMP
 >  	if (num_online_cpus() > 1) {
 > -		return -ENODEV;
 >  		printk(KERN_ERR PFX "More than 1 CPU detected, longhaul disabled.\n");
 > +		return -ENODEV;

Applied this bit, but the other bit I need to think about some more.

		Dave

--=20
http://www.codemonkey.org.uk
