From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8, more updates
Date: Wed, 17 Mar 2004 13:44:32 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040317124432.GA7426@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1126A014@txexmtae.amd.com>
	<20040317100745.GA15284@dominikbrodowski.de>
	<20040317120409.GA482@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1238047971=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040317120409.GA482@elf.ucw.cz>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Pavel Machek <pavel@ucw.cz>
Cc: Cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============1238047971==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2004 at 01:04:09PM +0100, Pavel Machek wrote:
> - *  (C) 2003 Dave Jones <davej@codemonkey.ork.uk> on behalf of SuSE Labs
> + *  (C) 2003 Dave Jones <davej@codemonkey.org.uk> on behalf of SuSE Labs

either I'm blind or stupid... what's the difference here?

> +		printk(KERN_INFO PFX "   %d : fid %x (%d MHz), vid %x\n", j,
> +		       pst[j].fid, powernow_table[j].frequency/1000, pst[j].vid);

> +
> +	printk(KERN_INFO PFX "cfid %x, cvid %x\n", data->currfid, data->currvid);

can we change this to dprintk, please? It avoids some noise....

Other than that, patch looks good to me

	Dominik

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAWEgwZ8MDCHJbN8YRAjvBAJ0YK6Q/9UJbMfY+1MhaRY+cPdi/RwCeKwAC
b0dOCucj7Iv49JpsryDXCpw=
=/uV5
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============1238047971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1238047971==--

