From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 18:46:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402164647.GA7298@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
	<20040402163955.GA7034@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0446365443=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040402163955.GA7034@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>, Dave Jones <davej@redhat.com>, Andrew Morton <akpm@osdl.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>, paul.devriendt@amd.com


--===============0446365443==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2004 at 06:39:55PM +0200, Dominik Brodowski wrote:
> On Fri, Apr 02, 2004 at 06:24:47PM +0200, Bruno Ducrot wrote:
> > But I can't say for sure which have to be favored: legacy or ACPI.
> > I don't have enough dump of ACPI tables and PSB/PST from machines shipp=
ed
> > with AMD64.
>=20
> AFAIK, AMD will deprecate PSB/PST soon, so ACPI should be favoured.

Another reason is that with PSB/PST the system might not run at highest
possible frequency, even when connected to AC-power [batps]. So ACPI should
really be favored, IMHO.

	Dominik

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAbZj3Z8MDCHJbN8YRAvfNAJ0RGUqGKoLhDWrye4VFsROq41yBIgCdGidG
Fw9ffoO2f158qA98wFjSUlA=
=3ijN
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--


--===============0446365443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0446365443==--

