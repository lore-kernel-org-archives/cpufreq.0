From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] [RFC] [0/2] powernow-k7.  Recalibrate cpu_khz
Date: Sun, 21 Nov 2004 10:59:20 +0100
Message-ID: <20041121095920.GA14594@dominikbrodowski.de>
References: <20041118161034.GA31422@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0267357356=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041118161034.GA31422@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


--===============0267357356==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2004 at 05:10:34PM +0100, Bruno Ducrot wrote:
> Hi,
>=20
> Here come two patches in order to fix some issues with powernow-k7.
>=20
> The main trouble is that we can't rely on cpu_khz when that one is
> computed at boot time.  AMD will require that the CPU will be at max
> frequencies, but some BIOS do not respect this.  More, the BIOS is only
> required to change the frequency of the processor, but only at POST
> time.  Some BIOS also do not follow this rule, so that even if the
> processor is at full speed at POST, it may decide (probably after
> switching to ACPI or APM mode?) to switch to another frequency.
>=20
> The only workaround for this two kind of bugs I see is to recalibrate
> cpu_khz, but this require discussions with other people, I guess.  The
> second patch will be the powernow-k7 portion.

Very interesting approach -- and something which might be useful for the
ACPI cpufreq driver as well: by doing the cpu_khz re-calculation we can
check whether the speed changed --> finally a ->get() function [and one
which clearly shows that it may only be accessible to root] can be
implemented for this driver... Also, on "lost ticks" we might fall back to
try a cpu_khz re-calculation first...

However, I'd like to have John Stultz input on this -- especially as he
maintains the timing subsystem. And one problem I see is that we'd need to
update "loops_per_jiffy" accordingly...

Thanks,
	Dominik

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBoGb4Z8MDCHJbN8YRAlWGAJ9H4RAJX/JjeKXsm8TiHpTLbyCiIwCdHqjT
FmgUukeC/L8uFsWy2homfBI=
=dHNt
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============0267357356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0267357356==--

