From: "Tobias Bocanegra" <tobias.bocanegra@day.com>
Subject: Re: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Thu, 3 Aug 2006 17:59:12 +0200
Message-ID: <8be731880608030859y2881505epcd2ef0ad42b4a36c@mail.gmail.com>
References: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
	<44D21767.7020806@linux.intel.com>
Reply-To: tobias.bocanegra@day.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44D21767.7020806@linux.intel.com>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk

ok, booted again in singleuser mode and made sure that no cpu daemon
is running, and i still get the same behaviour. here the processes:

UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 17:51 ?        00:00:01 init [S]
root         2     1  0 17:51 ?        00:00:00 [migration/0]
root         3     1  0 17:51 ?        00:00:00 [ksoftirqd/0]
root         4     1  0 17:51 ?        00:00:00 [watchdog/0]
root         5     1  0 17:51 ?        00:00:00 [migration/1]
root         6     1  0 17:51 ?        00:00:00 [ksoftirqd/1]
root         7     1  0 17:51 ?        00:00:00 [watchdog/1]
root         8     1  0 17:51 ?        00:00:00 [events/0]
root         9     1  0 17:51 ?        00:00:00 [events/1]
root        10     1  0 17:51 ?        00:00:00 [khelper]
root        11     1  0 17:51 ?        00:00:00 [kthread]
root        14    11  0 17:51 ?        00:00:00 [kblockd/0]
root        15    11  0 17:51 ?        00:00:00 [kblockd/1]
root        16    11  0 17:51 ?        00:00:00 [kacpid]
root       187    11  0 17:51 ?        00:00:00 [khubd]
root       189    11  0 17:51 ?        00:00:00 [kseriod]
root       254    11  0 17:51 ?        00:00:00 [pdflush]
root       255    11  0 17:51 ?        00:00:00 [pdflush]
root       256     1  0 17:51 ?        00:00:00 [kswapd0]
root       257    11  0 17:51 ?        00:00:00 [aio/0]
root       258    11  0 17:51 ?        00:00:00 [aio/1]
root       411     1  0 17:51 ?        00:00:00 [pccardd]
root       422    11  0 17:51 ?        00:00:00 [kpsmoused]
root       454    11  0 17:51 ?        00:00:00 [ata/0]
root       455    11  0 17:51 ?        00:00:00 [ata/1]
root       464    11  0 17:51 ?        00:00:00 [scsi_eh_0]
root       465    11  0 17:51 ?        00:00:00 [scsi_eh_1]
root       466    11  0 17:51 ?        00:00:00 [scsi_eh_2]
root       467    11  0 17:51 ?        00:00:00 [scsi_eh_3]
root       492    11  0 17:51 ?        00:00:00 [kjournald]
root       530    11  0 17:51 ?        00:00:00 [kauditd]
root       554     1  0 17:51 ?        00:00:00 /sbin/udevd -d
root      1185     1  0 17:51 ?        00:00:00 [khpsbpkt]
root      1259     1  0 17:51 ?        00:00:00 [knodemgrd_0]
root      1264    11  0 17:51 ?        00:00:00 [ipw3945/0]
root      1265    11  0 17:51 ?        00:00:00 [ipw3945/1]
root      1266    11  0 17:51 ?        00:00:00 [ipw3945/0]
root      1267    11  0 17:51 ?        00:00:00 [ipw3945/1]
root      1367    11  0 17:51 ?        00:00:00 [hda_codec]
root      1562    11  0 17:51 ?        00:00:00 [kmirrord]
root      1587    11  0 17:51 ?        00:00:00 [kjournald]
root      1589    11  0 17:51 ?        00:00:00 [kjournald]
root      1591    11  0 17:51 ?        00:00:00 [kjournald]
root      1593    11  0 17:51 ?        00:00:00 [kjournald]
root      1744     1  0 17:52 tty1     00:00:00 init [S]
root      1745  1744  0 17:52 tty1     00:00:00 /bin/sh -l
root      1817  1745  0 17:55 tty1     00:00:00 ps -ef


On 8/3/06, Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com> wrote:
> Tobias Bocanegra wrote:
> > hi,
> > i don't know if this is the correct list to ask this question, if not
> > just bash me :-)
> >
> > i have a intel dual core t2600 with 2.16ghz, running 2.6.17-1.2157_FC5smp
> >
> > vendor_id       : GenuineIntel
> > cpu family      : 6
> > model           : 14
> > model name      : Genuine Intel(R) CPU           T2600  @ 2.16GHz
> > stepping        : 8
> >
> > the files in /sys/devices/system/cpu/cpu0/cpufreq say:
> > affected_cpus:0
> > cpuinfo_cur_freq:1667000
> > cpuinfo_max_freq:2167000
> > cpuinfo_min_freq:1000000
> > scaling_available_frequencies:2167000 1667000 1333000 1000000
> > scaling_available_governors:userspace performance
> > scaling_cur_freq:1667000
> > scaling_driver:centrino
> > scaling_governor:userspace
> > scaling_max_freq:1667000
> > scaling_min_freq:1667000
> > scaling_setspeed:1667000
> >
> > now, i try to set 2.17 ghz, but it always stays at 1.7:
> >
> > # echo 2167000 > scaling_setspeed
> > # cat cpuinfo_cur_freq
> > 1667000
> >
> > i tried every possible combination, and also cpu frequency tools like
> > cpufreqd and cpufreq-set. and it does not matter which cpu i try to
> > modify.
> you should check for a daemon like cpufreqd or powersaved. As you system is not loaded (most probably), it insists on
> setting lowest P-state available.
> >
> > something other that is funny is that sysfs does not show correct cur_freq
> > # echo 1000000 > scaling_setspeed
> > # cat cpuinfo_cur_freq
> > 1667000
> >
> > # cat /proc/cpuinfo | grep MHz
> > cpu MHz         : 1000.000
> >
> > and:
> > # cpufreq-info
> > cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
> > Report errors and bugs to linux@brodo.de, please.
> > analyzing CPU 0:
> > [...]
> >  current CPU frequency is 1.67 GHz (asserted by call to hardware).
> >
> > # cpufreq-info -f
> > 1000000
> >
> > funny enough, it worked once 2 days ago until i rebooted...but i can't
> > figure
> > out what was different. i guess, it's either some chipset-internal
> > regulation
> It does not exist.
> > or some cpu daemon running.
> Yes, see above.
> >
> > has anyone some advice?
> > regards, toby
