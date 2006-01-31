From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: powernow-k8: out of sync on Athlon64 x2 3800+
Date: Tue, 31 Jan 2006 09:16:54 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218B5B@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Niklas Edmundsson <Niklas.Edmundsson@hpc2n.umu.se>, cpufreq@lists.linux.org.uk

> We're getting errors like this in the kernel log:
> powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12
> powernow-k8: error - out of sync, fix 0x2 0xa, vid 0x12 0xa
> powernow-k8: error - out of sync, fix 0xa 0xc, vid 0xa 0x8
> powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12
>=20
> Looking at /proc/cpuinfo the CPU:s doesn't seem to change frequency,=20
> even though the sysfs cpufreq knobs says otherwise.
>=20
> Is this a known problem, or is there anything we can do to help=20
> debug/fix it?
>=20
> Kernel: kernel.org 2.6.15.1, 32bit SMP
> CPU: AMD Athlon(tm) 64 X2 Dual Core Processor 3800+
> Machine: Fujitsu-Siemens ESPRIMO P5600 (SiS761), latest BIOS.
>=20
> I'm not on the list so Cc replies to me.

You'll get that message on an Athlon X2 if you're using an
old version of the driver that doesn't fully support dual
core or if your part is being reported to Linux as 2=20
single core parts.

Neither of those should be happening with the 2.6.15.1 kernel.

Could you send me the results of `dmesg | grep powern`=20
immediately after boot?

-Mark Langsdorf
AMD, Inc.
