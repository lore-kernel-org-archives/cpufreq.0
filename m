From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: powernow-k8: out of sync on Athlon64 x2 3800+
Date: Tue, 31 Jan 2006 09:57:38 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218B5D@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Niklas Edmundsson <Niklas.Edmundsson@hpc2n.umu.se>
Cc: cpufreq@lists.linux.org.uk

> > You'll get that message on an Athlon X2 if you're using an=20
> > old version of the driver that doesn't fully support
> > dual core or if your part is being reported to Linux as
> > 2 single core parts.
> >
> > Neither of those should be happening with the 2.6.15.1 kernel.
>=20
> OK, seems we've really found a bug then.

Yes, but it's a BIOS bug.
=20
> > Could you send me the results of `dmesg | grep powern` immediately=20
> > after boot?
>=20
> Sure:
> # dmesg|grep powern
> powernow-k8: Found 2 AMD Athlon 64 / Opteron processors=20
> (version 1.50.4)
> powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x8 (1350 mV)
> powernow-k8:    1 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
> powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
> powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x8 (1350 mV)
> powernow-k8:    1 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
> powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)

You're using a driver that supports dual-core, but the BIOS
is reporting the two cores as two separate processors. =20
They've probably got the APICIDs misconfigured.

I've reported it to FSC and I advise you to do the same.

> powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12
> powernow-k8: error - out of sync, fix 0x2 0xa, vid 0x12 0xa
> powernow-k8: error - out of sync, fix 0xa 0xc, vid 0xa 0x8
> powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12
> powernow-k8: error - out of sync, fix 0x2 0xc, vid 0x12 0x8
> powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12

These messages are mostly harmless, by the way, but some
people have seen system instability.  I would enable
pmtimer support as your clock source, but that's advisable
when running a single dual-core anyway.

-Mark Langsdorf
AMD, Inc.
