From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Intel Core 2 T6600 (Conroe): Unknown p4-clockmod-capable
	CPU.Please send an e-mail to <linux@brodo.de>
Date: Fri, 6 Oct 2006 07:32:44 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454B2E105@scsmsx413.amr.corp.intel.com>
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
To: vherva@vianova.fi, cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>v+cpufreq@iki.fi
>Sent: Friday, October 06, 2006 6:58 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Intel Core 2 T6600 (Conroe): Unknown=20
>p4-clockmod-capable CPU.Please send an e-mail to <linux@brodo.de>
>
>You are probably getting a ton of these, but I did try to=20
>search google,
>lkml, cpufreq-git and this mailing list and came up with=20
>nothing. So perhaps
>you can point me to right direction, or ack that Core2 is not (yet)
>supported?

P4-clockmod is not the right driver that you should be using here..=20
If you are using 2.6.18, use both acpi-cpufreq and speedstep-centrino=20
and one of them work.
This is what you need in your config
CONFIG_X86_ACPI_CPUFREQ=3Dy
>   CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
>   CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=3Dy

Thanks,
Venki
