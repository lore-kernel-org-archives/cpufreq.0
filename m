From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 0/5] Clean up x86 CPU auto-loading
Date: Sat, 11 Feb 2012 22:44:16 +0000
Message-ID: <1329000256.325.48.camel@deadeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hlG/ip2dduj/cPnUc1lM"
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, Thomas Renninger <trenn@suse.de>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org


--=-hlG/ip2dduj/cPnUc1lM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series fixes a number of apparent bugs in the recent changes to
enable auto-loading by x86 CPU ID.

Ben.

Ben Hutchings (5):
  x86/cpu: Fix overrun check in arch_print_cpu_modalias()
  x86/cpu: Clean up modalias feature matching
  intel_idle: Fix ID for Nehalem-EX Xeon in device ID table
  intel_idle: Revert change of auto_demotion_flags for Nehalem
  powernow-k7: Fix CPU family number

 arch/x86/kernel/cpu/match.c   |    5 ++---
 drivers/cpufreq/powernow-k7.c |    2 +-
 drivers/idle/intel_idle.c     |   12 ++++--------
 scripts/mod/file2alias.c      |    5 +++--
 4 files changed, 10 insertions(+), 14 deletions(-)

--=20
1.7.9



--=-hlG/ip2dduj/cPnUc1lM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATzbvQOe/yOyVhhEJAQq82hAA1ZDowaciAZ2MLM/WEMRsvGLyP5EhvkDu
rWSb8UQQ/klTIqjYiJM4M0TVOfro+RqR5zojJJX0ZrjEUg0h8V5sfXctgREvFGWB
zO2PlJVmBKgVo2uXl9pEXbc5DIo2nqp2+BkNLnVZo8oLbXfjXCCIsHrERGOvZ678
rqXDAVqxalK3tVHmkKAJak45K7ZslmNkvFCJJgKlSGFUDCbO50v1rM1r1fmoP5cI
fvjVQW0dN8adxCpedOh6bPLr7oZGf9rug82xBTDqKB3RzV5fA/byrKAzKbymPw3E
YCw+/BrSt/5Ej6eFuytTLgJdiTJ4LHiQv+89JNxLOjaXgrivaZfbtB3PoExa4dJg
dppNakwGHVce5SQnffihWy/b0rPlUFWey+vTrQSpTIrgAF/Pyg1VugUWVzg/EVDH
6OWC2OIVKqT4OrrMjX9jgQ4aeQUmZMOXFHruTHG03xqDyBxolQS4CxwGBmaVMO8D
U9525bgG27BUmYqKmwXgAq+vqzitcNcGi7NFp/Kfth/LkzXrGdKkqlvfVM8OlLEM
ZRWN/9rFzxxAxkKsgap+f9bJuAJicyotkSEBZxFXsIhaQUVh+CNjrP1+XDEh7sTw
TOhJaZJgTN5XA0TGANhL9obweY2LXk92rfUuQ16BlXCVCL+JKil4vaS/qLiy0rw1
TLW7E4oJqDQ=
=6Pck
-----END PGP SIGNATURE-----

--=-hlG/ip2dduj/cPnUc1lM--
