From: Christian Lorch <me@xto.de>
Subject: ALI Chipsatz und P4-M in Acer Notebook
Date: Thu, 11 Mar 2004 15:51:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200403111551.11525.me@xto.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0396326394=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============0396326394==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_fzHUAzWVE666hsz";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit


--Boundary-02=_fzHUAzWVE666hsz
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dear developers,

i have some problems getting my Acer 632 to work. It has an ALI M1671 Super=
 P4=20
Northbridge [AGP4X,PCI and SDR/DDR] (rev 02) chipset (all other information=
=20
of course availiable if needed) and an P4-M with 1,6GHz (1,2GHz)

OS is SuSE9.0 Prof with 2.4.x kernel (same problem), actually running under=
=20
2.6.3-16 (build by suse). cpufreqd updated from 0.0.1 to 1.0.1

I couldn't find any information on the Internet where to change something.

in /etc/sysconfig/cpufreqd I tried p4-clockmod and all the other modules fr=
om=20
/lib/modules/2.6.3-16-default/kernel/arch/i386/kernel/cpu/cpufreq/

p4-clockmod results in a warning please try one of the other modules and=20
speedstep_etc... results in "krypton kernel: cpufreq: Intel(R) SpeedStep(TM=
)=20
for this chipset not (yet) available."

Is it really not implemented on this chipset?

Thanks in Advance for pointing me to a website with more information

Christian
=2D-=20
Christian Lorch, der nett.Zwerg-Berater

--Boundary-02=_fzHUAzWVE666hsz
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAUHzfcBPVbk+7+qkRAlY8AJsHB4NQjIC2MKQPTTOuI6sUUhyUtwCeP+GB
OuGrW0baHeL0T5VEi+F0eAs=
=KQWy
-----END PGP SIGNATURE-----

--Boundary-02=_fzHUAzWVE666hsz--


--===============0396326394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0396326394==--

