From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change
 Frequency!
Date: Tue, 29 May 2007 14:42:29 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076E15@SAUSEXMB1.amd.com>
References: <1180379564.5763.8.camel@Tux-Devil>
	<1449F58C868D8D4E9C72945771150BDF02076E14@SAUSEXMB1.amd.com>
	<1180466105.8401.5.camel@Tux-Devil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <1180466105.8401.5.camel@Tux-Devil>
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
To: muskatnuss@gmx.at, cpufreq@lists.linux.org.uk

> my cpufreq directory says:
>=20
> cpuinfo_cur_freq
> 800000
>=20
> cpuinfo_max_freq
> 1600000
>=20
> cpuinfo_min_freq
> 800000
>=20
> scaling_cur_freq
> 800000
>=20
> scaling_driver
> powernow-k8
>=20
> scaling_max_freq
> 800000
>=20
> scaling_min_freq
> 800000
>=20
> affected_cpus
> 0 1
>=20
> so but i've already tried to change the scaling_max_freq to=20
> 1600000 but nothing happens @ su mode.
> if i add an line with=20
> echo 1600000 > /sys/devices...../cpufreq/scaling_max_freq
> at booting before entering init 1 modus ... nothing happens=20
> or it says directory or file not found.
>=20
> so im not able to change this file.=20

I'm not even sure how the scaling_max and the cpuinfo_max
can be different values.  Anyone else have any ideas?

By the way, what governor are you using?

-Mark Langsdorf
Operating System Research Center
AMD
