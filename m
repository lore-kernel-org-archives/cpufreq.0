From: Ben Kevan <ben.kevan@gmail.com>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable	Enchanced
	SpeedStep
Date: Sat, 24 Jun 2006 11:03:54 -0700
Message-ID: <200606241103.54533.ben.kevan@gmail.com>
References: <200606191610.40597.ben.kevan@gmail.com>
	<200606201332.01928.ben.kevan@gmail.com>
	<20060622175907.GD10138@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060622175907.GD10138@dominikbrodowski.de>
Content-Disposition: inline
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk, Jeremy Fitzhardinge <jeremy@goop.org>, Bruno Ducrot <ducrot@poupinou.org>

I was able to fix the problem by sending the UNIT to a Toshiba dealer, and 
they had to re-write the microde once it was rewritten I could do the 
following"

bkevan@LSHESU01004839:~> dmesg | grep Microcode
IA-32 Microcode Update Driver: v1.14 <tigran@veritas.com>
IA-32 Microcode Update Driver v1.14 unregistered

And see that the Microcode driver worked, and am now able to run cpufreq-info 
and also modprobe speedstep-centrino etc. 

Thank you ALL for your help. 

Ben


On Thursday 22 June 2006 10:59, Dominik Brodowski wrote:
> Hi,
>
> On Tue, Jun 20, 2006 at 01:32:01PM -0700, Ben Kevan wrote:
> > speedstep-centrino: P1 has larger frequency (65535) than P0 (600),
> > skipping speedstep-centrino: P2 has larger frequency (65535) than P0
> > (600), skipping speedstep-centrino: P3 has larger frequency (65535) than
> > P0 (600), skipping speedstep-centrino: P4 has larger frequency (65535)
> > than P0 (600), skipping speedstep-centrino: P5 has larger frequency
> > (65535) than P0 (600), skipping speedstep-centrino: P6 has larger
> > frequency (65535) than P0 (600), skipping speedstep-centrino: P7 has
> > larger frequency (65535) than P0 (600), skipping speedstep-centrino: P8
> > has larger frequency (65535) than P0 (600), skipping speedstep-centrino:
> > P9 has larger frequency (65535) than P0 (600), skipping
> > speedstep-centrino: P10 has larger frequency (65535) than P0 (600),
> > skipping speedstep-centrino: P11 has larger frequency (65535) than P0
> > (600), skipping speedstep-centrino: P12 has larger frequency (65535) than
> > P0 (600), skipping speedstep-centrino: P13 has larger frequency (65535)
> > than P0 (600), skipping speedstep-centrino: P14 has larger frequency
> > (65535) than P0 (600), skipping speedstep-centrino: P15 has larger
> > frequency (65535) than P0 (600), skipping speedstep-centrino: adding
> > state 0 with frequency 600000 and control value 0610 speedstep-centrino:
> > adding state 1 with frequency 0 and control value ffff
> > speedstep-centrino: adding state 2 with frequency 0 and control value
> > ffff speedstep-centrino: adding state 3 with frequency 0 and control
> > value ffff speedstep-centrino: adding state 4 with frequency 0 and
> > control value ffff speedstep-centrino: adding state 5 with frequency 0
> > and control value ffff speedstep-centrino: adding state 6 with frequency
> > 0 and control value ffff speedstep-centrino: adding state 7 with
> > frequency 0 and control value ffff speedstep-centrino: adding state 8
> > with frequency 0 and control value ffff speedstep-centrino: adding state
> > 9 with frequency 0 and control value ffff speedstep-centrino: adding
> > state 10 with frequency 0 and control value ffff speedstep-centrino:
> > adding state 11 with frequency 0 and control value ffff
> > speedstep-centrino: adding state 12 with frequency 0 and control value
> > ffff speedstep-centrino: adding state 13 with frequency 0 and control
> > value ffff speedstep-centrino: adding state 14 with frequency 0 and
> > control value ffff speedstep-centrino: adding state 15 with frequency 0
> > and control value ffff
>
> As ACPI initialization succeeded, we didn't fall back to use the table.
> Does this patch help?
>
>
> [PATCH] speedstep_centrino: only use ACPI if it offers more than one state
>
> Fall back to hard-coded tables in speedstep_centrino if ACPI only tells us
> about one valid state.
>
> Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
>
> diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
> b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c index ce54ff1..5818d24
> 100644
> --- a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
> +++ b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
> @@ -365,6 +365,7 @@ static int centrino_cpu_init_acpi(struct
>  	unsigned long			cur_freq;
>  	int				result = 0, i;
>  	unsigned int			cpu = policy->cpu;
> +	unsigned int			states = 0;
>
>  	/* register with ACPI core */
>  	if (acpi_processor_register_performance(&p, cpu)) {
> @@ -452,6 +453,13 @@ static int centrino_cpu_init_acpi(struct
>
>  		if (cur_freq == centrino_model[cpu]->op_points[i].frequency)
>  			p.state = i;
> +
> +		states++;
> +	}
> +
> +	if (states <= 1) {
> +		result = -ENODEV;
> +		goto err_kfree_all;
>  	}
>
>  	/* notify BIOS that we exist */
