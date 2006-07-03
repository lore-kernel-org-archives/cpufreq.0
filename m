From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - There are limits
Date: Mon, 3 Jul 2006 10:11:48 -0400
Message-ID: <20060703141148.GK14292@redhat.com>
References: <44A8A894.7020907@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44A8A894.7020907@interia.pl>
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

On Mon, Jul 03, 2006 at 07:18:12AM +0200, Rafał Bilski wrote:
 > Changes in Kconfig:
 > 1. ACPI_PROCESSOR - next patch need ACPI C3 state working,
 > 2. !X86_UP_APIC - (un)patched "longhaul" isn't APIC compatible,
 > 3. !SMP - (un)patched "longhaul" isn't SMP compatible. First 
 > step would be APIC support. Second - per CPU private data.
 > 
 > Signed-off-by: Rafał Bilski <rafalbilski@interia.pl>
 > 
 > ---
 > 
 > --- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/Kconfig.orig	2006-06-18 03:49:35.000000000 +0200
 > +++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-07-02 19:48:40.000000000 +0200
 > @@ -202,7 +202,7 @@ config X86_LONGRUN
 >  config X86_LONGHAUL
 >  	tristate "VIA Cyrix III Longhaul"
 >  	select CPU_FREQ_TABLE
 > -	depends on BROKEN
 > +	depends on !SMP && !X86_UP_APIC && ACPI_PROCESSOR
 >  	help
 >  	  This adds the CPUFreq driver for VIA Samuel/CyrixIII,
 >  	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T

It's not unfeasible for an SMP kernel to be run on UP hardware,
(and several distros are shipping SMP kernels as default)
so I'm in two minds about removing the !SMP check, and making it be a

	if (num_online_cpus() > 1)
		return -ENODEV;

in the init routine.

Thoughts?

		Dave

-- 
http://www.codemonkey.org.uk
