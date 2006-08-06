From: "Tobias Bocanegra" <tobias.bocanegra@day.com>
Subject: Re: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Sun, 6 Aug 2006 12:02:02 +0200
Message-ID: <8be731880608060302x495fe71kda23879901fb66b3@mail.gmail.com>
References: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
	<44D28043.5010301@goop.org>
	<8be731880608051042o6d9a3eb6v2b7290fcd9eaf866@mail.gmail.com>
	<44D59CC5.1010200@goop.org>
	<8be731880608060209s7b280ecvadffc9c28c9d770d@mail.gmail.com>
	<1154856741.8243.21.camel@skylla.slagter.name>
	<8be731880608060244t3c0cedd6k7c7f76d5a58f8489@mail.gmail.com>
	<1154857599.8243.23.camel@skylla.slagter.name>
Reply-To: tobias.bocanegra@day.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154857599.8243.23.camel@skylla.slagter.name>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

no, performance state-change does not work at all:
but when switching performance states, /proc/cpuinfo freq changes

# echo 0 > /proc/acpi/processor/CPU0/performance
# cat /proc/acpi/processor/CPU0/performance
state count:             4
active state:            P1
states:
    P0:                  2167 MHz, 31000 mW, 10 uS
   *P1:                  1667 MHz, 23000 mW, 10 uS
    P2:                  1333 MHz, 18000 mW, 10 uS
    P3:                  1000 MHz, 13000 mW, 10 uS
# cat /proc/cpuinfo  | grep MHz
cpu MHz         : 1667.000
cpu MHz         : 1667.000
# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
1667000

# echo 2 > /proc/acpi/processor/CPU0/performance
# cat /proc/acpi/processor/CPU0/performance
state count:             4
active state:            P1
states:
    P0:                  2167 MHz, 31000 mW, 10 uS
   *P1:                  1667 MHz, 23000 mW, 10 uS
    P2:                  1333 MHz, 18000 mW, 10 uS
    P3:                  1000 MHz, 13000 mW, 10 uS
# cat /proc/cpuinfo  | grep MHz
cpu MHz         : 1333.000
cpu MHz         : 1667.000
# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
1667000

i don't have a THM entry:
# tree /proc/acpi/thermal_zone
/proc/acpi/thermal_zone
|-- TZ0
|   |-- cooling_mode
|   |-- polling_frequency
|   |-- state
|   |-- temperature
|   `-- trip_points
|-- TZ1
|   |-- cooling_mode
|   |-- polling_frequency
|   |-- state
|   |-- temperature
|   `-- trip_points
|-- TZ2
|   |-- cooling_mode
|   |-- polling_frequency
|   |-- state
|   |-- temperature
|   `-- trip_points
|-- TZ3
|   |-- cooling_mode
|   |-- polling_frequency
|   |-- state
|   |-- temperature
|   `-- trip_points
`-- TZ4
    |-- cooling_mode
    |-- polling_frequency
    |-- state
    |-- temperature
    `-- trip_points

btw: cpu throttling works.

On 8/6/06, Erik Slagter <erik@slagter.name> wrote:
> On zo, 2006-08-06 at 11:44 +0200, Tobias Bocanegra wrote:
> > well, that's exactly what's not working. the cpufreq-set does not
> > work, because of the perflib (my guess). and the echo 0 > performance
> > does not change the state.
>
> And what if you do "echo 2 > performance"? Does the interface work at
> all?
>
> What do the files under /proc/acpi/thermal_zone/THM say?
>
> It looks your processor is in TM2 mode (reduced frequency and voltage
> due to overtemperature) or cpufreq thinks it is.
