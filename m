From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: speedstep-centrino not working with Intel Pentium M 1.73
Date: Sun, 4 Jun 2006 07:36:51 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB60086B4F81@scsmsx403.amr.corp.intel.com>
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
To: Piotr Szymanski <niedakh@gmail.com>, cpufreq@lists.linux.org.uk


Can you try 2.6.16 kernel?

Or if you have to stick with 2.6.15 for some other reason, please check
whether acpi-cpufreq driver loads. Both acpi-cpufreq and
speedstep-centrino has similar functionalities despite of different
names.

If that doesn't work, then we will have to look at acpidump from your
system and take this further...

Thanks,
Venki =20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Piotr=20
>Szymanski
>Sent: Sunday, June 04, 2006 4:30 AM
>To: cpufreq@lists.linux.org.uk
>Subject: speedstep-centrino not working with Intel Pentium M 1.73
>
>Hi,
>My processor's /proc/cpuinfo is:
>processor       : 0
>vendor_id       : GenuineIntel
>cpu family      : 6
>model           : 13
>model name      : Intel(R) Pentium(R) M processor 1.73GHz
>stepping        : 8
>cpu MHz         : 1729.251
>cache size      : 2048 KB
>fdiv_bug        : no
>hlt_bug         : no
>f00f_bug        : no
>coma_bug        : no
>fpu             : yes
>fpu_exception   : yes
>cpuid level     : 2
>wp              : yes
>flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr=20
>pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe=20
>nx est tm2
>bogomips        : 3463.13
>
>When loading speedstep-centrino I am getting:
>FATAL: Error inserting speedstep_centrino=20
>(/lib/modules/2.6.15.5-1/kernel/arch/i386/kernel/cpu/
>cpufreq/speedstep-centrino.ko.gz): No such device
>
>Is there a way to make it working?
>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
