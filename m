From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Thu, 05 Aug 2004 16:19:30 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091737170.10552.32.camel@pc>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0899179738=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040805200857.GA28775@redhat.com>
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
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk


--===============0899179738==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-uSJMAWu5EfqgfQ+W5qO7"


--=-uSJMAWu5EfqgfQ+W5qO7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-05 at 21:08 +0100, Dave Jones wrote:
> Although that should have
> triggered this message..
>=20
>     if (!fsb)
> 	        printk(KERN_DEBUG "speedstep-lib: couldn't detect FSB speed. Ple=
ase send an e-mail to <linux@brodo.de>\n");

At KERN_DEBUG though.  My /proc/sys/kernel/printk is at:

$ cat /proc/sys/kernel/printk
6       4       1       7

I don't recall how those 4 fields work.  Will I get KERN_DEBUG on the
console with those settings?

> Might be useful, though right now, my bets are on an unknown FSB.

Yeah, me too.  Any (one have any) idea how to calculate fsb for that
sucker?  I may as well throw that code in there too to see if it
alleviates the problem.

b.


--=-uSJMAWu5EfqgfQ+W5qO7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBEpZSl3EQlGLyuXARAh8TAKCSpqUjiPiAf98wc6j1Gki5uNz64wCaA7Bg
XGZmnlVN0xcnG4SkSxJh4Uk=
=4Wge
-----END PGP SIGNATURE-----

--=-uSJMAWu5EfqgfQ+W5qO7--



--===============0899179738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0899179738==--


