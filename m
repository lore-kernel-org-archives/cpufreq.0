From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: p4-clockmod reports frequencies faster than CPU
Date: Mon, 21 Aug 2006 18:58:19 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454777C6A@scsmsx413.amr.corp.intel.com>
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
To: Daniel Drake <dsd@gentoo.org>, cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.de>
Cc: zwane@commfireservices.com

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Daniel Drake
>Sent: Monday, August 21, 2006 9:11 AM
>To: cpufreq@lists.linux.org.uk
>Cc: zwane@commfireservices.com
>Subject: p4-clockmod reports frequencies faster than CPU
>
>Hi,
>
>A Gentoo user at http://bugs.gentoo.org/141234 reports that the=20
>p4-clockmod cpufreq driver reports bad frequencies for his 1300mhz=20
>Pentium 4 processor:
>
># cat sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
>525000 787500 1050000 1312500 1575000 1837500 2100000
>
>The last 3 are obviously wrong.
>
>Unfortunately as this is a production system it's not easy to=20
>test other=20
>kernels, so this has only been reproduced on a Gentoo-patched 2.6.16.=20
>However the Gentoo patches don't modify cpufreq at all and are=20
>generally=20
>quite minimal.
>
>
>/proc/cpuinfo output is here:
>http://bugs.gentoo.org/attachment.cgi?id=3D92370&action=3Dview
>
>Does any more info need to be provided?

The root of the problem seems to be this line at
arch/i386/kernel/cpu/cpufreq/speedstep-lib.c:pentium4_get_frequency()

if (c->x86_model < 2)
	mult =3D msr_lo >> 27;

The CPU model on this system here is 0. As I see in the documentation,
multiplier is not defined in MSR_EBC_FREQUENCY_ID for model 0. So, we
are getting the wrong estimate of the processor frequency.

Dominik may have more history about this.
Dominik: did this >> 27 work on any P4 with model 0 and 1 at all?

Note that this is only a reporting issue. Even with this bug, top speed
of the CPU will always be 1.3 and with P4_clock mod, CPU speed will vary
according to scale by (1/8th) for every lower P-state.

Thanks,
Venki

Thanks,
Venki
