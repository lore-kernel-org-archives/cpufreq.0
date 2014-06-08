From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 1/2] longhaul: Mark it as dangerous in Kconfig
Date: Mon, 09 Jun 2014 00:20:42 +0100
Message-ID: <1402269642.23860.48.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qdRQW9Z+PhGupbTSkfnL"
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, =?UTF-8?Q?Rafa=C5=82?= Bilski <rafalbilski@interia.pl>


--=-qdRQW9Z+PhGupbTSkfnL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

longhaul quickly caused hard lockups and possibly killed the memory
module on my EPIA-PD board.  It is commented as:

'BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*'

Let's put another warning where people are more likely to see it.

References: https://bugs.debian.org/707047
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/cpufreq/Kconfig.x86 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index d369349..a3877c6 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -247,12 +247,13 @@ config X86_LONGRUN
 	  If in doubt, say N.
=20
 config X86_LONGHAUL
-	tristate "VIA Cyrix III Longhaul"
+	tristate "VIA Cyrix III Longhaul (DANGEROUS)"
 	depends on X86_32 && ACPI_PROCESSOR
 	help
 	  This adds the CPUFreq driver for VIA Samuel/CyrixIII,
 	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T
-	  processors.
+	  processors.  It does not work with all motherboards and may
+	  cause hardware damage.
=20
 	  For details, take a look at <file:Documentation/cpu-freq/>.
=20

--=20
Ben Hutchings
One of the nice things about standards is that there are so many of them.

--=-qdRQW9Z+PhGupbTSkfnL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5Tv1ue/yOyVhhEJAQoV7g/9HAd176B9uczqXmeeL7v6CHaWbIZQtYHo
1ygHh54kYWaF8NRkWWXdDr+7+qML4ZimM3blmDZZ4/dVXap6K0EGEELtAVGWdhyT
p74RLlyNFZ+9XvTltMrhKeuefsDhO5DWNWZSqHgKtYQGV33nMx6ZavybhdbY5Q7j
eCABhCQDRqCcaf+NywJ8AffpPgnc9kfgPommQ+EM0gVhWJLJYJS8mDkZ+DgRrM8y
Z3FbLweJwyaJnh0u4ZS5diiz91L80av3s1K6u5Bmx05Yd0ZMcXwQflpe5cpa+vvo
FsWQgGgLXp8QvEW5bAwer93R+RvqlKe02+NeBv9rmP1xMQLDsGcm6DTmzolD/HqO
clTbzKq6nGcjA8rqQuOpawMU+2fNpR3dBszmPct9AjocnbCFavJK8T3k3IY3jrMN
CjSlN4od7BcAAmx8Xe0Y0QKOSaQuuEuql3NkBA2oCVm7eRaL4RlqB9/2L5//27sY
RgMMca4fe7xavRje469QO/qvG/b7rw+75qTNLGQLXeJvkEXCPNcF62oRruWDNbmg
t8ckmzpCYeUTL+YR28SIJFVy/TLNXIthteBJLzXin2UgFGfuQj4Xn/VrR6BrfzfP
7GEYxYeif7ATNqNX7mIgkQBg9LTiJBaEK5PHZPeItOTTNpuQb4SP93R+7+sg+ior
h4v8sP0JmdI=
=lrBd
-----END PGP SIGNATURE-----

--=-qdRQW9Z+PhGupbTSkfnL--
