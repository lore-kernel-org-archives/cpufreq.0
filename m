From: Thomas Renninger <trenn@suse.de>
Subject: RE: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change
	Frequency!
Date: Wed, 30 May 2007 09:15:40 +0200
Message-ID: <1180509340.16396.210.camel@queen.suse.de>
References: <1180379564.5763.8.camel@Tux-Devil>
	<1449F58C868D8D4E9C72945771150BDF02076E14@SAUSEXMB1.amd.com>
	<1180466105.8401.5.camel@Tux-Devil>
	<1449F58C868D8D4E9C72945771150BDF02076E15@SAUSEXMB1.amd.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1449F58C868D8D4E9C72945771150BDF02076E15@SAUSEXMB1.amd.com>
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
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk, muskatnuss@gmx.at

On Tue, 2007-05-29 at 14:42 -0500, Langsdorf, Mark wrote:
> > my cpufreq directory says:
> > 
> > cpuinfo_max_freq
> > 1600000

> > scaling_max_freq
> > 800000
> > 
> > so but i've already tried to change the scaling_max_freq to 
> > 1600000 but nothing happens @ su mode.
> > if i add an line with 
> > echo 1600000 > /sys/devices...../cpufreq/scaling_max_freq
> > at booting before entering init 1 modus ... nothing happens 
> > or it says directory or file not found.
Have you tried manually at some later stage, e.g. in init 3.
You may want to use:
cat /dev/zero >/dev/null
to set the processor under load and check:
scaling_cur_freq or /proc/cpuinfo for freq changes.
> > 
> > so im not able to change this file. 
> 
> I'm not even sure how the scaling_max and the cpuinfo_max
> can be different values.  Anyone else have any ideas?
This is when the frequency got limited. AFAIK for x86 there are only two
possibilities:
  - thermal (check "watch -n1 
    cat /proc/acpi/thermal_zone/*/{trip_points,temperature}")
    If the passive cooling trip point got exceeded passive cooling
    gets enabled (also stated in /proc/acpi/thermal_zone/*/state)
  - _PPC BIOS freq limitation
    Some BIOSes limit freq e.g. when working on battery.
    In some BIOSes this is configurable (-> check BIOS)
    There was a bug, that if booted with limited freq (e.g. on some
    BIOSes when booted on battery), you will never be able to reach
    max_freq again. This has been fixed in 2.6.22-rc1 or -rc2.

    If it's _PPC it could also be some other general ACPI breakage.

> By the way, what governor are you using?

Best is you try with ondemand governor, like that you can't forget
anything to set up in userspace.


   Thomas
