From: Krisztian Mark Szentes <office@lsa.at>
Subject: Re: cpufreq on TiBook 400 MHz
Date: Wed, 9 Jun 2004 12:47:51 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200406091247.51210.office@lsa.at>
References: <200305211853.54638.office@lsa.at>
	<200306121600.06552.office@lsa.at> <1055685144.608.0.camel@gaston>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1055685144.608.0.camel@gaston>
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
Content-Type: text/plain; charset="iso-8859-1"
To: debian-powerpc@lists.debian.org
Cc: Segher Boessenkool <segher@koffie.nl>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, cpufreq@www.linux.org.uk

Hi Ben

Am Sonntag, 15. Juni 2003 15:52 schrieb Benjamin Herrenschmidt:
> On Thu, 2003-06-12 at 16:00, Krisztian Mark Szentes wrote:
> > On Friday 23 May 2003 00:48, Segher Boessenkool wrote:
> > > Krisztian Mark Szentes wrote:
> > > > I  wonder why there is no /proc/cpufreq on my Titanium PowerBook G4
> > > > (400 MHz).
> > > Because no-one filled in the right values yet.
> > ...
> > > I seem to remember the PowerBook3,2 @ 400 has a low speed of
> > > 300MHz, but I'm not fully sure about that -- better check it
> > > yourself (apple.com -> developer -> hardware -> all products
> > > or something like that, it's not too hard to find).
> >=20
http://developer.apple.com/techpubs/hardware/Developer_Notes/Macintosh_CPUs=
-G4/PowerBook_G419Dec00/index.html
> > says:
> > "On the PowerBook G4 computer, the slower clock speed is 100 MHz slower=
=20
> > than the rated speed: 300 MHz on a 400-MHz model, 400 MHz on a 500 MHz =

> > model."
>=20
> Now, that's strange. I remember we measured 300Mhz for the low speed
> of the 500Mhz model...=20

Am Freitag, 23. Mai 2003 11:19 schrieben Sie:

> I'm not sure that will work. On the other hand, I'm pretty sure the freq.
> switching is _NOT_ supported on this model...

finally I edited the sources (a version of 2.4.20 lying around here):
..
#define DEBUG_FREQ
..


=A0 =A0 =A0 =A0/* Else check for TiPb 500 */
=A0 =A0 =A0 =A0 else if (machine_is_compatible("PowerBook3,2")) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Mark:and 400 MHz */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cur_freq < 350000 || cur_freq > 550000)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hi_freq =3D cur_freq;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 low_freq =3D 300000;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 has_freq_ctl =3D 1;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_uses_pmu =3D 1;


recompiled and fired it up:
# cat /proc/cpuinfo
cpu =A0 =A0 =A0 =A0 =A0 =A0 : 7410, altivec supported
temperature =A0 =A0 : 17-21 C (uncalibrated)
clock =A0 =A0 =A0 =A0 =A0 : 400MHz
revision =A0 =A0 =A0 =A0: 17.3 (pvr 800c 1103)
bogomips =A0 =A0 =A0 =A0: 797.90
machine =A0 =A0 =A0 =A0 : PowerBook3,2
motherboard =A0 =A0 : PowerBook3,2 MacRISC2 MacRISC Power Macintosh
detected as =A0 =A0 : 71 (PowerBook Titanium)
pmac flags =A0 =A0 =A0: 0000000b
L2 cache =A0 =A0 =A0 =A0: 1024K unified
memory =A0 =A0 =A0 =A0 =A0: 512MB
pmac-generation : NewWorld
# cat /proc/sys/cpu/0/speed-min > /proc/sys/cpu/0/speed
# cat /proc/cpuinfo
cpu =A0 =A0 =A0 =A0 =A0 =A0 : 7410, altivec supported
temperature =A0 =A0 : 17-21 C (uncalibrated)
clock =A0 =A0 =A0 =A0 =A0 : 300MHz
revision =A0 =A0 =A0 =A0: 17.3 (pvr 800c 1103)
bogomips =A0 =A0 =A0 =A0: 598.42
machine =A0 =A0 =A0 =A0 : PowerBook3,2
motherboard =A0 =A0 : PowerBook3,2 MacRISC2 MacRISC Power Macintosh
detected as =A0 =A0 : 71 (PowerBook Titanium)
pmac flags =A0 =A0 =A0: 0000000b
L2 cache =A0 =A0 =A0 =A0: 1024K unified
memory =A0 =A0 =A0 =A0 =A0: 512MB
pmac-generation : NewWorld
# dmesg | tail -3
HID1, before: a0000000
HID1, after: 80000000
Calibrating delay loop... 598.01 BogoMIPS
# cat /proc/sys/cpu/0/speed-max > /proc/sys/cpu/0/speed
# cat /proc/cpuinfo
cpu =A0 =A0 =A0 =A0 =A0 =A0 : 7410, altivec supported
temperature =A0 =A0 : 18-22 C (uncalibrated)
clock =A0 =A0 =A0 =A0 =A0 : 400MHz
revision =A0 =A0 =A0 =A0: 17.3 (pvr 800c 1103)
bogomips =A0 =A0 =A0 =A0: 797.90
machine =A0 =A0 =A0 =A0 : PowerBook3,2
motherboard =A0 =A0 : PowerBook3,2 MacRISC2 MacRISC Power Macintosh
detected as =A0 =A0 : 71 (PowerBook Titanium)
pmac flags =A0 =A0 =A0: 0000000b
L2 cache =A0 =A0 =A0 =A0: 1024K unified
memory =A0 =A0 =A0 =A0 =A0: 512MB
pmac-generation : NewWorld
# dmesg | tail -3
HID1, before: 80000000
HID1, after: a0000000
Calibrating delay loop... 797.90 BogoMIPS


BTW, the power consumption as displayed by xpmumon changes only by approx. =

0,5 Watt. I also do not understand why the bogomips numbers are not=20
exactly the same (598.01 versus 598.42).

Has it convinced you to include the Titanium 400 MHz into the future=20
cpufreq supported models?

Thank you for your work!

Salut

Mark
