From: Martin Schreiber <SchreiberX@Altmuehlnet.de>
Subject: Re: hp omnibook xe4500 hangs while loading acpi module
Date: Sat, 20 Dec 2003 17:13:47 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1071936826.1920.2.camel@martini.martin-schreiber.net>
References: <1069971885.1071.5.camel@martini.martin-schreiber.net>
	<20031219182737.GE6909@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============33331427006155323=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031219182737.GE6909@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk


--===============33331427006155323==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-3Bz+/ItZj17t0e5uw0QX"


--=-3Bz+/ItZj17t0e5uw0QX
Content-Type: multipart/mixed; boundary="=-MrftjHy+rTR5ZaLcQaje"


--=-MrftjHy+rTR5ZaLcQaje
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

the acpi cpufreq (kernel 2.6.0) works now on omnibook xe4500 with the
attached patch.

thanks!



On Fri, 2003-12-19 at 19:27, Dominik Brodowski wrote:
> Hi,
>=20
> Can you please try the attached patch (for 2.6.0)? It reverts a change
> done during the time frame you mention: I assume this patch
> "[ACPI] GV3 IO port is 16-bits (Venkatesh Pallipadi)" caused the trouble.
> Please CC <cpufreq@www.linux.org.uk> in your reply [the cpufreq mailing=20
> list], so that other cpufreq developers can investigate this issue as wel=
l.
>=20
> Thanks,
> 	Dominik
>=20
> On Thu, Nov 27, 2003 at 11:24:45PM +0100, Martin Schreiber wrote:
> > hi!
> >=20
> > my "hp omnibook xe4500" hangs, if i load the acpi module for cpufreq.
> > there's no kernel error message. it just blocks everything.
> >=20
> > the cpufreq works fine up to test-6
> > with test-7, the kernel hangs, if i load the module.
> >=20
> > can i help you, to fix this problem?
> >=20
> > just say, what you need.
> >=20
> > i'm completely new to the kernel!
> >=20
> > ciao,
> >   martini
> >=20
> >=20
> > Martin Schreiber
> > Im Muehltal 48
> > 91171 Greding
> >=20
> > http://www.martin-schreiber.net
> > SchreiberX@Altmuehlnet.de
> >=20
> > St=FCrmt und schneit's Silvester nicht, ist das Neujahr auch in Sicht.
> >=20
> > --BEGIN GEEK CODE BLOCK--
> > Version: 3.12
> > GCS d s+: a-- C++ UL++ P+ L+++ E-- W+++ N o K- w--
> > O- M- V- PS+++ PE+ Y PGP++ t 5+ X R+ tv++ b+ DI- D++
> > G e h-- r-- y+
> > --END GEEK CODE BLOCK--


Martin Schreiber
Im Muehltal 48
91171 Greding

http://www.martin-schreiber.net
SchreiberX@Altmuehlnet.de

Wenn du kritisiert wirst, dann mu=DFt du irgend etwas richtig machen.
Denn man greift nur denjenigen an, der den Ball hat.
-- Bruce Lee

-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCS d s+: a-- C++ UL++ P+ L+++ E-- W+++ N o K- w---
O- M- V- PS+++ PE+ Y PGP++ t 5+ X R+ tv++ b+ DI- D++
G e h-- r-- y+
------END GEEK CODE BLOCK------

--=-MrftjHy+rTR5ZaLcQaje
Content-Disposition: attachment; filename=revert-geyersville3
Content-Type: text/plain; name=revert-geyersville3; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64

LS0tIGxpbnV4L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvYWNwaS5jCTIwMDMtMTAtMTIg
MTk6NDg6MzkuMDAwMDAwMDAwICswMjAwDQorKysgbGludXgtdG1wL2FyY2gvaTM4Ni9rZXJuZWwv
Y3B1L2NwdWZyZXEvYWNwaS5jCTIwMDMtMTItMTkgMTc6NDI6MzMuMDc2ODE0MTc2ICswMTAwDQpA
QCAtMjMxLDcgKzIzMSw3IEBADQogCWludAkJCXN0YXRlKQ0KIHsNCiAJdTE2CQkJcG9ydCA9IDA7
DQotCXUxNgkJCXZhbHVlID0gMDsNCisJdTgJCQl2YWx1ZSA9IDA7DQogCWludAkJCWkgPSAwOw0K
IAlzdHJ1Y3QgY3B1ZnJlcV9mcmVxcyAgICBjcHVmcmVxX2ZyZXFzOw0KIA0KQEAgLTI4Miw5ICsy
ODIsOSBAQA0KIAl2YWx1ZSA9ICh1MTYpIHBlcmYtPnN0YXRlc1tzdGF0ZV0uY29udHJvbDsNCiAN
CiAJQUNQSV9ERUJVR19QUklOVCgoQUNQSV9EQl9JTkZPLCANCi0JCSJXcml0aW5nIDB4JTA0eCB0
byBwb3J0IDB4JTA0eFxuIiwgdmFsdWUsIHBvcnQpKTsNCisJCSJXcml0aW5nIDB4JTAyeCB0byBw
b3J0IDB4JTAyeFxuIiwgdmFsdWUsIHBvcnQpKTsNCiANCi0Jb3V0dyh2YWx1ZSwgcG9ydCk7IA0K
KwlvdXRiKHZhbHVlLCBwb3J0KTsgDQogDQogCS8qDQogCSAqIFRoZW4gd2UgcmVhZCB0aGUgJ3N0
YXR1c19yZWdpc3RlcicgYW5kIGNvbXBhcmUgdGhlIHZhbHVlIHdpdGggdGhlDQpAQCAtMjk2LDEx
ICsyOTYsMTEgQEANCiAJcG9ydCA9IHBlcmYtPnN0YXR1c19yZWdpc3RlcjsNCiANCiAJQUNQSV9E
RUJVR19QUklOVCgoQUNQSV9EQl9JTkZPLCANCi0JCSJMb29raW5nIGZvciAweCUwNHggZnJvbSBw
b3J0IDB4JTA0eFxuIiwNCi0JCSh1MTYpIHBlcmYtPnN0YXRlc1tzdGF0ZV0uc3RhdHVzLCBwb3J0
KSk7DQorCQkiTG9va2luZyBmb3IgMHglMDJ4IGZyb20gcG9ydCAweCUwMnhcbiIsDQorCQkodTgp
IHBlcmYtPnN0YXRlc1tzdGF0ZV0uc3RhdHVzLCBwb3J0KSk7DQogDQogCWZvciAoaT0wOyBpPDEw
MDsgaSsrKSB7DQotCQl2YWx1ZSA9IGludyhwb3J0KTsNCisJCXZhbHVlID0gaW5iKHBvcnQpOw0K
IAkJaWYgKHZhbHVlID09ICh1MTYpIHBlcmYtPnN0YXRlc1tzdGF0ZV0uc3RhdHVzKQ0KIAkJCWJy
ZWFrOw0KIAkJdWRlbGF5KDEwKTsNCkBAIC0zMDksNyArMzA5LDcgQEANCiAJLyogbm90aWZ5IGNw
dWZyZXEgKi8NCiAJY3B1ZnJlcV9ub3RpZnlfdHJhbnNpdGlvbigmY3B1ZnJlcV9mcmVxcywgQ1BV
RlJFUV9QT1NUQ0hBTkdFKTsNCiANCi0JaWYgKHZhbHVlICE9ICh1MTYpIHBlcmYtPnN0YXRlc1tz
dGF0ZV0uc3RhdHVzKSB7DQorCWlmICh2YWx1ZSAhPSBwZXJmLT5zdGF0ZXNbc3RhdGVdLnN0YXR1
cykgew0KIAkJdW5zaWduZWQgaW50IHRtcCA9IGNwdWZyZXFfZnJlcXMubmV3Ow0KIAkJY3B1ZnJl
cV9mcmVxcy5uZXcgPSBjcHVmcmVxX2ZyZXFzLm9sZDsNCiAJCWNwdWZyZXFfZnJlcXMub2xkID0g
dG1wOw0K

--=-MrftjHy+rTR5ZaLcQaje--

--=-3Bz+/ItZj17t0e5uw0QX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/5HU6ZJRym+9E1msRAtLDAKDfLlrSl7T1GApvS9kjLM6RY5l+PgCfU7Gr
kJl1CXhSsavEsNui//Weuhw=
=IQNc
-----END PGP SIGNATURE-----

--=-3Bz+/ItZj17t0e5uw0QX--



--===============33331427006155323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============33331427006155323==--


