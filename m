From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sun, 11 Jan 2004 18:35:47 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040111173547.GB5485@dominikbrodowski.de>
References: <20040110163036.GC10531@grep.be> <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
	<20040110163212.GD10531@grep.be>
	<20040110185308.GZ14031@poupinou.org>
	<20040110193526.GM10531@grep.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============72853379458893741=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040110163036.GC10531@grep.be> <20040110193526.GM10531@grep.be>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Wouter Verhelst <wouter@grep.be>
Cc: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============72853379458893741==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2004 at 08:35:26PM +0100, Wouter Verhelst wrote:
> That happens both when it's in P0 or P1.

So ACPI works to set the processor in P0 and P1? If so, you really really
should use the ACPI cpufreq driver instead of the p4-clockmod driver. The
former will offer you true "SpeedStep" support, the latter only some clock
modulation which won't save you much energy as ACPI supports the C2 idle
state anyway.=20

> Not that it matters -- p4-clockmod seems to do it right :)

It's not as noisy, indeed. But it's not right -- as long as acpi.ko works.

> > I think ACPI is messing with us. It detects a high temperature
> > situation, tries to scale down the CPU, and forces down the CPU speed.
>=20
> Hm. This one got me thinking; I think I just found it. I forgot that I
> installed cpufreqd a while ago, which seems to be the culprit: when I
> start cpufreqd, the system falls back to 1925Mhz. I've removed it now,
> however, as killing cpufreqd does not release the maximum speed back to
> it's normal value of 2.2Ghz, I'm not entirely sure; so...
>=20
> > Could you send me the output of /proc/acpi/processor/*/* and
> > /proc/acpi/thermal_zone/*/* when you notice this situation again?
>=20
> ... I've still put those at
> http://users.pandora.be/wouter.verhelst/proc-acpi.tgz

Hm, can't recognize anything strange there. When the situation appears
again, what does /sys/devices/sytem/cpu/cpu0/cpufreq/scaling_max_freq say?

> > BTW, could it be that this is still the 2.6.0 module, instead of the
> > 2.6.1 variant? 2.6.1 should report more "clean" values in
> > /sys/devices/system/cpu/cpufreq/... it should report 2200000 instead
> > of 2193205.
>=20
> Yes, the first mail I sent (with the command line stuff in /sys) was
> before I installed 2.6.1, still running 2.6.0 at that point. Sorry for
> the confusion :-)

No problem :-)

	Dominik


--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAAYlzZ8MDCHJbN8YRAjqjAKCMzthhRgvFn4VH6X3OF/aeUC/OrACfYW1z
a0vRaIL/vAyuB78MrTBvKIo=
=h/+Q
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--


--===============72853379458893741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============72853379458893741==--

