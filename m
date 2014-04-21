From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Another powernow-k6 bug
Date: Mon, 21 Apr 2014 12:45:51 +0100
Message-ID: <1398080751.3624.97.camel@deadeye.wl.decadent.org.uk>
References: <1397676206.5717.7.camel@deadeye.wl.decadent.org.uk>
	 <CAOh2x=ndnFUBphVYGRL+x2jra36VS1T_F=sMpkAgm9xi52Qvvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Vf/vxmyTJyXqphSEqgXq"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=ndnFUBphVYGRL+x2jra36VS1T_F=sMpkAgm9xi52Qvvg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mikulas Patocka <mpatocka@redhat.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>


--=-Vf/vxmyTJyXqphSEqgXq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-04-21 at 11:03 +0530, Viresh Kumar wrote:
> On Thu, Apr 17, 2014 at 12:53 AM, Ben Hutchings <ben@decadent.org.uk> wro=
te:
> > While looking at your recent powernow-k6 fixes (thanks for those), I
> > noticed that powernow_k6_cpu_exit() doesn't work properly:
> >
> > static int powernow_k6_cpu_exit(struct cpufreq_policy *policy)
> > {
> >         unsigned int i;
> >         for (i =3D 0; i < 8; i++) {
> >                 if (i =3D=3D max_multiplier)
> >                         powernow_k6_set_state(i);
> >         }
>=20
> Yeah, there is a issue there. But why do we need to set freq to
> highest freq on exit()? Probably this code can be simply removed?
[...]

Because that is how the CPU was running before the driver was loaded.

Ben.

--=20
Ben Hutchings
Knowledge is power.  France is bacon.

--=-Vf/vxmyTJyXqphSEqgXq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU1UE7+e/yOyVhhEJAQpWwRAAwx/P16RgxfblUivldve1mRWx6x2+jIPI
Fs0bmi3muE9d1DeAHr6PVa+9aQDQzUdlIkeZdCMeF7WNVt4lDlr8+X/HU1mCJHY4
qky5bRIb42Thqh2zJ0sPMEBLrGf1goJkLp3iia3q63s00EO1JGgkRc3XYMDyRQrj
ufQHsVpFDqLhUHkVhzN20JuBzyZBcNphiSDjYpfUm5GtbN+3J1BkpCFLj8W27B+b
1iB7XJgNFzpbKELHhgqJyH0ngM38MnG9D8+EJSrnnpaXjfylKssrFBlUBfSfD7to
mxDfEx7iI7fyhjl3UVc+FAqbAyzRLqz9Gw6QDXKEBESnY/Gp+n7IOiEfrVVpnPms
aCJpsm6bmbIdxtQ2LZ7N1TnCWykIY3BANadR5ZkaeLkbyOwhHKqViShIiUNEiQdy
X3O55p1sfHCa9a2IvWyzO1AHXWuMVeg6zNokCATiR2SMxJ9H816logfSxtvUxnuM
+yyAYpF5KhXo27gFgCYf2AxlyoYUPbhnpxlZdEIOIYEQxiYnLNxH4C8FSJW1uwpu
XsMaI/yZUFAq78xtJkENOUNVov66PESBHpfmyOrbIr90DgZPNG8Nmr5f9k/pQ/Rl
bwmM3L/gazLWv2zI1yW3BhzvAXucmBI39ZpeWg2EUr2w07lglHBZKVwn1hwIhapa
22gSLdkBuFo=
=5bAM
-----END PGP SIGNATURE-----

--=-Vf/vxmyTJyXqphSEqgXq--
