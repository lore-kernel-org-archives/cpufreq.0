From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [SchreiberX@Altmuehlnet.de: Re: hp omnibook xe4500 hangs while
	loading acpi module]
Date: Sat, 20 Dec 2003 18:14:57 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031220171457.GA5129@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: len.brown@intel.com
Cc: cpufreq@www.linux.org.uk

Hi Len,

The patch "[ACPI] GV3 IO port is 16-bits" to the
arch/i386/kernel/cpu/cpufreq/acpi.c file broke at least some of=20
the GV1/2 support. Any idea on how to fix it up so that it works
for both?

Happy holidays,
	Dominik

----- Forwarded message from Martin Schreiber <SchreiberX@Altmuehlnet.de>=
 -----

Subject: Re: hp omnibook xe4500 hangs while loading acpi module
From: Martin Schreiber <SchreiberX@Altmuehlnet.de>
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk
In-Reply-To: <20031219182737.GE6909@dominikbrodowski.de>
X-Mailer: Ximian Evolution 1.4.5=20
Date: Sat, 20 Dec 2003 17:13:47 +0100

the acpi cpufreq (kernel 2.6.0) works now on omnibook xe4500 with the
attached patch.

thanks!



On Fri, 2003-12-19 at 19:27, Dominik Brodowski wrote:
> Hi,
>=20
> Can you please try the attached patch (for 2.6.0)? It reverts a change
> done during the time frame you mention: I assume this patch
> "[ACPI] GV3 IO port is 16-bits (Venkatesh Pallipadi)" caused the troubl=
e.
> Please CC <cpufreq@www.linux.org.uk> in your reply [the cpufreq mailing=
=20
> list], so that other cpufreq developers can investigate this issue as w=
ell.
>=20
> Thanks,
> 	Dominik
>=20
> On Thu, Nov 27, 2003 at 11:24:45PM +0100, Martin Schreiber wrote:
> > hi!
> >=20
> > my "hp omnibook xe4500" hangs, if i load the acpi module for cpufreq.
> > there's no kernel error message. it just blocks everything.
> >=20
> > the cpufreq works fine up to test-6
> > with test-7, the kernel hangs, if i load the module.
> >=20
> > can i help you, to fix this problem?
> >=20
> > just say, what you need.
> >=20
> > i'm completely new to the kernel!
> >=20
> > ciao,
> >   martini
> >=20
> >=20
> > Martin Schreiber
> > Im Muehltal 48
> > 91171 Greding
> >=20
> > http://www.martin-schreiber.net
> > SchreiberX@Altmuehlnet.de
> >=20
> > St=FCrmt und schneit's Silvester nicht, ist das Neujahr auch in Sicht.
> >=20
> > --BEGIN GEEK CODE BLOCK--
> > Version: 3.12
> > GCS d s+: a-- C++ UL++ P+ L+++ E-- W+++ N o K- w--
> > O- M- V- PS+++ PE+ Y PGP++ t 5+ X R+ tv++ b+ DI- D++
> > G e h-- r-- y+
> > --END GEEK CODE BLOCK--


Martin Schreiber
Im Muehltal 48
91171 Greding

http://www.martin-schreiber.net
SchreiberX@Altmuehlnet.de

Wenn du kritisiert wirst, dann mu=DFt du irgend etwas richtig machen.
Denn man greift nur denjenigen an, der den Ball hat.
-- Bruce Lee

-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCS d s+: a-- C++ UL++ P+ L+++ E-- W+++ N o K- w---
O- M- V- PS+++ PE+ Y PGP++ t 5+ X R+ tv++ b+ DI- D++
G e h-- r-- y+
------END GEEK CODE BLOCK------

--- linux/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-10-12 19:48:39.0000000=
00 +0200
+++ linux-tmp/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-12-19 17:42:33.076=
814176 +0100
@@ -231,7 +231,7 @@
 	int			state)
 {
 	u16			port =3D 0;
-	u16			value =3D 0;
+	u8			value =3D 0;
 	int			i =3D 0;
 	struct cpufreq_freqs    cpufreq_freqs;
=20
@@ -282,9 +282,9 @@
 	value =3D (u16) perf->states[state].control;
=20
 	ACPI_DEBUG_PRINT((ACPI_DB_INFO,=20
-		"Writing 0x%04x to port 0x%04x\n", value, port));
+		"Writing 0x%02x to port 0x%02x\n", value, port));
=20
-	outw(value, port);=20
+	outb(value, port);=20
=20
 	/*
 	 * Then we read the 'status_register' and compare the value with the
@@ -296,11 +296,11 @@
 	port =3D perf->status_register;
=20
 	ACPI_DEBUG_PRINT((ACPI_DB_INFO,=20
-		"Looking for 0x%04x from port 0x%04x\n",
-		(u16) perf->states[state].status, port));
+		"Looking for 0x%02x from port 0x%02x\n",
+		(u8) perf->states[state].status, port));
=20
 	for (i=3D0; i<100; i++) {
-		value =3D inw(port);
+		value =3D inb(port);
 		if (value =3D=3D (u16) perf->states[state].status)
 			break;
 		udelay(10);
@@ -309,7 +309,7 @@
 	/* notify cpufreq */
 	cpufreq_notify_transition(&cpufreq_freqs, CPUFREQ_POSTCHANGE);
=20
-	if (value !=3D (u16) perf->states[state].status) {
+	if (value !=3D perf->states[state].status) {
 		unsigned int tmp =3D cpufreq_freqs.new;
 		cpufreq_freqs.new =3D cpufreq_freqs.old;
 		cpufreq_freqs.old =3D tmp;




----- End forwarded message -----
