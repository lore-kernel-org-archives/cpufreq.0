From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
	Dothan-based Celeron-M processors
Date: Fri, 2 Dec 2005 06:26:52 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60067F3B26@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Felix Braun <Felix.Braun@mail.mcgill.ca>, CPUFreq@lists.linux.org.uk
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Felix Braun
>Sent: Friday, December 02, 2005 5:57 AM
>To: CPUFreq@lists.linux.org.uk
>Subject: [PATCH 2.6.14] cpufreq: don't suggest=20
>speedstep-centrino for Dothan-based Celeron-M processors
>
>Hi there,
>
>I recently bought a laptop which is reported by Intel's CPUid tool as a
>Celeron-M 373. Linux identifies this processor like this=20
>(/proc/cpuinfo)
>
>processor	: 0
>vendor_id	: GenuineIntel
>cpu family	: 6
>model		: 13
>model name	: Intel(R) Celeron(R) M processor         1.00GHz
>stepping	: 8
>cpu MHz		: 999.915
>cache size	: 512 KB
>fdiv_bug	: no
>hlt_bug		: no
>f00f_bug	: no
>coma_bug	: no
>fpu		: yes
>fpu_exception	: yes
>cpuid level	: 2
>wp		: yes
>flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
>pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe
>bogomips	: 2001.80
>
>I would like to use CPU frequency scaling to increase my=20
>battery life. As
>this processor can't do EnhancedSpeedStep (Celerons seem to be=20
>unable to
>do so in general) I've been using the p4-clockmod driver.
>

I think from user perspectibe, P4-clockmod is most confusing driver
ever. P4-clockmod will only do the duty-cycle based throttling and will
not save any significant power. In fact, CPU may end up consuming more
power than without it for a constant amount of unit-work (Dominik has
patiently explained it quite a few times on this list). It will only
help in thermal conditions and ACPI throttling driver should handle that
anyway. Given this: I vote for removing p4-clockmod altogether from
cpufreq drivers. Dave, Dominik: do you agree?

Thanks,
Venki
