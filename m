From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Disable arbiter
Date: Tue, 8 Aug 2006 15:58:58 -0400
Message-ID: <20060808195858.GC17618@redhat.com>
References: <44D8C5F4.4050406@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44D8C5F4.4050406@interia.pl>
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

On Tue, Aug 08, 2006 at 07:12:20PM +0200, Rafa=C5=82 Bilski wrote:
 > ACPI C3 works for "Powersaver" processors, so use it=20
 > only for them.
 >=20
 > Older CPU will change frequency on "halt" only. But we=20
 > can protect transition in two ways:
 > - by ACPI PM2 register, there is "bus master arbiter=20
 >   disable" bit. This isn't tested because VIA mainboards=20
 >   don't have PM2 register,
 > - by PLE133 PCI/AGP arbiter disable register. There=20
 >   are two bits in this register. First is "PCI arbiter=20
 >   disable", second "AGP arbiter disable". This is=20
 >   working on VIA Epia 800 mainboards.

The only part about this I don't like is that we now need to add
code to do similar things on every possible VIA chipset that
could take a C3, and there's quite a few of them, and until
we have good coverage...

 > =20
 > +	/* Find ACPI data for processor */
 > +	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT, ACPI_UINT32=
_MAX,
 > +			    &longhaul_walk_callback, NULL, (void *)&pr);
 > +	if (pr =3D=3D NULL) goto err_acpi;
 > +
 > +	if (longhaul_version =3D=3D TYPE_POWERSAVER) {
 > +		/* Check ACPI support for C3 state */
 > +		cx =3D &pr->power.states[ACPI_STATE_C3];
 > +		if (cx->address =3D=3D 0 || cx->latency > 1000) goto err_acpi;
 > +	} else {
 > +		/* Check ACPI support for bus master arbiter disable */
 > +		if (!pr->flags.bm_control) {
 > +			if ( !enable_arbiter_disable() ) {
 > +				printk(KERN_ERR PFX "No ACPI support. No VT8601 host bridge. Aborti=
ng.\n");
 > +		    		return -ENODEV;
 > +			} else
 > +				port22_en =3D 1;
 > +		}
 > +	}

We're going to -ENODEV, possibly breaking some setups that it might actually
already work on (even if only by chance).

		Dave

--=20
http://www.codemonkey.org.uk
