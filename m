From: Dominik Brodowski <linux@brodo.de>
Subject: Re: CPUFreq dynamic speed governor, take 2.
Date: Tue, 4 Nov 2003 22:36:25 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104213625.GA7445@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB600779D0@scsmsx403.sc.intel.com>
	<20031103222510.GB3895@brodo.de>
	<20031104102426.GH21970@poupinou.org>
	<20031104134246.GA4536@brodo.de>
	<20031104181831.GT21970@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============86210744453091537=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031104181831.GT21970@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: Jon Anderson <janderson@janderson.ca>, cpufreq@www.linux.org.uk


--===============86210744453091537==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2003 at 07:18:31PM +0100, Ducrot Bruno wrote:
> > What if there are thousand steps, or even more [like for the geode driv=
er]?
> > Then this approach is badly broken.
>=20
> that unrelated, but this driver is using the frequency table helper, corr=
ect?

No, it doesn't use the frequency table helper. Frequency table helpers only
make sense for a handful of frequency states, but not for several thousands.

	Dominik

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/qBvYZ8MDCHJbN8YRApiVAJ4pufq+6mKt2L8n/HmL3OotVoHIYgCfZHTP
lEbhc5LRXxSiAaDQWs3lPBg=
=8qqb
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============86210744453091537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============86210744453091537==--

