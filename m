From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8: support acpi
Date: Tue, 6 Apr 2004 23:57:23 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406215723.GA11611@dominikbrodowski.de>
References: <20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
	<20040402163902.GC5688@redhat.com>
	<20040402170926.GA289@elf.ucw.cz>
	<20040406130730.GA5133@redhat.com>
	<20040406145502.GA7307@dominikbrodowski.de>
	<20040406154750.GE6930@redhat.com>
	<20040406165539.GA7376@dominikbrodowski.de>
	<20040406170506.GG6930@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0185160108=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040406170506.GG6930@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, Bruno Ducrot <ducrot@poupinou.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>, paul.devriendt@amd.com


--===============0185160108==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2004 at 06:05:06PM +0100, Dave Jones wrote:
> On Tue, Apr 06, 2004 at 06:55:39PM +0200, Dominik Brodowski wrote:
>  > > True, it's a sledgehammer to crack a walnut, but I'm not sure messin=
g with
>  > > weak symbols would be any cleaner,
>  > What do you mean with "weak symbols"?
>=20
> see for example how cond_syscall is implemented.

/me still doesn't get the logic behind this, as I don't understand asm
magic... but well, maybe others can and find a _good_ way to get around this
problem.

	Dominik
--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcyfDZ8MDCHJbN8YRAmoiAKCNfyXH+OMrwC3xU8aI22utyAYGrgCeJ+Lr
EveUCKH1VW1AMrmkSEVgcs4=
=NfU5
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--


--===============0185160108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0185160108==--

