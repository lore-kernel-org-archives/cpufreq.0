From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: powernow-k8: missing p-state
Date: Thu, 18 Aug 2005 12:24:31 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC36F@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>, Brendt Wohlberg <bw4@wohlberg.net>
Cc: cpufreq@lists.linux.org.uk

> > The kernel was built with general ACPI support (CONFIG_ACPI=3Dy), as =

> > well as with the ACPI option for powernow-k8=20
> > (CONFIG_X86_POWERNOW_K8_ACPI=3Dy).
> > =20
> > > Could you send me the output of acpidmp, please ?
> >=20
> > With pleasure - it's attached.
>=20
> As expected, there is only 3 p-states on that one, namely=20
> 2200, 2000 and 1800 kHz.
>=20
> Maybe the legacy tables are not so broken.  Could you please=20
> try that little tool I'm attaching (compile with -O at least)?
>=20
> NB: it has been written for powernow-k7 originaly.  So it=20
> will certainly give false values.  What I want to see in fact=20
> is the number of frequencies available.

Bruno -

Thank you for the support, but my experience has been that
the PSB/PST tables are much less likely to exist or be
correct than the ACPI tables.  I'm not sure what your tool
is going to demonstrate.

-Mark Langsdorf
AMD, Inc.
