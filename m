From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: powernow-k8 problem
Date: Wed, 1 Dec 2004 08:26:47 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A8430153A588@SAUSEXMB1.amd.com>
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
To: Markus Trippelsdorf <markus@trippelsdorf.de>, cpufreq@www.linux.org.uk

> However, if I start a CPU intensive program I get this error=20
> in my dmesg:
> powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
> powernow-k8: transition frequency failed
> (repeated ad nauseam)
> And from thereon my CPU is locked at full speed and never=20
> scaled back again.
>=20
> I'm using a Winchester 3200:
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors=20
> (version 1.00.09b)
> powernow-k8:    0 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
> powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x8 (1350 mV)
> powernow-k8:    2 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
> powernow-k8: cpu_init done, current fid 0xc, vid 0x4
> powernow-k8: ph2 null fid transition 0xc
>=20
> Any hints?
> Thanks in advance.
>=20
> Markus

I am not sure what is going on to cause this transition
frequency failed. It would be a big help if you could rebuild=20
the driver for debug and post the system log (dmesg) of this
failure.=20

Thanks. Paul.
