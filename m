From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Crusoe and 2.6.1 confusion
Date: Sat, 24 Jan 2004 21:30:03 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040124203003.GA6825@dominikbrodowski.de>
References: <20040123180741.4e7f8452.johannes_graumann@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============48418268645979268=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040123180741.4e7f8452.johannes_graumann@web.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Johannes Graumann <johannes_graumann@web.de>
Cc: cpufreq@www.linux.org.uk


--===============48418268645979268==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2004 at 06:07:41PM -0800, Johannes Graumann wrote:
> Hello,
>=20
> I'm trying to optimize my 2.6.1 home grown kernel for my fujitsu life
> book, which runs from a Transmeta Crusoe processor. I have learned from
> the debian-laptop list, that this processor doesn't need any Governor or
> cpufreqd, since it does the job by default.
> In my .config I have the following flags set:
> CPU_FREQ
> X86_LONGRUN
>=20
> CPU_FREQ_DEFAULT_GOV_PERFORMANCE is set as a default - even if the
> Crusoe doesn't need a Governor, I can't get rid of this.

Yes, this is still needed at the moment even if longrun doesn't use it.
Working on it, though...

> Is this all I need? Will this create the interface that longrun will
> interact with?
It should. In /sys/devices/system/cpu/cpu0/cpufreq/

	Dominik

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAEtXLZ8MDCHJbN8YRAhdmAJwIUbAo+qDWiYcK9fNQQtJXD9X6PQCcCkhs
TQgOOqrshmvBt8+9HH15tIM=
=S/NO
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--


--===============48418268645979268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============48418268645979268==--

