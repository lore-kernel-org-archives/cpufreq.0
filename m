From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: Can you please try this powernow-k8.c patch ?
Date: Tue, 16 Nov 2004 12:32:05 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84301539DCB@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Michal Pytasz <mpytasz@pai.net.pl>, cpufreq@www.linux.org.uk

> Well, it seems to have done the trick for the frequency,
> Thanks very much,=20
>=20
> Also I can see in /sys/devices/system/cpu/cpu0/cpufreq a=20
> changed value of=20
> frequency, is it possible to see if voltage changes as well?=20
> Looking at the=20
> log provided, I see, that only frequency seems to be changing=20
> (although I=20
> finally seem to get cooler CPU, I can hear the fan reducing=20
> RPM, sometimes=20
> turning off at all :))

I'm glad it fixed the problem. The voltage is changing, you can
see it from the debug log:

> powernow-k8: writing vid 0x18, lo 0x11800, hi 0x1
> powernow-k8: ph3 complete, currfid 0x0, currvid 0x18
> powernow-k8: transitioned (cpu0): new fid 0x0, vid 0x18

The voltage information is not available from the cpufreq
files. The only way I know to see the voltage information is
to either switch on debug in the driver or look at the values
in the fid/vid status MSR, which is a register that can only
be accessed from kernel space.

Paul.
