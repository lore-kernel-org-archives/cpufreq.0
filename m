From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: longhaul
Date: Wed, 13 Apr 2005 16:49:06 +0200
Message-ID: <20050413144906.GS2298@poupinou.org>
References: <3EFE14A8A1A82D4BB867A48A01A88ED708A08A@waglmb01.labs.agilent.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3EFE14A8A1A82D4BB867A48A01A88ED708A08A@waglmb01.labs.agilent.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ken_staton@agilent.com
Cc: cpufreq@lists.linux.org.uk

On Mon, Apr 11, 2005 at 10:46:56PM -0700, ken_staton@agilent.com wrote:
> 
> here's a partial fix for longhaul on a nehemiah c3-2.
> 
> the code in do_powersaver() is significantly changed.
> 
> frequency changes occur after the HLT instruction and there must
> be more than 20 usec between HLT and the interrupt that brings
> the cpu out of HLT. the only interrupt you have any chance of controlling
> is the timer interrupt.

Do you have any pointer about this statement?

> 
> the algorithm for this:
> 
> 1. disable all interrupts
> 2. mask all interrupts off except timer (irq0)
> 3. enable interrupts (i.e. just irq0)
> 4. HLT (so we know we've just had a tick before changing the MSR)
> 5. write the MSR
> 6. HLT (this changes the frequency)
> 7. disable all interrupts
> 8. restore the original interrupt mask
> 9. re-enable interrupts

Since the clock timer is not disabled, how you achieve atomicity
in-between steps 3 to 7?

> the reason this is a partial fix:
> 
> external hardware signals (NMI, INIT, SMI, FLUSH) interferes with the 
> frequency change.
> 
> ****> this is the hard one:
> cache snooping interferes with the frequency change.
> so if DMA is accessing memory, cache snooping is active.
> 
> my partial fix waits for the ide dma to be idle and then dives into the 
> frequency change.
> other dma controllers (e.g. bus mastering pci card, legacy (isa) dma channels)
> will cause the same problem.
> 
> 
> 
> ---
> ken
> 
> 
> 
> 
> 
> --- longhaul-2.6.11.7.c	2005-04-11 22:12:18.000000000 -0700
> +++ longhaul.c	2005-04-11 22:13:51.000000000 -0700
> @@ -30,6 +30,11 @@
>   #include <linux/slab.h>
>   #include <linux/string.h>
> 
> +#include <linux/ide.h>
> +#include <linux/delay.h>
> +#include <asm/irq.h>
> +#include <linux/sched.h>
> +
>   #include <asm/msr.h>
>   #include <asm/timex.h>
>   #include <asm/io.h>
> @@ -58,13 +63,26 @@
> 
>   /* Module parameters */
>   static int dont_scale_voltage;
> +static int debug;
> +
> +static void dprintk(const char *fmt, ...)
> +{
> +	char s[256];
> +	va_list args;
> 
> +	if (debug == 0)
> +		return;
> 
> -#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, 

What's wrong with this version of dprintk?

> "longhaul", msg)
> +	va_start(args, fmt);
> +	vsprintf(s, fmt, args);
> +	printk(s);
> +	va_end(args);
> +}
> 
> 
>   #define __hlt()     __asm__ __volatile__("hlt": : :"memory")
> 
> +

Why this line is added?

>   /* Clock ratios multiplied by 10 */
>   static int clock_ratio[32];
>   static int eblcr_table[32];
> @@ -72,10 +90,31 @@
>   static unsigned int highest_speed, lowest_speed; /* kHz */
>   static int longhaul_version;
>   static struct cpufreq_frequency_table *longhaul_table;
> -
> -#ifdef CONFIG_CPU_FREQ_DEBUG
>   static char speedbuffer[8];
> 
> +spinlock_t long_lock = SPIN_LOCK_UNLOCKED;
> +
> +
> +void dma_idle(void) {
> +	int i;
> +	ide_hwif_t *hwif = ide_hwifs;
> +	ide_drive_t *drive;
> +
> +	i = 0;
> +	do {
> +	  drive = &hwif->drives[i];
> +	  i++;
> +	  if (strncmp(drive->name,"hd",2) == 0) {
> +	    while (drive->waiting_for_dma) udelay(10) ;
> +	  } else {
> +	    i = 0;
> +	  }
> +	}
> +	while (i != 0);
> +}

Could you please respect linux coding style?

...

> +
> +	dma_idle();	// ide dma only...

ditto.  Please don't use a comment a la C99.

> +
> +// BEGIN CRITICAL SECTION

ditto

> +
> +//	preempt_disable();
> +	local_irq_save(flags);
> +
> +	// disabling INT2 takes care of ints 8-15 (cascaded)
> +
> +	tmp_mask=inb(0x21);	// works on C3. save mask.

Do you have any pointer stating that PIC is the only available
interrupt model for such architecture?


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
