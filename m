From: John Steele Scott <toojays@toojays.net>
Subject: Re: [PATCH] cpufreq support for 7447A on 2004 iBooks
Date: Wed, 16 Jun 2004 12:04:23 +0930
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200406161204.30453.toojays@toojays.net>
References: <200406051846.50718.toojays@toojays.net>
	<200406102105.27654.toojays@toojays.net>
	<1086883926.2977.145.camel@gaston>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1086883926.2977.145.camel@gaston>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: Text/Plain; charset="us-ascii"
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev list <linuxppc-dev@lists.linuxppc.org>, Christiaan Welvaart <cjw@daneel.dyndns.org>, cpufreq@www.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 11 Jun 2004 01:42 am, Benjamin Herrenschmidt wrote:
> > I have made a new patch for this, available from:
> > http://www.toojays.net/~toojays/misc/7447a_cpufreq_20040610.patch
>
> Looks good except for some coding style issues ;)
>
> Use spaces between } and else for example, there's also an if without a
> space before the ( and please, name the low level asm function low_* like
> the other ones, for consistency.

A new patch which addresses these issues is at:
http://www.toojays.net/~toojays/misc/7447a_cpufreq_20040616.patch

This is functionally identical to the previous patch.

cheers,

John
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Messages with missing or bad signatures may have been forged or modified in transit!

iD8DBQFAz7G10BW7kPcXjRURAmI0AJ0V9d5W//alEDnGyR+Yyq+2RkxZaQCfWS56
p4aPY2b81DVo22MOsVuxc90=
=2aBU
-----END PGP SIGNATURE-----
