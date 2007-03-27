From: "nate" <cpufreq@linuxpowered.net>
Subject: RE: CPU throttling & power conservation expectations
Date: Tue, 27 Mar 2007 14:27:20 -0700 (PDT)
Message-ID: <4956.72.165.61.226.1175030840.squirrel@webmail.linuxpowered.net>
References: <33887.72.165.61.226.1175027715.squirrel@webmail.linuxpowered.net>
	<1449F58C868D8D4E9C72945771150BDFD96798@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1449F58C868D8D4E9C72945771150BDFD96798@SAUSEXMB1.amd.com>
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
To: cpufreq@lists.linux.org.uk

Langsdorf, Mark said:
>> kernels were primarily 2.6.17-1.2142_FC4smp. I used the
>> p4-clockmod and cpufreq_powersave modules. cpufreq-info
>> reported that the cpus were successfully clocked down to
>> the ~300-400mhz range(forgot exactly what speed).
>
> p4-clockmod throttles the clock frequency but doesn't
> adjust the processor voltage.  You should be using the
> speedstep-centrino or acpi drivers.
>

ok, that would explain some then, those other drivers
wouldn't load, must not be compatible.

[root@prod-admin-2 cpufreq]# modprobe acpi-cpufreq
FATAL: Error inserting acpi_cpufreq
(/lib/modules/2.6.17-1.2142_FC4smp/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko):
Device or resource busy

[root@prod-admin-2 i386]# grep -i acpi /boot/config-2.6.17-1.2142_FC4smp
# Power management options (ACPI, APM)
# ACPI (Advanced Configuration and Power Interface) Support
CONFIG_ACPI=y
[..]



>> I expected at least some reduction in power usage, but
>> to my suprise my intelligent power strips did not report
>> even 0.1 amps(@110V) worth of power savings.
>
> Shouldn't power utilization be measured in watts, not
> amps?  My electrical engineering classes were a long
> time ago.

Well, I think you know what I meant :) it's easy enough
to convert amps+volts to watts.. My power strips measure
draw in amps. My newer HP gear supports retrieving power
usage via the management port, though the versions of
the cpufreq drivers in the kernel don't run on those
systems either.

>
> I've observed a dual-processor Opteron system pulling
> 150 watts from the wall at full frequency and voltage,
> and then dropping to 75 watts at a lower pstate.  We
> did this as a demo at Linux World Expo in 2004.
>
> Also see Paul Devriendt's paper on the same:
> http://www.linuxsymposium.org/proceedings/LinuxSymposium2004_V1.pdf

thanks a bunch for the quick response I'll check that
PDF out too. I'll dig into it more when we go to the
newer distribution/kernel.

nate
