From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Problem with Powernow-k8 - 2.6.13.3
Date: Mon, 10 Oct 2005 15:34:26 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A8430321884F@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Andrea Ferrari <and_ferrari@virgilio.it>
Cc: cpufreq@lists.linux.org.uk, linux@brodo.de

> Alle 19:45, luned=EC 10 ottobre 2005, hai scritto:
> > Oops.  Sorry, you'll need to copy the powernow-k8.h
> > file over also.
> >
> > Thanks for helping me debug this.
>=20
> Ok, i copy powernow-k8.h and powernow-k8.c in 2.6.13.4=20
> source. Compile it and Reboot my Pc. From Dmesg:
>=20
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors=20
> (version 1.40.4)
> powernow-k8: BIOS error - no PSB or ACPI _PSS objects
>=20
> Is there a problem on Acpi drivers?

It looks like it.  There was a change between 2.6.12.3
and 2.6.13.4 that stops Linux from finding the _PSS
or _PCT objects on your system.

Dominik -

You're listed in the credits for processor_perflib.c.
Something in that file changed between 2.6.12.3 and
2.6.13.4 to prevent acpi_processor_register_performance()
from working on a MSI K8N Neo4 Platinum motherboard.

I suspect it isn't finding the _PCT, because AMD saw a
similar bug on an internal BIOS.  I reported it to our
BIOS team to resolve, but it now appears to be a Linux
regression.  How can we fix this?

-Mark Langsdorf
AMD, Inc.
