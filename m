From: emmel <the_emmel@gmx.net>
Subject: powernow-k7 (again) on 2.4.20
Date: Mon, 21 Jul 2003 08:30:21 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <03072108302101.00222@gate>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I've posted that before, but I've serious trouble with cpufreq. It return=
s=20
once loaded it makes the CPU speed drop from 1.4GHz to 800MHz (666 when=20
throttled). If the kde info thingy is somewhat relyable at all that's for=
=20
real - the bogomips drop as well. Returning to 1.4GHz seems impossible=20
without restarting (I've tried unloading the module). Somehow cpufreq get=
s=20
the stupid idea that the CPU is scaleable between 500 and 600MHz which ha=
s to=20
be the reason for those odd results. We are talking about a Mobile Athlon=
 XP=20
1600+ here, BTW (though it's reported by linux as a 1500+). If you ask me=
=20
that's a serious problem. The odd thing, however, is that it didn't happe=
n=20
with the same kernel version before. Maybe it depends on some intel code =
to=20
work correct (I used to have the CPU in the kernel set to PIII, now it's=20
correctly at Athlon) or maybe it has something to do with the swsp patch =
that=20
I *don't* have applied to my actual kernel. HELP!
The same odd behavior(sp?) appears with clean 2.5.72 and 2.6.0-test1 kern=
els.
- --=20
emmel <the_emmel@gmx.net>

Official AGC feedback maniac

"God is playing creatures - and we're the norns."

"A hundred dead are a tragedy - a hundred thousand are statistics."

"I guess you can call yourself lucky." -
"I could, but Linda suits me a little better... :)
Things called lucky tend to get hit by trucks."

GPG 1.2.1 signed
Fingerprint: 60B4 D8E3 9617 900C 6726  168F D677 5AAD D40F CCE7
Certserver : ldap://certserver.pgp.com

Hi, I'm a .sig virus. Just copy me to your .signature. And don't worry.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/G4h91ndardQPzOcRAiOjAKCVDYOIMqAxMfRg6KzP10gJqbpIFwCg76XC
H2bqYbCAIlW+8mX1VvkoquI=3D
=3DsYyM
-----END PGP SIGNATURE-----
