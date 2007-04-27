From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2] [2.6.22] pasemi: cpufreq driver
Date: Fri, 27 Apr 2007 11:40:03 +0200
Message-ID: <1177666803.7828.30.camel@johannes.berg>
References: <20070425204633.GC19781@lixom.net>
	<20070426053700.GA23922@lixom.net>
	<1177583160.6814.37.camel@johannes.berg>
	<20070426203710.GB17302@lixom.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0772450249=="
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20070426203710.GB17302@lixom.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Mime-version: 1.0
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Olof Johansson <olof@lixom.net>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, paulus@samba.org, arnd@arndb.de, cpufreq@lists.linux.org.uk


--===============0772450249==
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mUg4s20WoJnePDUqzhIL"


--=-mUg4s20WoJnePDUqzhIL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2007-04-26 at 15:37 -0500, Olof Johansson wrote:

> You can set the requested speed per-processor, but the actual speed
> will be the max of them. Because of this, it's less surprising to set
> it on both at the same time since then you'll at least know what you're
> running at.
>=20
> So yes, I'll change it to online_map instead of possible_map.

Ok, yeah, so effectively they all just go together (that additional
complication of running at the max probably should be hidden as you
note)

> Hmm, I just tried adding debugging to the cpu_init code, and I'm not
> seeing it called more than once (i.e. only for cpu 0). Mind you, I don't
> have cpu hotplug support at this time.

Oh right, you need cpu hotplug support for the bug to show up. What
happens then is you unplug and replug a CPU and the sysfs cpufreq stuff
for the CPU you just replugged is gone.

johannes

--=-mUg4s20WoJnePDUqzhIL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iD8DBQBGMcTz/ETPhpq3jKURAqPRAKCM6VZoX11OIWIN/EzQLp60ly2YDwCgmz2a
Xsr6asMNPK9qt4benaVz8MU=
=VSPs
-----END PGP SIGNATURE-----

--=-mUg4s20WoJnePDUqzhIL--


--===============0772450249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@ozlabs.org
https://ozlabs.org/mailman/listinfo/linuxppc-dev
--===============0772450249==--

