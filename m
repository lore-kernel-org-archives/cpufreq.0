From: Jorgen <jorgen@greven.dk>
Subject: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Thu, 4 Jan 2007 12:37:58 +0000 (UTC)
Message-ID: <loom.20070104T133125-754@post.gmane.org>
References: <5317.195.215.10.251.1167740225.squirrel@195.41.226.86>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

> Patch for 2.6.19.1 is included in this message. It is adding new driver
> to cpufreq so You have to enable it in kernel config. It isn't working
> driver for now. Compile it as module. After modprobe it will print
> You few lines starting with "eps: ". Please send me theses lines. If
> there will be sane values then I will send You more working driver.
>=20
> Regards
> Rafa=C2=B3
>=20
>=20
>=20
Hi Rafa

I have build with your patch and loaded the enhanced_powersaver module. Her=
e=20
is the output from dmesg:

eps: Eden
eps: Extended Centaur CPUID =3D 0xc0000002
eps: CPU temp =3D 42 deg C
eps: Current voltage 844mV
eps: Current multiplier 10

Looks good to me.

The mainboard is an I-Base IB796

Brgds Jorgen
