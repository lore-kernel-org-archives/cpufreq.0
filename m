From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [powernow-k8] some wrong frequencies on opterons 252, howto
 find them?
Date: Mon, 28 Nov 2005 10:33:13 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218993@SAUSEXMB1.amd.com>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

> > No, that's okay.  If you could retrieve the value of
> > pr->performance->state_count from line 1011 of
> > drivers/acpi/processor.c, and the values of
> > px->control from line 1036 of the same file for each
> > _PSS object, that would be very helpful.
> >=20
>=20
> Ok.
>=20
> The dmesg look like that now:
>=20
> powernow-k8: Found 2 AMD Athlon 64 / Opteron processors=20
> (version 1.50.4)=20
> processor id 0: pr->performance->state_count 5
> processor id 0: State [0]: core_frequency[2600]=20
> power[68000] transition_latency[100] bus_master_latency[7]=20
> control[0xc0701192] status[0x192]
> data->acpi_data.state_count: 5
> data->numps 5
> powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
> powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
> powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
> powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
> powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
>
> For the record, I put the SSDTs loaded via the Load stuff
> found after dumping the memory regions as I said earlier.
> I don't think you will need them though.  There is no low=20
> frequency for sure.

It's a BIOS bug/feature, for sure.  Take it up with HP -
they've been known to make design decisions like this=20
before.


-Mark Langsdorf
AMD, Inc.
