From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Clock runs twice as fast when CPU speed is halved on AMD
 Turion 64 mobile (Compaq Presario V2311US)
Date: Tue, 27 Sep 2005 10:07:44 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A843032187D9@SAUSEXMB1.amd.com>
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
To: lutris@gmail.com, cpufreq@lists.linux.org.uk

> I've an AMD Turion-based laptop, a Compaq Presario V2311US. =20
> It can be set to two speeds, 800Mhz or 1600Mhz.  When set to=20
> 800Mhz, Linux thinks that time is passing twice as fast as=20
> normal - if I let the laptop sit for an hour, it claims that=20
> two have passed.
>=20
> Are there any known workarounds or fixes for this?
>=20
> If not, are there any suggestions for dirty hacks?
>=20
> Hard-coding the kernel to run the clock half as fast would be=20
> sufficient; I never need to set the bus speed to full when in Linux.

If your laptop uses the ATI 700 chipset, this is a known
bug with regards to the chipset and we're still trying to
find the best solution to it.  We should have an answer=20
by mid-October.

-Mark Langsdorf
AMD, Inc.
