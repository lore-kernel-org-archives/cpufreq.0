From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: CPUSpeed 1.1 released (finally)
Date: Sun, 09 Nov 2003 10:48:53 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1068371332.7434.3.camel@laptop.fenrus.com>
References: <1068264857.2c5ff476f0b29@carlthompson.net>
	<1068370287.7434.0.camel@laptop.fenrus.com>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============81040105540277874=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1068370287.7434.0.camel@laptop.fenrus.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Carl Thompson <cet@carlthompson.net>
Cc: NERvOus <nervous@nervous.it>, Gerald Teschl <Gerald.Teschl@univie.ac.at>, Christian Zoz <zoz@suse.de>, Enrico Tassi <tassi@cs.unibo.it>, CPUFreq Mailing List <cpufreq@www.linux.org.uk>


--===============81040105540277874==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-BCUK698+kTdiPYBGQey1"


--=-BCUK698+kTdiPYBGQey1
Content-Type: multipart/mixed; boundary="=-/HIOs7G3OZUKgGxNfgDU"


--=-/HIOs7G3OZUKgGxNfgDU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-11-09 at 10:31, Arjan van de Ven wrote:
> On Sat, 2003-11-08 at 05:14, Carl Thompson wrote:
> > I have finally gotten around to releasing CPUSpeed v1.1 (formerly named
> > cpufreq but that was too confusing).  CPUSpeed is yet another program
> > (actually the first, I think?) to control CPU speed based on idle, AC
> > connection and CPU temperature using the CPUFreq userspace governor.
>=20
> Really really nice!
> However one minor nitpick: It's not allowed to call fopen() from a
> signal handler....... I'll try to work up a patch for this and send it=20

patch attached; it also converts usleep to nanosleep which I've been
told is the much better API for this sort of thing anyway.

It turns out that the code never really actually set an alarm, but
really just raise()'d the signal instead of doing a function call....=20


--=-/HIOs7G3OZUKgGxNfgDU
Content-Disposition: attachment; filename=cpuspeed.patch
Content-Type: text/x-patch; name=cpuspeed.patch; charset=UTF-8
Content-Transfer-Encoding: base64

ZGlmZiAtcHVyTiBjcHVzcGVlZC0xLjEvY3B1c3BlZWQuY2MgY3B1c3BlZWQvY3B1c3BlZWQuY2MN
Ci0tLSBjcHVzcGVlZC0xLjEvY3B1c3BlZWQuY2MJMjAwMy0xMS0wOCAwMDowNzoxNC4wMDAwMDAw
MDAgKzAxMDANCisrKyBjcHVzcGVlZC9jcHVzcGVlZC5jYwkyMDAzLTExLTA5IDEwOjQ2OjMyLjAw
MDAwMDAwMCArMDEwMA0KQEAgLTQ0MCw5ICs0NDAsMTIgQEAgbWFpbih1bnNpZ25lZCBhcmdjLCBj
aGFyICogYXJndltdKQ0KICAgICAgICAgVVNFUlNQQUNFID0gU1lTRlNfVVNFUlNQQUNFOw0KICAg
ICB9DQogDQotICAgIHVuc2lnbmVkIGludGVydmFsID0gMjA7IC8vIDIgc2Vjb25kcw0KKyAgICBz
dHJ1Y3QgdGltZXNwZWMgaW50ZXJ2YWw7DQogICAgIGJvb2wgZGFlbW9uaXplID0gZmFsc2U7DQog
DQorICAgIGludGVydmFsLnR2X3NlYyA9IDIwOw0KKyAgICBpbnRlcnZhbC50dl9uc2VjID0gMDsN
CisNCiAgICAgLy8gcGFyc2UgYXJndg0KICAgICBmb3IodW5zaWduZWQgaSA9IDE7IGkgPCBhcmdj
OyBpKyspDQogICAgIHsNCkBAIC00NTMsNyArNDU2LDcgQEAgbWFpbih1bnNpZ25lZCBhcmdjLCBj
aGFyICogYXJndltdKQ0KICAgICAgICAgICAgIGlmIChhcmdjIDw9IGkgKyAxKQ0KICAgICAgICAg
ICAgICAgICBkaWUoZmFsc2UsICJUaGUgLWkgb3B0aW9uIG11c3QgYmUgZm9sbG93ZWQgYnkgYW4g
aW50ZXJ2YWwgaW4gdGVudGhzIG9mIGEgc2Vjb25kXG4iKTsNCiANCi0gICAgICAgICAgICBpbnRl
cnZhbCA9IGdldF9pbnQoYXJndlsrK2ldKTsNCisgICAgICAgICAgICBpbnRlcnZhbC50dl9zZWMg
PSBnZXRfaW50KGFyZ3ZbKytpXSk7DQogICAgICAgICAgICAgZXJycHJpbnRmKCJJbnRlcnZhbCBp
cyAldVxuIiwgaW50ZXJ2YWwpOw0KIA0KICAgICAgICAgfQ0KQEAgLTU2MiwxNSArNTY1LDE1IEBA
IG1haW4odW5zaWduZWQgYXJnYywgY2hhciAqIGFyZ3ZbXSkNCiAgICAgLy8gYmxvY2sgYWxsIG9m
IG91ciBzaWduYWxzIGR1cmluZyBlYWNoIHNpZ25hbCBoYW5kbGVyIHRvIGF2b2lkIHBvc3NpYmxl
DQogICAgIC8vIHJhY2UgY29uZGl0aW9uIChub3QgdGhhdCBpdCB3b3VsZCByZWFsbHkgbWF0dGVy
KQ0KICAgICBzaWdlbXB0eXNldCgmc2lnbmFsX2FjdGlvbi5zYV9tYXNrKTsNCi0gICAgc2lnYWRk
c2V0KCZzaWduYWxfYWN0aW9uLnNhX21hc2ssIFNJR0FMUk0pOw0KKy8vICAgIHNpZ2FkZHNldCgm
c2lnbmFsX2FjdGlvbi5zYV9tYXNrLCBTSUdBTFJNKTsNCiAgICAgc2lnYWRkc2V0KCZzaWduYWxf
YWN0aW9uLnNhX21hc2ssIFNJR1VTUjEpOw0KICAgICBzaWdhZGRzZXQoJnNpZ25hbF9hY3Rpb24u
c2FfbWFzaywgU0lHVVNSMik7DQogICAgIHNpZ2FkZHNldCgmc2lnbmFsX2FjdGlvbi5zYV9tYXNr
LCBTSUdIVVApOw0KICAgICBzaWduYWxfYWN0aW9uLnNhX2ZsYWdzID0gMDsNCiANCiAgICAgLy8g
c2V0IHRoZSBTSUdBTFJNIGhhbmRsZXIgdG8gb3VyIGZ1bmN0aW9uDQotICAgIHNpZ25hbF9hY3Rp
b24uc2FfaGFuZGxlciA9IGFsYXJtX2hhbmRsZXI7DQotICAgIHNpZ2FjdGlvbihTSUdBTFJNLCAm
c2lnbmFsX2FjdGlvbiwgMCk7DQorICAgIC8vIHNpZ25hbF9hY3Rpb24uc2FfaGFuZGxlciA9IGFs
YXJtX2hhbmRsZXI7DQorICAgIC8vIHNpZ2FjdGlvbihTSUdBTFJNLCAmc2lnbmFsX2FjdGlvbiwg
MCk7DQogDQogICAgIC8vIHNldCB0aGUgU0lHVVNSMSBoYW5kbGVyIHRvIG91ciBmdW5jdGlvbg0K
ICAgICBzaWduYWxfYWN0aW9uLnNhX2hhbmRsZXIgPSB1c3IxX2hhbmRsZXI7DQpAQCAtNTk1LDgg
KzU5OCw4IEBAIG1haW4odW5zaWduZWQgYXJnYywgY2hhciAqIGFyZ3ZbXSkNCiAgICAgLy8gbWFp
biBsb29wDQogICAgIHdoaWxlICgxKQ0KICAgICB7DQotICAgICAgICByYWlzZShTSUdBTFJNKTsN
Ci0gICAgICAgIHVzbGVlcChpbnRlcnZhbCAqIDEwMDAwMEwpOw0KKwlhbGFybV9oYW5kbGVyKDAp
Ow0KKwluYW5vc2xlZXAoJmludGVydmFsLCBOVUxMKTsNCiAgICAgfQ0KIA0KICAgICAvLyBuZXZl
ciByZWFjaGVkDQo=

--=-/HIOs7G3OZUKgGxNfgDU--

--=-BCUK698+kTdiPYBGQey1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/rg2ExULwo51rQBIRAiB4AKCHx2Y3Ab87XdAzB/wCeuU1YqeG6ACfRTNU
HoYWINhoUAB83HlLTzunak8=
=Gf+M
-----END PGP SIGNATURE-----

--=-BCUK698+kTdiPYBGQey1--


--===============81040105540277874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============81040105540277874==--

