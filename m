From: "Lin, Zihui" <zihui.lin@intel.com>
Subject: DBS enabling on EM64T machine with cpufreqd
Date: Thu, 26 May 2005 18:04:11 +0800
Message-ID: <26F44F810A51DF42A127BC2A06BE185E01D4FAA2@pdsmsx404>
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
To: cpufreq@lists.linux.org.uk

Hi there,

=20

I'm new to cpufreqd. Sorry for my wooden English.

I found that cpufreqd can be used in desktop.=20

Has anybody ever tried cpufreqd in Nocona System?

=20

My Nocona Server has the speedstep functionality,=20

and can be throttled by acpi-cpufreq.=20

But it doesn't have the battery like laptops.=20

I've tried to set the CPU frequency manually, and it works.

Is it possible to use cpufreqd in it?

Any help is appreciated! Thanks in advance!

=20

Best regards,

Zihui

=20

P.S. Here is some output:

=20

[root@ae64 cpufreq]# cat scaling_governor

performance

[root@ae64 cpufreq]# cat scaling_available_frequencies

3400000 3400000 3400000 3400000 3400000 3400000 3400000 3400000 3400000
2800000

[root@ae64 cpufreq]# cat scaling_available_governors

powersave userspace performance

[root@ae64 cpufreq]# cat /etc/cpufreqd.conf

[General]

pidfile=3D/var/run/cpufreqd.pid

poll_interval=3D2

pm_type=3Dacpi #(acpi, apm or pmu)

verbosity=3D7 #(if you want a minimal logging set to 5)

[Profile]

name=3Dhi_boost

minfreq=3D95%

maxfreq=3D100%

policy=3Dperformance

[Profile]

name=3Dlo_power

minfreq=3D0%

maxfreq=3D95%

policy=3Dpowersave

[Rule]

name=3DAC_on

ac=3Don                   # (on/off)

cpu_interval=3D0-40

profile=3Dlo_power

[Rule]

name=3Dcompiling

ac=3Don                   # (on/off)

programs=3Dgcc,make

cpu_interval=3D80-100

=20

profile=3Dlo_power [root@ae64 cpufreq]# cpufreqd -D

libsys_init() - no batteries found, not a laptop?

=20
