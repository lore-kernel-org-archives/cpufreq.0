From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Frequency switch latency
Date: Sun, 8 Feb 2004 19:16:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040208181602.GA4891@dominikbrodowski.de>
References: <200401291206.06389.stefan@buettcher.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============91101450205053958=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200401291206.06389.stefan@buettcher.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Stefan Buettcher <stefan@buettcher.org>
Cc: cpufreq@www.linux.org.uk


--===============91101450205053958==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2004 at 12:06:06PM +0100, Stefan Buettcher wrote:
> This is a little off-topic. In case it does not belong here: Sorry.
>=20
> I am currently working on a kernel-compiler cooperation for
> dynamic voltage/frequency scaling. I am doing this for Intel's
> XScale PXA architecture. It has turned out that changing the
> frequency on the XScale takes some hundred microseconds,
> but voltage scaling takes 5-8 milliseconds (I am working with
> some evaluation board with DVS support). Are there numbers
> for PowerNow or SpeedStep on the web? I could not find any.

AFAIK, there are no such numbers available even though this is a well-known
phenomenon. SpeedStep and PowerNow (usually) have fixed frequency/voltage
pairs with different voltages for different frequencies, so there is no
difference in latencies between different "states"...

> Another question: I have seen that there are cases in which
> energy can be saved by not only changing the CPU frequency/
> voltage but also the memory frequency. This is especially true
> when a process with high cache efficiency is executed. We
> simply do not need the memory then. Are there any plans for
> integrating memory speed into the CPUfreq code sometime in
> the future?

Not yet... it hasn't even been discussed yet on this list AFAIK.
Nonetheless, IMO it should at least be interconnected to cpufreq or=20
even become part of cpufreq.

	Dominik
--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAJnziZ8MDCHJbN8YRAiftAJwPe3i+OLEoZqiwLdUwKdgsytTP3wCfS9OV
C4z1ebp7mNYkHIqJjsiWLfA=
=DRXH
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


--===============91101450205053958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============91101450205053958==--

