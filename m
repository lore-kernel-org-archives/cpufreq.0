From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [powernow-k8] some wrong frequencies on opterons 252, howto
 find them?
Date: Mon, 28 Nov 2005 09:16:16 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218989@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

> > > powernow-k8: Found 2 AMD Athlon 64 / Opteron processors
> > > (version 1.50.4)
> > > powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
> > > powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
> > > powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
> > > powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
> > > powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
> > > cpu_init done, current fid 0x12, vid 0x6
> > > powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
> > > powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
> > > powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
> > > powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
> > > powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
> > > cpu_init done, current fid 0x12, vid 0x6
> > >=20
> > > The low frequency is missing.  I think the correct one is=20
> 1000 MHz,=20
> > > 1100 mV, but I don't find exactly the correct spec under "AMD=20
> > > Opteron Processor Power and Thermal Data Sheet", even though I'm=20
> > > pretty sure it is the one at page 33.
> > >=20
> > > Someone from AMD people that could validate this, please?
> >=20
> > Funky.  It could be that the driver is misparsin the ACPI objects,=20
> > though I doubt that.  It could be that HP didn't put the=20
> low frequency=20
> > _PSS object in the BIOS.  Can you give me the BIOS version so I can=20
> > try to set up a system? Thanks.
>=20
> BIOS is A05.  There is no related ACPI objects, therefore
> the powernow configuration stuff is done by the legacy BIOS=20
> PSB/PST tables.

Multiprocessor systems aren't supported by PSB/PST
tables in powernow-k8, nor in general on AMD64 systems.
I'm surprised you got it to work at all.

HP should be supporting PN! with ACPI _PSS objects.

-Mark Langsdorf
AMD, Inc.
