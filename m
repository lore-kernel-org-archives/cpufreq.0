From: Thomas Renninger <trenn@suse.de>
Subject: Re: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change
	Frequency!
Date: Wed, 30 May 2007 19:05:30 +0200
Message-ID: <1180544730.27891.47.camel@queen.suse.de>
References: <1180379564.5763.8.camel@Tux-Devil>
	<1449F58C868D8D4E9C72945771150BDF02076E14@SAUSEXMB1.amd.com>
	<1180466105.8401.5.camel@Tux-Devil>
	<1449F58C868D8D4E9C72945771150BDF02076E15@SAUSEXMB1.amd.com>
	<1180509340.16396.210.camel@queen.suse.de>
	<1180543374.5534.6.camel@Tux-Devil>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1180543374.5534.6.camel@Tux-Devil>
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
To: muskatnuss@gmx.at
Cc: cpufreq@lists.linux.org.uk

On Wed, 2007-05-30 at 18:42 +0200, Muskat Nuss wrote:
> So i tried this commands after adding cat /dev/zero >/dev/null 
> to my boot file.
> 
> cat /proc/acpi/thermal_zone/*/state
> state:                   ok
> 
> cat /proc/acpi/thermal_zone/*/{trip_points,temperature}
> critical (S5):           100 C
> temperature:             51 C
> 
> so i already done an bios update to newest version 7.0c
> and checked my bios but no "_PPC BIOS freq limitation"
> anywhere
> 
> now i tried using only the ondemand governor.
> so i got as default Performance, so i also tried 
> ondemand .... Nothing happens to my cpu.

Hmm, it can't be the passive trip point, your BIOS doesn't declare one.
Only thing I could imagine is _PPC or some weird cpufreq bug.

Could you open a bug entry on bugzilla.kernel.org, put me into CC and
attach acpidump and dmesg output.

If you know how to compile the latest kernel, it would be great if you
could add CPU_FREQ_DEBUG=y and ACPI_DEBUG=y in the compile options and
boot with cpufreq.debug=7 and again post dmesg output after powernow-k8
got loaded and ondemand got activated for a short while.


   Thomas
