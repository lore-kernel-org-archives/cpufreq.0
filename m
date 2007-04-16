From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Voltage tweaking in powernow_k8
Date: Mon, 16 Apr 2007 08:55:38 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076D07@SAUSEXMB1.amd.com>
References: <20070415171810.GA3096@thing.nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070415171810.GA3096@thing.nowhere>
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
To: Roberto Gordo Saez <roberto.gordo@gmail.com>, cpufreq@lists.linux.org.uk

> For example, this is my particule case:
>=20
>  modprobe powernow_k8 vcore_list=3D1200,900
>=20
>  powernow-k8: Found 1 AMD Turion(tm) 64 Mobile Technology MT-30
>  processors (version 2.00.00)
>  powernow-k8: Requested Voltage for id0 is 1200 mV default=20
> voltage is 1300
>  powernow-k8: Performing required adjustment of 100 mV  or 4=20
> 25mV steps
>  powernow-k8: Requested Voltage for id1 is 900 mV default=20
> voltage is 1000
>  powernow-k8: Performing required adjustment of 100 mV  or 4=20
> 25mV steps
>  powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0xe
>  powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x1a
>=20
> I agree that the patch does look a bit ugly, but I find it easier and
> more convenient than to hack into the ACPI values.
>=20
> It is possible to get something like this into the mainline?

AMD policy is that the ACPI values must be used.  I
can't support a patch that overrides the ACPI values.

I have no objection to it being in the code, but I
can't support it.

-Mark Langsdorf
Operating Systems Research Center
AMD
