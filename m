From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Pentium D 915 / e-c1 with acpi-cpufreq
Date: Sun, 6 Aug 2006 07:19:31 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84545A604F@scsmsx413.amr.corp.intel.com>
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
To: Erik Slagter <erik@slagter.name>, tobias.bocanegra@day.com
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Erik Slagter
>Sent: Sunday, August 06, 2006 2:29 AM
>To: tobias.bocanegra@day.com
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: Pentium D 915 / e-c1 with acpi-cpufreq
>
>On za, 2006-08-05 at 20:49 +0200, Tobias Bocanegra wrote:
>
>> $ cat /proc/acpi/processor/CPU1/power
>> active state:            C2
>> max_cstate:              C8
>> bus master activity:     00000000
>> states:
>>     C1:                  type[C1] promotion[C2] demotion[--]
>> latency[000] usage[00000010]
>>    *C2:                  type[C2] promotion[--] demotion[C1]
>> latency[001] usage[02220984]
>>=20
>> i used http://processorfinder.intel.com/default.aspx to find the spec
>> of my cpu: =
http://processorfinder.intel.com/details.aspx?sSpec=3DSL8VN
>> and reviewed the specs of my processor. and it seems, that the
>> power-states in acpi do not correspond to the states in the manual. i
>> guess C2 is the 'C1' in the spec, since there is no C0. what i don't
>> understand is, that it says: max_cstate: C8, which my cpu does not
>> have.
>
>Why you exactly get 2 "C" states (and I am getting 1 on my=20
>pentium D915)
>I can't say one sane thing about and I'd like to know as well.=20
>This sort
>of information also can't be found on the Intel website unfortunately.

The number of C-states supported by your platform can be seen in boot
messages.
Something of the form..
ACPI: CPU0 (power states: C1[C1] C2[C2] C3[C3])

The number 8, as Eric mentioned, is the max number of C-states that can
be supported by the kernel and has nothing to do with the platform.

Note:
1) The number of C-states is not constant at all times, for a platform.
Platform BIOS may change the number of C-states dynamically depending on
the condition. Example: When on battery, there can be extra C-state
compared to when on A/C.
2) Number of C-states that a system can use is actually given by
platform/bios to OS and may not be constant for a CPU type. Platform
vendor may decide to expose/hide different C-states based on platform
requirements.

Thanks,
Venki
