From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Mon, 09 Aug 2004 09:37:46 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1092058666.29221.50.camel@pc>
References: <1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040807132449.GA9569@dominikbrodowski.de>
	<1091905423.29221.1.camel@pc>
	<20040808162408.GA7986@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1758443571=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040808162408.GA7986@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk


--===============1758443571==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-vC1Z+5XKMGE14sBeyZJ5"


--=-vC1Z+5XKMGE14sBeyZJ5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-08-08 at 18:24 +0200, Dominik Brodowski wrote:
>=20
> Problem is, I don't use the resume funcitonality on my notebook

But surely lots of people are.  If the patch below were necessary and
correct, would not a lot more people be having the same problem?  Unless
I am mis-understanding the intent of the patch.  Do you mean it as a
further test/confirmation that write_seqlock_irq() is the culprit or do
you mean the patch as the solution to my problem?

> Anyways, I've prepared a patch to work around the "local_irq_enable()" ca=
ll.
> Could you test it, please?

Sure.  I will let you know how it does.

b.


--=-vC1Z+5XKMGE14sBeyZJ5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBF34ql3EQlGLyuXARAvHMAKDLNYM/tA4CG9WAMK59cvDI2SlYNQCeL7J7
DahD2WHOKghB/l060rAFAL8=
=hSIr
-----END PGP SIGNATURE-----

--=-vC1Z+5XKMGE14sBeyZJ5--



--===============1758443571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1758443571==--


