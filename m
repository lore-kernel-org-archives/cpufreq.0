From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 20:48:50 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414184850.GA19921@dominikbrodowski.de>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
	<20040414174407.GL24970@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0699782862=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040414174407.GL24970@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============0699782862==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2004 at 06:44:07PM +0100, Dave Jones wrote:
> On Wed, Apr 14, 2004 at 02:18:57PM +0200, Bruno Ducrot wrote:
>=20
>  > I actually wanted to submit also the ACPI integration...
>=20
> I just tried this out on my Compaq Evo 1015.  It has working
> PST, so just uses that.  I got curious though, and hardwired it
> to fall back to the ACPI method. This is what it comes out with on
> PST..

Will take a look at cpufreq-2004-04-14 in a moment.

> Maximum speed seems off by a factor of 10.
> Formatting of that debug info could also probably be cleaned up a little,
> as its very wide.  How do you feel about adding a module_param to force
> fallback, so we can get a few more people testing it too ?

I consider this to be a _very_ good idea.

	Dominik
--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAfYeSZ8MDCHJbN8YRAjsqAJ9ODcN0KkN+i+gUxx3i+3ri6gPIKwCff4O5
+i5xzaHpSrSzc/FnelXdlMg=
=sT8e
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--


--===============0699782862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0699782862==--

