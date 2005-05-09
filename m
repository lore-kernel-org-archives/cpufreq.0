From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Problem with Powernow-k8 module
Date: Mon, 9 May 2005 10:41:00 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFBFF7@SAUSEXMB1.amd.com>
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
To: Andrea Ferrari <and_ferrari@virgilio.it>, cpufreq@lists.linux.org.uk

Your BIOS does not provide the ACPI _PSS objects, nor
the legacy PSB table, necessary for the powernow-k8
driver.  Without those objects or table, the driver
does not know what frequencies are available. =20

You need to complain to your BIOS manufacturer. =20
What board are you using and who makes the BIOS?

-Mark Langsdorf
AMD, Inc.

> -----Original Message-----
> From: cpufreq-bounces@lists.linux.org.uk=20
> [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
> Andrea Ferrari
> Sent: Monday, May 09, 2005 10:37 AM
> To: cpufreq@lists.linux.org.uk
> Subject: Problem with Powernow-k8 module
>=20
>=20
> Hi
>=20
> I'm Andrea and i'm writing from Italy. I have a big problem=20
> and i can't found=20
> the way to resolve it.=20
> I compile the latest kernel version 2.6.11.8 on my Amd Athlon=20
> 64 3200+=20
> Workstation.=20
> When i load the module powernow-k8 i have this error:
>=20
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors=20
> (version 1.00.09e)
> powernow-k8: BIOS error - no PSB
> FATAL: Error inserting powernow_k8=20
> (/lib/modules/2.6.11.8/kernel/arch/i386/kernel/cpu/cpufreq/pow
> ernow-k8.ko):=20
> No such device
>=20
> What can i will do to resolve my problem?
>=20
> Thank you, Andrea
>=20
> Ps: Sorry for my Bad English
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk=20
> http://lists.linux.org.uk/mailman/listinfo/cpu> freq
>=20
>=20
