From: Mark Watts <m.watts@eris.qinetiq.com>
Subject: Re: Dell Latitude C400 - is this SpeedSetp capable?
Date: Thu, 15 Jul 2004 08:47:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200407150847.05039.m.watts@eris.qinetiq.com>
References: <200407131212.17298.m.watts@eris.qinetiq.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200407131212.17298.m.watts@eris.qinetiq.com>
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
To: cpufreq@www.linux.org.uk

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> Subject says it all really...
>
> I do know that if I boot with no AC power it runs at ~800MHz, but plugging
> the AC back in changes nothing.
>
>

Turns out I needed to load the speedstep_ich module (which I've now compile=
d=20
into the kernel).

This doesn't make anything else appear in dmesg but in conjunction with the=
=20
mandrake 'cpufreqd' the cpu speed is stepped up/down as I fiddle with the a=
c=20
power.

I currently have the longest lasting (battery life) linux laptop I've used.=
=2E.=20
I only had to charge it once in 6hrs use last night :)
Even the HDD powers down as soon as its finished being used!

And as for hibernation (to swap) working _flawlwssly_ when I shut the lapto=
p=20
lid... what can I say? w00t!

Great job!

Mark.

=2D --=20
Mark Watts
Senior Systems Engineer
QinetiQ Trusted Information Management
Trusted Solutions and Services group
GPG Public Key ID: 455420ED

=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA9jZ4Bn4EFUVUIO0RAgZaAJ9uIbtayQLkokrtPeZBmGGsivmtigCg2cyJ
3Yh7TakzcuOco1Y45crkzmI=3D
=3DDrEg
=2D----END PGP SIGNATURE-----
