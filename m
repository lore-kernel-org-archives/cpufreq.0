From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 11:24:25 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040114102425.GA16995@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C080EF398@txexmtae.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0063648377259841737=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <99F2150714F93F448942F9A9F112634C080EF398@txexmtae.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: paul.devriendt@amd.com
Cc: davej@redhat.com, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, pavel@ucw.cz, linux-kernel@vger.kernel.org


--===============0063648377259841737==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2004 at 08:49:28PM -0600, paul.devriendt@amd.com wrote:
> hardware. Dominik sent me some great patches to use the cpufreq table sup=
port=20
> and remove some redundant code - let me know if you do not have them and
> want me to forward them. They work great.

I've rediffed them for 2.6.1 and put them here:

http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_1

http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_2

http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_3

http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_4

http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_5

Paul: do you agree to them being merged?

	Dominik

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFABRjZZ8MDCHJbN8YRAlCVAJwJJtiwUUfmOOuSBQ8r5s1PoJbL+ACfdwBg
dZqq11MubwrApJlGeUzHicY=
=oyRE
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


--===============0063648377259841737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0063648377259841737==--

