From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [2.6 PATCH] Missing default governors choices
Date: Thu, 26 Aug 2004 09:40:08 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002B5F40B@scsmsx403.amr.corp.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Michal Rokos <michal@rokos.info>, cpufreq@www.linux.org.uk
Cc: linux-kernel@vger.kernel.org



Ondemand govrenor not being one of the default governors is intentional.

Ondemand governor is in-kernel cpu frequency governor, that will=20
Be beneficial for CPUs that supports frequency change with low=20
transition_latency. If transition_latency is high, the ondemand governor

initialization will fail (User level governor is suggested in this
case).
Hence it cannot be used as a default governor.=20

Thanks,
Venki=20

>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Michal Rokos
>Sent: Thursday, August 26, 2004 12:07 AM
>To: cpufreq@www.linux.org.uk
>Cc: linux-kernel@vger.kernel.org
>Subject: [2.6 PATCH] Missing default governors choices
>
>Hello,
>
>aren't these 2 missing in "Default CPUFreq governor" menu?
>
>Thank you.
>
> Michal
>
>PS: CC to me (I'm off the lists)
>
># This is a BitKeeper generated diff -Nru style patch.
>#
># ChangeSet
>#   2004/08/26 08:57:24+02:00 michal@rokos.info=20
>#   Add missing governors to "Default CPUFreq governor" menu.
>#=20
># drivers/cpufreq/Kconfig
>#   2004/08/26 08:57:13+02:00 michal@rokos.info +16 -0
>#   Add missing governors to "Default CPUFreq governor" menu.
>#=20
>diff -Nru a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
>--- a/drivers/cpufreq/Kconfig 2004-08-26 09:00:15 +02:00
>+++ b/drivers/cpufreq/Kconfig 2004-08-26 09:00:15 +02:00
>@@ -27,6 +27,14 @@
>    the frequency statically to the highest frequency supported by
>    the CPU.
>=20
>+config CPU_FREQ_DEFAULT_GOV_POWERSAVE
>+ bool "powersave"
>+ select CPU_FREQ_GOV_POWERSAVE
>+ help
>+   Use the CPUFreq governor 'powersave' as default. This sets
>+   the frequency statically to the lowest frequency supported by
>+   the CPU.
>+
> config CPU_FREQ_DEFAULT_GOV_USERSPACE
>  bool "userspace"
>  select CPU_FREQ_GOV_USERSPACE
>@@ -35,6 +43,14 @@
>    you to set the CPU frequency manually or when an userspace=20
>    programm shall be able to set the CPU dynamically without having
>    to enable the userspace governor manually.
>+
>+config CPU_FREQ_DEFAULT_GOV_ONDEMAND
>+ bool "ondemand"
>+ select CPU_FREQ_GOV_ONDEMAND
>+ help
>+   Use the CPUFreq governor 'ondemand' as default. This does
>+   a periodic polling and changes frequency based on the CPU
>+   utilization.
>=20
> endchoice
>=20
>=20
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@www.linux.org.uk
>http://www.linux.org.uk/mailman/listinfo/cpufreq
>
