From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [RFC] cpufreq_get()
Date: Sat, 24 Jan 2004 21:34:41 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040124203441.GC6825@dominikbrodowski.de>
References: <20040122190649.GC25416@poupinou.org>
	<20040122205620.GA8012@dominikbrodowski.de>
	<20040123100334.GD25416@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============32688211616751284=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040123100334.GD25416@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


--===============32688211616751284==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2004 at 11:03:34AM +0100, Ducrot Bruno wrote:
> Anyway, this must be optional because the ACPI performance driver can't
> detect speed...

The hardware variant, yes. But for ACPI we can return what the cpufreq core
thinks the current speed is.

	Dominik

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAEtbhZ8MDCHJbN8YRAnqqAJwIokTZVT8r3JoI5Xg5jhJQCuqOpACfRkIb
UIK77oUzFS4XoSKnyzmwvNs=
=RLA6
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--


--===============32688211616751284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============32688211616751284==--

