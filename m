From: Jay Goodman Tamboli <jay@tamboli.cx>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Sun, 6 Jul 2003 13:28:09 -0400
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030706172809.GA10482@localhost.localdomain>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr> <20030706012114.GW7796@poupinou.org> <1057511460.d2cf9bc12efe7@carlthompson.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1057511460.d2cf9bc12efe7@carlthompson.net>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: cpufreq@www.linux.org.uk


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 06, 2003 at 10:11:00AM -0700, Carl Thompson wrote:
> Quoting Ducrot Bruno <ducrot@poupinou.org>:
>=20
> > ...
>=20
> > There is a little bug in powernow-k7.c
>=20
> > ...
>=20
> > -		change_VID(fid);
> > -		change_FID(vid);
> > +		change_VID(vid);
> > +		change_FID(fid);
>=20
> > ...
>=20
> > It is not in mainline AFAIK.
>=20
> This "little bug" caused my computer to repeatedly crash with 2.4.21-ac4 =
and
> 2.5.72!  Not sure if it's in more recent kernels, but it was definitely in
> the mainline at that point.

(new to the list, so hopefully not beating dead horse here)

Yeah, I found this in 2.4.21-ac4, too, and was having
crashes.  Fixing this bug still causes lockups if I change
the cpufreq too drastically.  Going from one setting to the
next (i.e. not skipping any available speeds) seems to work
ok, though.  This is a Sony FR130, so is this the effect of
the PST problems discussed earlier?

/jgt
--=20
You can't spell "deadly heart palpitations" without "h-a-p-p-y".
        -- Jason Zych, on uiuc.general

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/CFwpn8BdKcvxgGIRAmpzAJ9W/bk9bVFaAKTDjFgrA10MsVcaeACfUljX
C+x8Jk+EheA+Yz01ozuWGgg=
=0uJl
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
