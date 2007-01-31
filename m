From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: Enhanced PowerSaver driver
Date: Wed, 31 Jan 2007 23:13:58 +0100
Message-ID: <45C114A6.4040801@interia.pl>
References: <45BC9E94.6080701@interia.pl>
	<20070128142543.GA1676@redhat.com>	<45BCD520.4080308@interia.pl>
	<loom.20070131T122840-94@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <loom.20070131T122840-94@post.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: Jorgen <jorgen@greven.dk>, Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

[...]
>=20
> I have a board (IB798) with a Via Eden CPU (a C7 deviate). On kernel 2.6.=
16.38 I
> tried to compile and load Via's longhaul driver. When I started cpufreq, =
the O/S
> crashed.
>=20
This is rather bad sign. Looks like I spoke to soon.
> If e.g. Rafa=B3 create som patches for the original longhaul driver, from=
 ideas
> based on Via's code, I will install them, test and give feedback.
>=20
Thanks.

After looking into code I have found two things:
- it is using "disable bus master bit on each PCI device"... for C7?!,
- it is using current CPU f and vcc to find table for it. I don't like=20
this idea. If CPU has min/max info why not use it? Strange thing in C7=20
is that it is starting at lowest supported frequency. BIOS has to switch it=
=20
to max. As You can read at viaarena, BIOS is only doing it when "optimized =

defaults" are loaded. Looks like it isn't default. What will happen if=20
driver will search table for CPU running at lowest frequency? Probably=20
processors with different max can have same min frequency.

Dave: Can I repost e_powersaver with "experimental" and some small=20
changes? Sorry.

> Brgds Jorgen
Regards
Rafa=B3


----------------------------------------------------------------------
Fergie i jej biodra.... - zobacz >>  http://link.interia.pl/f19ed
