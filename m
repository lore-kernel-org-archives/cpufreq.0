From: John Steele Scott <toojays@toojays.net>
Subject: Re: [PATCH] cpufreq support for 7447A on 2004 iBooks
Date: Thu, 10 Jun 2004 21:04:35 +0930
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200406102105.27654.toojays@toojays.net>
References: <200406051846.50718.toojays@toojays.net>
	<1086452473.12664.36.camel@gaston>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1086452473.12664.36.camel@gaston>
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

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sun, 6 Jun 2004 01:51 am, Benjamin Herrenschmidt wrote:
> I suggest you also look at the latest Darwin code Apple released, more
> sepecifically AppleMacRISC2PE. There is some new bits including something
> about tweaking a bus delay when changing the frequency on these models.

I had time to have a look at this today (actually, I didn't have time, but =
I=20
looked at it anyway :). There is a register in the UniNorth which controls=
=20
whether the address acknowledge will be delayed or not. This delay is not=20
required when running at high speed.

I have made a new patch for this, available from:
http://www.toojays.net/~toojays/misc/7447a_cpufreq_20040610.patch

This is a fair bit larger than the previous patch, as I have added a functi=
on=20
to the intrepid feature table to control the AACK delay. There is a slight=
=20
performance improvement for processes which are bound by memory latency (e.=
g.=20
repeatedly cat'ing a 180MB file to /dev/null takes 0.270s with this patch=20
versus 0.277s with the last one).

This patch also accepts the PowerBook5,4 models. One thing that needs check=
ing=20
as that the revision of UniNorth on this model is high enough for=20
intrepid_aack_delay_enable to do its thing. I just assumed that they have t=
he=20
same UniNorth, but I will ask in the forum thread which Colin pointed to=20
earlier tonight.

cheers,

John
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Messages with missing or bad signatures may have been forged or mo=
dified in transit!

iD8DBQFAyEdT0BW7kPcXjRURAvodAJ9tmfQG8xFLV9TsMGbz5rXKlIkaugCcDvz6
6dHegJ1k4AOaJkGQDbmOCBc=3D
=3DVbmY
=2D----END PGP SIGNATURE-----
