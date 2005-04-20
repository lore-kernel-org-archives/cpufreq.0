From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] longhaul
Date: Wed, 20 Apr 2005 14:03:35 -0400
Message-ID: <20050420180335.GH2476@redhat.com>
References: <3EFE14A8A1A82D4BB867A48A01A88ED708A094@waglmb01.labs.agilent.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3EFE14A8A1A82D4BB867A48A01A88ED708A094@waglmb01.labs.agilent.com>
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

On Wed, Apr 20, 2005 at 09:49:20AM -0700, ken_staton@agilent.com wrote:

 > +void ide_idle(void) {
 > +	int i;
 > +	ide_hwif_t *hwif = ide_hwifs;
 > +	ide_drive_t *drive;
 > +
 > +	i = 0;
 > +	do {
 > +		drive = &hwif->drives[i];
 > +		i++;
 > +		if (strncmp(drive->name,"hd",2) == 0) {
 > +			while (drive->waiting_for_dma) udelay(10) ;
 > +		} else {
 > +			i = 0;
 > +		}
 > +	} while (i != 0);
 > +}

I wonder if the ide layer should have a way to quiesce dma that
we can use instead of doing this here.
Maybe it already does, I'm not too familiar with its internals.

 > @@ -133,21 +170,77 @@
 >  	}
 >  
 >  	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
 > +
 >  	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
 >  	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
 >  	longhaul->bits.EnableSoftBusRatio = 1;
 >  	longhaul->bits.RevisionKey = 0;
 > -	local_irq_disable();
 > +
 > +	/* Begin critical section */
 > +	preempt_disable();
 > +	ide_idle();	/* avoid ide timeouts when bus master off */
 > +	local_irq_save(flags);
 > +
 > +	/* get current pci bus master state for all devices */
 > +	/* and clear bus master bit */
 > +
 > +	dev = NULL;
 > +	i = 0;
 > +	do {
 > +		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
 > +		if (dev != NULL) {
 > +			pci_read_config_word(dev, PCI_COMMAND, &pci_cmd);
 > +			cmd_state[i++] = pci_cmd;
 > +			pci_cmd &= ~PCI_COMMAND_MASTER;
 > +			pci_write_config_word(dev, PCI_COMMAND, pci_cmd);
 > +		}
 > +	} while (dev != NULL);

This bit bothers me a little, as we're not saving any state
to record whether the devices had mastering enabled.

Also, from my reading of the PCI spec, if we disable mastering
in the root bridge, every device downstream of that should
also be transparently disabled. Can you try that ?

 > +	/* disabling INT2 takes care of ints 8-15 (cascaded) */
 > +
 > +	tmp_mask=inb(0x21);	/* works on C3. save mask. */
 > +	outb(0xFE,0x21);        /* TMR0 only */
 > +	outb(0xFF,0x80);        /* delay */
 > +
 > +	local_irq_enable();     /* sti */

This part looks a little magical, but the comments suffice I suppose.

 > +	/* restore pci bus master state for all devices */
 > +
 > +	dev = NULL;
 > +	i = 0;
 > +	do {
 > +		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
 > +		if (dev != NULL) {
 > +			pci_cmd = cmd_state[i++];
 > +			pci_write_config_byte(dev, PCI_COMMAND, pci_cmd);
 > +		}
 > +	} while (dev != NULL);

Again, this bothers me, as we could be enabling mastering on
a device that previously didn't have it enabled.

 >  	longhaul->bits.EnableSoftBusRatio = 0;
 >  	longhaul->bits.RevisionKey = version;
 > -	local_irq_disable();
 > +
 >  	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
 > -	local_irq_enable();
 > +

Doesn't the spec say we need ints off around transitions ?

 
Thanks for chasing this down though, it looks like you're on the
right track.

		Dave
