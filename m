From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: powernow-k8 on Athlon64 3200+ (s939) stability problem...
Date: Tue, 5 Apr 2005 10:16:52 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A843023AE1D6@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: pytasz@lodz.home.pl, cpufreq@ZenII.linux.org.uk

> I am not 100% certain about it, but I think it hangs/reboots=20
> "on return" to=20
> high frequency (or at least when the frequency is low and I=20
> start lots of=20
> applications or start using gcc)
>=20
> I was wondering how to check if it is a hardware problem (for=20
> example too low=20
> voltage from mainboard, deffective CPU,... ) or something in=20
> the system.

If you configure CPUFreq for debug, the powernow-k8 driver will
output which frequencies/voltages it is using at startup. These
can be compared against the published values for your processor.
This would eliminate the question of a BIOS problem where the
BIOS might be supplying bad data.

If you can get the debug output going over a serial console, then
you can verify what it was doing when it dies. I assume you can=20
manually change to a higher frequency successfully.

How many DIMM slots do you have, and are they fully populated ?=20
Try removing some of the DRAM so that now all slots are populated
and see if the systems is any more stable.

Paul.
