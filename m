From: =?ISO-8859-1?Q?Stefan_G=F6rling?= <stefan@gorling.se>
Subject: cpufreq: No CPUs supporting ACPI performance management found
Date: Wed, 13 Aug 2003 21:13:21 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F3A8DD1.4020809@gorling.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@www.linux.org.uk

Please, help me, I'm getting crazy using this notebook with the fan=20
running at highest level all the time.

I've got a no-name (FIC M285) taiwaneese notebook with a regular P4 CPU.
When I build a Linux 2.6.0-test3 kernel, it recognizes some acpi-stuff=20
and I can see battery levels, fan temperature etc. Bug cpufreq says at=20
boot that it can't find any cpus supporting acpi performance management,=20
even though I am able to throttle the cpu manually.

Where shall I start? Is it possible for me to get this damn fan to run=20
more slowly by slowing down the cpu?

Below is attached some printings from my proc directory, but i really=20
have no idea where to start, any pointers will be appriceated.

Best Regards,

Stefan G=F6rling

/proc/cpufreq:
           minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       224105 kHz ( 12 %)  -    1792841 kHz (100 %)  -  performance

/proc/cpuinfo:
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 2
model name	: Intel(R) Pentium(R) 4 CPU 1.80GHz
stepping	: 4
cpu MHz		: 1792.841
cache size	: 512 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov=20
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips	: 3538.94

/proc/acpi/alarm:
2003-08-13 04:38:40

/proc/acpi/sleep:
S0 S1 S4 S5

/proc/acpi/thermal_zone/THRM/polling_frequency:
<polling disabled>

/proc/acpi/thermal_zone/THRM/cooling_mode:
cooling mode:            active

/proc/acpi/thermal_zone/THRM/trip_points:
critical (S5):           80 C
passive:                 65 C: tc1=3D3 tc2=3D1 tsp=3D600 devices=3D0xcf6b=
3f28
active[0]:               45 C: devices=3D0xcf69fb28

/proc/acpi/thermal_zone/THRM/temperature:
temperature:             33 C

/proc/acpi/thermal_zone/THRM/state:
state:                   ok

/proc/acpi/processor/CPU0/limit:
active limit:            P0:T0
platform limit:          P0:T0
user limit:              P0:T0
thermal limit:           P0:T0

/proc/acpi/processor/CPU0/throttling:
state count:             4
active state:            T1
states:
     T0:                  00%
    *T1:                  25%
     T2:                  50%
     T3:                  75%
/
proc/acpi/processor/CPU0/power:
active state:            C1
default state:           C1
bus master activity:     00000000
states:
    *C1:                  promotion[--] demotion[--] latency[000]=20
usage[00000000]
     C2:                  <not supported>
     C3:                  <not supported>

/proc/acpi/processor/CPU0/info:
processor id:            0
acpi id:                 0
bus mastering control:   no
power management:        no
throttling control:      yes
performance management:  no
limit interface:         yes

/proc/acpi/fan/FAN/state:
status:                  on

/proc/acpi/button/lid/LID/state:
state:      open

/proc/acpi/button/lid/LID/info:
type:                    Lid Switch

/proc/acpi/button/power/PWRF/info:
type:                    Power Button (FF)

/proc/acpi/battery/BAT0/alarm:
alarm:                   4544 mWh

/proc/acpi/battery/BAT0/state:
present:                 yes
capacity state:          ok
charging state:          discharging
present rate:            21866 mW
remaining capacity:      56800 mWh
present voltage:         15900 mV

/proc/acpi/battery/BAT0/info:
present:                 yes
design capacity:         57600 mWh
last full capacity:      56800 mWh
battery technology:      rechargeable
design voltage:          14400 mV
design capacity warning: 4544 mWh
design capacity low:     1704 mWh
capacity granularity 1:  284 mWh
capacity granularity 2:  284 mWh
model number:            PC-VP-WP22/OP-570-74001
serial number:
battery type:            Lion
OEM info:                FIC

/proc/acpi/ac_adapter/ACAD/state:
state:                   off-line

/proc/acpi/debug_level:
0x0000000f

/proc/acpi/debug_layer:
0xffff3fff

/proc/acpi/fadt:
FACP=F4
