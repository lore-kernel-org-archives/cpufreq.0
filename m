From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: P4 Xeon (em64t) - maximum frequency is not detected
Date: Wed, 21 Jun 2006 07:35:34 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454192A9C@scsmsx413.amr.corp.intel.com>
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
To: "Brane F. Gracnar" <bfg@interseek.si>, cpufreq@lists.linux.org.uk


Both the systems are not OK. P4-clockmod is disabled in config because
it is not the right driver that you should be using for speedstep. You
should use "acpi-cpufreq" and "speedstep-centrino" which are already
there in config. Either one of them should work (depending on the
platform and BIOS).=20

P4clockmod reduces the frequency through clock modulation which is
useful only in thermal condition and two drivers mentioned abouve
reduces processor frequency and voltage and there by gives you power
benefits. If the above two drivers does not work, then that is the
problem that we need to root cause.

Thanks,
Venki=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Brane=20
>F. Gracnar
>Sent: Wednesday, June 21, 2006 5:33 AM
>To: cpufreq@lists.linux.org.uk
>Subject: P4 Xeon (em64t) - maximum frequency is not detected
>
>Hello
>
>I have a strange problem with my P4 Xeon 64bit installation.=20
>I'm using slamd=20
>10.2 in exclusively 64bit mode.
>
>I've compiled my custom kernel (2.6.16.20 - vanilla), but=20
>kernel didn't detect=20
>any cpu freq interfaces. Becouse everything worked on the same=20
>hardware with=20
>32bit kernel, i decided to remove line "depends EMBEDDED" in=20
>file ./arch/x86_64/kernel/cpufreq/Kconfig in section X86_P4_CLOCKMOD.
>
>After kernel was recompiled, cpufreq interfaces appeared in=20
>sysfs. Great.
>
>No i have weird problem. CPU frequency is not set to maximum hardware=20
>frequency on 3.2GHz processors.
>
>I have servers with two type of cpus:
>
>- p4 xeon 3.2GHz with em64t (processor runs at 2.8 GHz, not ok)
>- p4 xeon 3.4GHz with em64t. (everything works ok)
>
>I've attached several files files.
>
>- dmesg output for both machines
>- cpufreq-info output for both machines
>- /proc/cpuinfo output for both machines
>- kernel configuration file
>
>ok-* files were taken from machine that runs ok, bad-* files=20
>were taken from=20
>3.2GHZ machine.
>
>Both machines have 2 processors with hyperthreading enabled.
>
>Can anyone suggest me how to raise maximum cpu frequency on=20
>3.2ghz processor?
>
>Thanks in advance :)
>
>Brane
>
>--=20
>	The Gray-haired Woman's Complaint
>
>My back aches, my pussy is sore;
>I simply can't fuck any more;
>	I'm covered with sweat,
>	And you haven't come yet,
>And my God, it's a quarter to four!
>
