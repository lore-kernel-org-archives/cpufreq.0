From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 18:39:55 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402163955.GA7034@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1834666697=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040402162447.GP19001@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Andrew Morton <akpm@osdl.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>, Dave Jones <davej@redhat.com>, paul.devriendt@amd.com


--===============1834666697==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 02, 2004 at 06:24:47PM +0200, Bruno Ducrot wrote:
> But I can't say for sure which have to be favored: legacy or ACPI.
> I don't have enough dump of ACPI tables and PSB/PST from machines shipped
> with AMD64.

AFAIK, AMD will deprecate PSB/PST soon, so ACPI should be favoured.

	Dominik
--DocE+STaALJfprDB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAbZdbZ8MDCHJbN8YRAg1CAJsGkHx+6YGw94dpNsbkjUHx8tYSowCdGeg2
bq/yPYKGDDEDdRnFGMipNmU=
=M0tb
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--


--===============1834666697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1834666697==--

