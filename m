From: Alexander Clouter <alex-kernel@digriz.org.uk>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 09:39:05 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041018083905.GC3311@inskipp.digriz.org.uk>
References: <88056F38E9E48644A0F562A38C64FB60031DA073@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1287805082=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60031DA073@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk, Con Kolivas <kernel@kolivas.org>, linux-kernel@vger.kernel.org


--===============1287805082==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 17, Pallipadi, Venkatesh wrote:
>=20
> [snipped]
>=20
> We can never accurately predict freq for some future load.=20
> Say a CPU capable of 600, 800, 1000, 1200 and 1400 KHz, is=20
> running at 600 and we have sudden 100% CPU utilization, then=20
> we cannot precisely say which should be the next freq. It=20
> can be any of the higher possible freqs. And we felt performance=20
> should get a higher priority whenever there is some=20
> tradeoffs like this.
>=20
it took me a while to work out why speed decreasing was 'working' whilst=20
speed increasing was not with my method; a good hour finding out that the=
=20
cpufreq (correctly) goes to the lowest match.

My approach was not to try and avoid predicting the desired freq, it was ju=
st=20
to increase it...well on demand at a steady rate towards 100% and then once=
=20
the load disappears to reduce it.  Having used powernowd and found it do th=
at=20
rather nicely, then seeing the inclusion of cpufreq_ondemand, I tweaked=20
cpufreq_ondemand to replace powernowd.

I'm all for "this really should be done in userspace", but for something li=
ke=20
this I have a nagging feeling that its neater in kernel-space.  Of course t=
he=20
userspace one has the advantage (I think cpufreqd does it) that you can=20
decide if you want to increase the freq depending on what applications are=
=20
running.

Of course you are using CPU cycles, though bearly any, to have this floatin=
g=20
requested_freq variable.  Of course I would love this to be in the kernel,=
=20
mainly though I wanted people to improve upon it and such.

Meanwhile I am thinking of moving that freq_step variable bits to the /sys=
=20
show/store functions to remove a avoidable divide.

Cheers

Alex

--=20
 ____________________________________=20
/ Let your conscience be your guide. \
|                                    |
\ -- Pope                            /
 ------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBc4EpNv5Ugh/sRBYRAsAKAKCbKE4vAfsENeIGAllcBdHond6aeACbBXIx
/AWB9q6WjcMdY2iJ1307JZ4=
=06fw
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--


--===============1287805082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1287805082==--

