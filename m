From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq doesn't keep over suspend/resume
Date: Tue, 15 Jun 2004 07:10:33 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040615051033.GB5118@dominikbrodowski.de>
References: <20040614191225.GA1463@fog.sekrit.org>
	<20040614202539.GA10796@dominikbrodowski.de>
	<20040615013242.GA13338@fog.sekrit.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1478715295=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040615013242.GA13338@fog.sekrit.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Gerald Britton <gbritton@alum.mit.edu>
Cc: cpufreq@www.linux.org.uk


--===============1478715295==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2004 at 09:32:42PM -0400, Gerald Britton wrote:
> On Mon, Jun 14, 2004 at 10:25:39PM +0200, Dominik Brodowski wrote:
> > Hi!
> >=20
> > On Mon, Jun 14, 2004 at 03:12:25PM -0400, Gerald Britton wrote:
> > > Warning: CPU frequency out of sync: cpufreq and timing core thinks of
> > > 600000, is 1600000 kHz.
> > >=20
> > > Also, this warning is somewhat confusing since "of" appears to refer =
to
> > > "old_freq" rather than actually being a use of the word "of" so it wa=
sn't
> > > entirely clear what it was trying to say at first.
> >=20
> > As you seem to be a "native speaker": how should we rephrase this messa=
ge so
> > it is clear what it is trying to say?
>=20
> "actual cpu speed 1600000 kHz, cpufreq assumed 600000 kHz" perhaps, I'm n=
ot
> sure there's a good concise way to word this.  This is likely a normal st=
ate
> on resume though, so screaming about a warning might not be the right sol=
ution
> here.

Normal but broken, and it definitely needs a warning. In fact, some cpufreq
drivers on some architectures will even _panic_ on such an event. However,
the amount of such warnings will likely be reduced once the pstate_cnt patch
I posted yesterday on this and the acpi-devel lists is merged.

> # cat scaling_cur_freq scaling_max_freq scaling_min_freq scaling_setspeed
> 600000
> 600000
> 600000
> 600000
> # grep 'cpu MHz' < /proc/cpuinfo
> cpu MHz         : 598.244
>=20
> After resume:
>=20
> # cat scaling_cur_freq scaling_max_freq scaling_min_freq scaling_setspeed
> 600000
> 600000
> 600000
> 600000
> # grep 'cpu MHz' < /proc/cpuinfo
> cpu MHz         : 1595.318
>=20
> I was examining the value in /proc/cpuinfo on resume and noticing the
> difference.
=2E.. and this constitutes a BUG. Will investigate.

Thanks,
	Dominik

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAzoTJZ8MDCHJbN8YRAi+LAKCfkXLhEpFQN0XplJCQUSSBqMOSBQCfdwV2
7eBTh8kX9gkKyBqEd9ElvqE=
=audI
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--


--===============1478715295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1478715295==--

