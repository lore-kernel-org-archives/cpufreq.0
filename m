From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8: support acpi
Date: Tue, 6 Apr 2004 18:55:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406165539.GA7376@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
	<20040402163902.GC5688@redhat.com>
	<20040402170926.GA289@elf.ucw.cz>
	<20040406130730.GA5133@redhat.com>
	<20040406145502.GA7307@dominikbrodowski.de>
	<20040406154750.GE6930@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0217066586=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040406154750.GE6930@redhat.com>
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


--===============0217066586==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2004 at 04:47:50PM +0100, Dave Jones wrote:
>=20
> I set it up this morning to do a snapshot each night along with the
> other trees one level up from there.  It'll continually keep one weeks
> worth of patches.

Excellent. Thanks for doing this.

>  > > <f> found a funny bug in the powernow-k8 acpi changes
>  > > <f> when  acpi is disabled processor.ko won't load, but the new modu=
le needs symbols from that
>  > > <f> i added a hack to keep it loaded anyways
>  > >=20
>  > > Be nice to get that fixed, and merged before these changes get pushe=
d to mainline.
>  >=20
>  > Hm. Keeping processor.ko loaded seems to be an ugly hack to me. Howeve=
r, I
>  > can't see a way (yet) how powernow-k8.ko can rely on processor.ko's ob=
jects
>  > but not depend on it if these are not neeeded (psb case).
>=20
> True, it's a sledgehammer to crack a walnut, but I'm not sure messing with
> weak symbols would be any cleaner,
What do you mean with "weak symbols"?

> and other than that or moving bits out
> to a seperate module (double ugh), I don't really have any ideas.
unfortunately, that's currently a no-go, unless you have 2+ weeks of spare
time. I once tried splitting acpi/drivers/processor.c up into several
modules [and export user-information in sysfs], but it was sooo messy=20
because the ACPI core lacks basic rules of reference counting. Additionally,
such a "new" module would rely on a "basic" ACPI - processor.ko module
again, which should fail to load, IMHO, if acpi is disabled. So it wouldn't
get us anything, I think.

	Dominik

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcuELZ8MDCHJbN8YRAjEQAKCJtpCCxiYYKtdvua3/3A3DjbqF0QCfakmw
KWWFQj86Cz4HxuXsbhCfPWg=
=f2nA
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--


--===============0217066586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0217066586==--

