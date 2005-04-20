From: <ken_staton@agilent.com>
Subject: RE: [PATCH] longhaul
Date: Wed, 20 Apr 2005 11:18:20 -0700
Message-ID: <3EFE14A8A1A82D4BB867A48A01A88ED708A096@waglmb01.labs.agilent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
content-class: urn:content-classes:message
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
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

> From: Dave Jones [mailto:davej@redhat.com]
> Sent: Wednesday, April 20, 2005 11:04 AM
> To: STATON,KEN (A-Labs,ex1)
> Cc: cpufreq@lists.linux.org.uk
> Subject: Re: [PATCH] longhaul
>=20
>=20
> On Wed, Apr 20, 2005 at 09:49:20AM -0700,=20
> ken_staton@agilent.com wrote:
>=20
>  > +void ide_idle(void) {
>  > +	int i;
>  > +	ide_hwif_t *hwif =3D ide_hwifs;
>  > +	ide_drive_t *drive;
>  > +
>  > +	i =3D 0;
>  > +	do {
>  > +		drive =3D &hwif->drives[i];
>  > +		i++;
>  > +		if (strncmp(drive->name,"hd",2) =3D=3D 0) {
>  > +			while (drive->waiting_for_dma) udelay(10) ;
>  > +		} else {
>  > +			i =3D 0;
>  > +		}
>  > +	} while (i !=3D 0);
>  > +}
>=20
> I wonder if the ide layer should have a way to quiesce dma that
> we can use instead of doing this here.
> Maybe it already does, I'm not too familiar with its internals.


i'll look again. i didn't find a more direct way.=20


>=20
>  > @@ -133,21 +170,77 @@
>  >  	}
>  > =20
>  >  	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
>  > +
>  >  	longhaul->bits.SoftBusRatio =3D clock_ratio_index & 0xf;
>  >  	longhaul->bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
>  >  	longhaul->bits.EnableSoftBusRatio =3D 1;
>  >  	longhaul->bits.RevisionKey =3D 0;
>  > -	local_irq_disable();
>  > +
>  > +	/* Begin critical section */
>  > +	preempt_disable();
>  > +	ide_idle();	/* avoid ide timeouts when bus master off */
>  > +	local_irq_save(flags);
>  > +
>  > +	/* get current pci bus master state for all devices */
>  > +	/* and clear bus master bit */
>  > +
>  > +	dev =3D NULL;
>  > +	i =3D 0;
>  > +	do {
>  > +		dev =3D pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
>  > +		if (dev !=3D NULL) {
>  > +			pci_read_config_word(dev, PCI_COMMAND,=20
> &pci_cmd);
>  > +			cmd_state[i++] =3D pci_cmd;
>  > +			pci_cmd &=3D ~PCI_COMMAND_MASTER;
>  > +			pci_write_config_word(dev, PCI_COMMAND,=20
> pci_cmd);
>  > +		}
>  > +	} while (dev !=3D NULL);
>=20
> This bit bothers me a little, as we're not saving any state
> to record whether the devices had mastering enabled.


state is saved here:
>  > +			cmd_state[i++] =3D pci_cmd;


>=20
> Also, from my reading of the PCI spec, if we disable mastering
> in the root bridge, every device downstream of that should
> also be transparently disabled. Can you try that ?
>=20

the root bridge command register is read only.
use setpci -s 0:0.0 4.w to confirm

>  > +	/* disabling INT2 takes care of ints 8-15 (cascaded) */
>  > +
>  > +	tmp_mask=3Dinb(0x21);	/* works on C3. save mask. */
>  > +	outb(0xFE,0x21);        /* TMR0 only */
>  > +	outb(0xFF,0x80);        /* delay */
>  > +
>  > +	local_irq_enable();     /* sti */
>=20
> This part looks a little magical, but the comments suffice I suppose.
>=20
>  > +	/* restore pci bus master state for all devices */
>  > +
>  > +	dev =3D NULL;
>  > +	i =3D 0;
>  > +	do {
>  > +		dev =3D pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
>  > +		if (dev !=3D NULL) {
>  > +			pci_cmd =3D cmd_state[i++];
>  > +			pci_write_config_byte(dev, PCI_COMMAND,=20
> pci_cmd);
>  > +		}
>  > +	} while (dev !=3D NULL);
>=20
> Again, this bothers me, as we could be enabling mastering on
> a device that previously didn't have it enabled.
>=20

restoring previous state here:
>  > +			pci_cmd =3D cmd_state[i++];


>  >  	longhaul->bits.EnableSoftBusRatio =3D 0;
>  >  	longhaul->bits.RevisionKey =3D version;
>  > -	local_irq_disable();
>  > +
>  >  	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
>  > -	local_irq_enable();
>  > +
>=20
> Doesn't the spec say we need ints off around transitions ?
>=20

i didn't read it that way.
in fact an interrupt is one way to bring the PLL back up after hlt;
the timer int is the only one we can conveniently control.

the second write to the MSR doesn't do a PLL transition.

> =20
> Thanks for chasing this down though, it looks like you're on the
> right track.
>=20
> 		Dave
>=20
>=20
