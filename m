From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: help on speedstep__Intel PM 753
Date: Sun, 1 Apr 2007 09:48:11 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F52DFB1F@scsmsx415.amr.corp.intel.com>
References: <dc84318c0704010821t24b26c7bj5bd0fe7000a7a13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <dc84318c0704010821t24b26c7bj5bd0fe7000a7a13@mail.gmail.com>
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
To: wang daolong <ahlongxp@gmail.com>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of wang daolong
>Sent: Sunday, April 01, 2007 8:22 AM
>To: cpufreq@lists.linux.org.uk
>Subject: help on speedstep__Intel PM 753
>
>Hi,everyone,
>
>I'm using a Ultra Low Voltage Intel Pentium M processor 1200MHz (PM
>753). But the speedstep-centrino module doesn't support it(get a
>ENODEV).
>In kernel 2.6.15(ubuntu dapper), I wrote a patch to make it's=20
>speedstep work.
>but when I applied the patch to latest kernel 2.6.20.4, it=20
>won't work any more.
>I tried for hours,but failed entirely.
>help!!
>

Can you try acpi-cpufreq module without any patch. If that doesn't work
send in the
dmesg output with CPU_FREQ_DEBUG enabled in your config and
cpufreq.debug=3D7
in your boot parameter.

Thanks,
Venki
