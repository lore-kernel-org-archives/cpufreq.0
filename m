From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Can't lower vcore => "vid trans failed"
Date: Mon, 18 Jun 2007 08:50:29 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076EAF@SAUSEXMB1.amd.com>
References: <4676671D.30307@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <4676671D.30307@aon.at>
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
To: Manfred Langthaller <manfred.langthaller@aon.at>, cpufreq@www.linux.org.uk

> Mainboard: MSI K8MM3-V H (MSI-7181 Ver: 2.0) BIOS v3.1 (latest)
> CPU: AMD mobile Sempron 3000+ (SMS3000BQX2LF, TDP 25W)
> Debian 4.0
> Kernel: 2.6.21.5
>=20
> If I insert module powernow-k8 3 P-States are recognized, but the=20
> voltages are too high.
>=20
> powernow-k8: Found 1 Mobile AMD Sempron(tm) Processor 3000+=20
> processors=20
> (version 2.00.00)
> powernow-k8:    0 : fid 0xa (1800 MHz), vid 0xa
> powernow-k8:    1 : fid 0x8 (1600 MHz), vid 0xc
> powernow-k8:    2 : fid 0x0 (800 MHz), vid 0x13
> powernow-k8: ph2 null fid transition 0xa
>=20
> 0: VID =3D 0xa =3D 01010 =3D 1.3V
> 1: VID =3D 0xc =3D 01100 =3D 1.250V
> 2: VID =3D 0x13 =3D 10011 =3D 1.075V

These voltages are consistently 0.1V above minimum specification,
but your laptop motherboard may have needed some margin.  If you
mess with them, you may have problems while transitioning.  As
you've noticed.

> Now after inserting module powernow-k8 dmesg says:
>=20
> powernow-k8: Found 1 Mobile AMD Sempron(tm) Processor 3000+=20
> processors=20
> (version 2.00.00)
> powernow-k8:    0 : fid 0xa (1800 MHz), vid 0x13 =3D> 1.075V
> powernow-k8:    1 : fid 0x8 (1600 MHz), vid 0x16 =3D> 1.000V
> powernow-k8:    2 : fid 0x0 (800 MHz), vid 0x1d =3D> 0.825V
> powernow-k8: ph2 null fid transition 0xa

vid at 1800 MHz should be 1.2V (0xe)
vid at 1600 MHz should be 1.15V (0x10)
vid at 800 MHz shoul dbe 0.975V (0x17)

I don't know why you think you can operate at 0.825V but it's=20
not a supported frequency on the data sheet.

> powernow-k8: vid trans failed, vid 0x1d, curr 0x13
> powernow-k8: transition frequency failed
> Time: acpi_pm clocksource has been installed.
> Clocksource tsc unstable (delta =3D -277822049 ns)
> (appending nohz=3Doff highres=3Doff to the kernel should fix the=20
> clocksource=20
> error)
>=20
> All in all the vcore cannot be set lower than 0x13, even 0x13=20
> at 1800MHz works perfectly.
>=20
> Where is the problem?
> Is it the board, the kernel, or me?

Your revised ACPI table is more than a little strange.

-Mark Langsdorf
Operating System Research Center
AMD
