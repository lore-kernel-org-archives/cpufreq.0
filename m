From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Cpufreq on kernel 2.6.18
Date: Mon, 16 Oct 2006 06:26:41 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454BA3D95@scsmsx413.amr.corp.intel.com>
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
To: Joan Moreau <joan.moreau@m4x.org>, Luca <morpheus@ferrara.linux.it>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Joan Moreau [mailto:joan.moreau@m4x.org]=20
>Sent: Sunday, October 08, 2006 1:25 PM
>To: Luca
>Cc: Pallipadi, Venkatesh; cpufreq@lists.linux.org.uk
>Subject: Re: Cpufreq on kernel 2.6.18
>
>Luca,
>
>I have exactly the same problem on my pentium M 2Ghz.
>
>Only "cpufreq_centrino"  works under linux 2.6.18 (i..e /sys has=20
>relevant info) but cpufredq does not work anymore (frequancy=20
>not changeable)
>
>Has anybody found any fixes ?
>
>Thanks
>
>Joan

The change from acpi-cpufreq to speedstep-centrino driver from 2.6.16 to
2.6.18 is intentional. Looks like your platform can support both these
drivers and Linux is picking the best driver, that is speedstep centrino
in this case. So, everything is fine until that point.

But, I don't know why cpufreqd does not work with speedstep-centrino. As
long as these /sysfs interfaces are there, cpufreqd should work. Is it
not inserting the speedstep-module and hence it is failing? Can you try
manually switching to performance and powersave governors and make sure
frequency is changing. Something like this after you have
speedstep_centrino working.

#cd /sys/devices/system/cpu/cpu0/cpufreq
// I am assuming that this is a Centrino CPU with single logical CPU.
#cat  scaling_available_frequencies
#echo performance > scaling_governor
#cat cpuinfo_cur_freq
#echo powersave > scaling_governor
#cat cpuinfo_cur_freq

Now if this works, you can go ahead and try ondemand governor and see
whether that is working
#echo ondemand > scaling governor
// Leave system idle for couple of seconds
#echo cpuinfo_cur_freq
// Run some infinite loop code or some other load to keep CPU busy
#echo cpuinfo_cur_freq

Now if this also works, then there is something wrong with cpufreqd..
If any of these doesn't work, then there is some problem in kernel.

Thanks,
Venki
