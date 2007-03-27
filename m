From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: CPU throttling & power conservation expectations
Date: Tue, 27 Mar 2007 14:35:56 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F52A9AAB@scsmsx415.amr.corp.intel.com>
References: <4956.72.165.61.226.1175030840.squirrel@webmail.linuxpowered.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <4956.72.165.61.226.1175030840.squirrel@webmail.linuxpowered.net>
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
To: nate <cpufreq@linuxpowered.net>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of nate
>Sent: Tuesday, March 27, 2007 2:27 PM
>To: cpufreq@lists.linux.org.uk
>Subject: RE: CPU throttling & power conservation expectations
>
>Langsdorf, Mark said:
>>> kernels were primarily 2.6.17-1.2142_FC4smp. I used the
>>> p4-clockmod and cpufreq_powersave modules. cpufreq-info
>>> reported that the cpus were successfully clocked down to
>>> the ~300-400mhz range(forgot exactly what speed).
>>
>> p4-clockmod throttles the clock frequency but doesn't
>> adjust the processor voltage.  You should be using the
>> speedstep-centrino or acpi drivers.
>>
>
>ok, that would explain some then, those other drivers
>wouldn't load, must not be compatible.
>
>[root@prod-admin-2 cpufreq]# modprobe acpi-cpufreq
>FATAL: Error inserting acpi_cpufreq
>(/lib/modules/2.6.17-1.2142_FC4smp/kernel/arch/i386/kernel/cpu/
>cpufreq/acpi-cpufreq.ko):
>Device or resource busy
>
>[root@prod-admin-2 i386]# grep -i acpi=20
>/boot/config-2.6.17-1.2142_FC4smp
># Power management options (ACPI, APM)
># ACPI (Advanced Configuration and Power Interface) Support
>CONFIG_ACPI=3Dy
>[..]
>

Does your processors support Enhanced Speedstep feature (does
/proc/cpuinfo flags contain 'est')?

If yes, also check whether your BIOS is enabling Enhanced speedstep
correctly and whether there are any options in BIOS to enable.

Thanks,
Venki
