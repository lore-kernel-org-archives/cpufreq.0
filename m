From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH 2.6] cpufreq longrun driver fix
Date: Mon, 5 Apr 2004 19:38:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040405173835.GA7328@dominikbrodowski.de>
References: <20040405155012.GI2718@deep-space-9.dsnet>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0551764332=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040405155012.GI2718@deep-space-9.dsnet>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Stelian Pop <stelian@popies.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, davej@codemonkey.org.uk, cpufreq@www.linux.org.uk


--===============0551764332==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2004 at 05:50:12PM +0200, Stelian Pop wrote:
> Hi,
>=20
> My TM5600 Crusoe processor, found inside a Sony Vaio C1VE laptop,
> does not work with the longrun cpufreq driver.
>=20
> Upon investigation, the reason is that trying to set the performance=20
> to 80% in longrun_determine_freqs leaves the performance to 100%.
> The performance level, at least on this particular model, can be lowered
> only in 33% steps. And in order to put the performance to 66%, the
> code should try to set the barrier to 70%.
>=20
> The following patch does even more, it tries every value from 80%
> to 10% in 10% steps, until it succeeds in lowering the performance.
> I'm not sure this is the best way to do it but in any case,=20
> it works for me (and should continue to work for everybody else).

Patch looks good to me -- thanks, Stelian!=20
Dave, could you merge it, please?

Thanks,
	Dominik
=20
--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcZmbZ8MDCHJbN8YRAizlAJ9TiNHW/uSPvoifCulsOaeh17lJrQCgiBPj
E3dQpPIvNLHTI7Kv9L6qs9M=
=DrFa
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


--===============0551764332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0551764332==--

