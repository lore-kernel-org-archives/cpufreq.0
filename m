From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Sun, 6 Aug 2006 07:10:24 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84545A604D@scsmsx413.amr.corp.intel.com>
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
To: tobias.bocanegra@day.com, Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Tobias Bocanegra
>Sent: Sunday, August 06, 2006 3:02 AM
>To: Erik Slagter
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: problems setting freq on dual core t2600,=20
>2.6.17-1.2157_FC5smp
>
>no, performance state-change does not work at all:
>but when switching performance states, /proc/cpuinfo freq changes
>
># echo 0 > /proc/acpi/processor/CPU0/performance
># cat /proc/acpi/processor/CPU0/performance
>state count:             4
>active state:            P1
>states:
>    P0:                  2167 MHz, 31000 mW, 10 uS
>   *P1:                  1667 MHz, 23000 mW, 10 uS
>    P2:                  1333 MHz, 18000 mW, 10 uS
>    P3:                  1000 MHz, 13000 mW, 10 uS
># cat /proc/cpuinfo  | grep MHz
>cpu MHz         : 1667.000
>cpu MHz         : 1667.000
># cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
>1667000
>
># echo 2 > /proc/acpi/processor/CPU0/performance
># cat /proc/acpi/processor/CPU0/performance
>state count:             4
>active state:            P1
>states:
>    P0:                  2167 MHz, 31000 mW, 10 uS
>   *P1:                  1667 MHz, 23000 mW, 10 uS
>    P2:                  1333 MHz, 18000 mW, 10 uS
>    P3:                  1000 MHz, 13000 mW, 10 uS
># cat /proc/cpuinfo  | grep MHz
>cpu MHz         : 1333.000
>cpu MHz         : 1667.000
># cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
>1667000
>

I mentioned it in my earlier reply. But, I am not sure whether you tried
this or not. Can you please try this.
#cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
#cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
#cat /proc/cpuinfo  | grep MHz

#echo 1333000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
#echo 1333000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed

#cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
#cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
#cat /proc/cpuinfo  | grep MHz

Thanks,
Venki
