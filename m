From: Wouter Verhelst <wouter@grep.be>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sat, 10 Jan 2004 17:30:36 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040110163036.GC10531@grep.be>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<1073746849.1047.14.camel@worldmusic.grep.be>
	<20040110153834.GA8303@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============50568125235854255=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040110153834.GA8303@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============50568125235854255==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2004 at 04:38:34PM +0100, Dominik Brodowski wrote:
> > Note that I had to reboot my box to unload the module. This is probably
> > related to the above, but just in case it isn't: I cannot rmmod the
> > p4-clockmod module, trying anyway results in rmmod segfaulting -- at
> > least once the frequency has been altered. I didn't reboot again just to
> > test that, but if you want, it's no problem.
>=20
> That's unrelated, and I was able to reproduce it on my notebook as well. =
The
> attached patch [which should apply with some offset] should fix that.

OK, thanks.

[...]
> On Sat, Jan 10, 2004 at 04:02:52PM +0100, Wouter Verhelst wrote:
> > > What does /proc/cpuinfo say before modprobing p4-clockmod, and
> > > after modprobing p4-clockmod?
> >=20
> > The only difference with the one you already have is the Mhz number
> > (which seems logical). Before it's loaded, it's at 2194.424;
> > Immediately after loading p4-clockmod, that number was still the
> > same, but in the mean time it went back to 1919.054
>
> I think ACPI is messing with us. It detects a high temperature
> situation, tries to scale down the CPU, and forces down the CPU speed.

Hm. This one got me thinking; I think I just found it. I forgot that I
installed cpufreqd a while ago, which seems to be the culprit: when I
start cpufreqd, the system falls back to 1925Mhz. I've removed it now,
however, as killing cpufreqd does not release the maximum speed back to
it's normal value of 2.2Ghz, I'm not entirely sure; so...

> Could you send me the output of /proc/acpi/processor/*/* and
> /proc/acpi/thermal_zone/*/* when you notice this situation again?

=2E.. I've still put those at
http://users.pandora.be/wouter.verhelst/proc-acpi.tgz

> BTW, could it be that this is still the 2.6.0 module, instead of the
> 2.6.1 variant? 2.6.1 should report more "clean" values in
> /sys/devices/system/cpu/cpufreq/... it should report 2200000 instead
> of 2193205.

Yes, the first mail I sent (with the command line stuff in /sys) was
before I installed 2.6.1, still running 2.6.0 at that point. Sorry for
the confusion :-)

--=20
Wouter Verhelst
Debian GNU/Linux -- http://www.debian.org
Nederlandstalige Linux-documentatie -- http://nl.linux.org
"Stop breathing down my neck." "My breathing is merely a simulation."
"So is my neck, stop it anyway!"
  -- Voyager's EMH versus the Prometheus' EMH, stardate 51462.

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAACisWgZ1HEtaPf0RArNzAJ9+DNuUVXJZ8LXL4pz0RkMBrgJxXACfdWti
GPc2bAr8K/USX4XxaRmdelM=
=tvS5
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--


--===============50568125235854255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============50568125235854255==--

