From: emmel <the_emmel@gmx.net>
Subject: Weird behaviour
Date: Tue, 5 Aug 2003 09:17:04 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <03080509170400.00210@gate>
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

I posted that before: on my Acer Aspire 1302XV (AMD Athlon 1600+) cpufreq=
=20
will scale down the frequency when loaded. However, it scales it down far=
 too=20
much and it's impossible to get back full power without rebooting. Withou=
t=20
the powernow-k7 module loaded I have 1400MHz, with it loaded 800/633MHz=20
(depending on me telling it to use as much or as few power as possible).=20
Unloading the module doesn't do anything (just removes the interface - i=20
guess that's how it is supposed to work). So how do I get it to work=20
correctly? I have the newest BIOS available and I *had* it working correc=
tly=20
at one point (but I don't have the kernel configuration for it anymore). =
Any=20
suggestions on how to solve that problem are welcome. Oh, I'm using 2.4.2=
0=20
with the latest patch for it, but that same problem occurs on 2.5.72 and=20
2.6.0-test1.
- --=20
Michael Filz

GPG 1.2.1 signed
Fingerprint: 60B4 D8E3 9617 900C 6726  168F D677 5AAD D40F CCE7
Certserver : ldap://certserver.pgp.com

Hi, I'm a .sig virus. Just copy me to your .signature. And don't worry.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/L1n41ndardQPzOcRAnUMAKD6CjBDsuwSBXRWn+nCiD8w9sOSVgCfcl5R
M2cFRZqjEG4p4uRIJ8ujF7s=3D
=3DChp5
-----END PGP SIGNATURE-----
