From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 01:42:01 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84549CCDC8@scsmsx413.amr.corp.intel.com>
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
To: Bryan O'Sullivan <bos@serpentine.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Bryan=20
>O'Sullivan
>Sent: Tuesday, September 19, 2006 10:24 PM
>To: Dave Jones
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: No life from acpi-cpufreq, Pentium D 930, x86_64
>
>On Wed, 2006-09-20 at 01:13 -0400, Dave Jones wrote:
>
>> The important line is 'flags'. Does that have eist ?
>
>Here's the flags line.  No sign of eist, alas:
>
>flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
>mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall
>nx lm constant_tsc pni monitor ds_cpl vmx est cid cx16 xtpr lahf_lm
>
>Thanks,
>
>	<b

There was a bug that got introduced in recent kernels and that was fixed
with this patch here:
http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
c
ommit;h=3Da0cc621f52a4dea10c34eeed6eb4e36b26db63dc

Can you try this patch and recompile your kernel and see whether that
helps?

Thanks,
Venki
