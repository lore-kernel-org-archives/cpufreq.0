From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change
 Frequency!
Date: Fri, 25 May 2007 10:19:43 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076E0A@SAUSEXMB1.amd.com>
References: <20070525050905.54540@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070525050905.54540@gmx.net>
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
To: Patrick Oberdorfer <Muskatnuss@gmx.at>, cpufreq@lists.linux.org.uk

> dmesg | grep power
>=20
> [   54.273858] powernow-k8: Found 2 AMD Turion(tm) 64 X2=20
> Mobile Technology TL-52 processors (version 2.00.00)
> [   54.273973] powernow-k8:     0 : fid 0x8 (1600 MHz), vid 0x13
> [   54.273978] powernow-k8:     1 : fid 0x0 (800 MHz), vid 0x1e
>=20
> so for me it looks like i got no errors.

And no matter what you do, it won't change frequencies?
That's very odd.

Did you get anything different if you pass cpufreq.debug=3D2
as a kernel command line parameter?

-Mark Langsdorf
Operating System Research Center
AMD
