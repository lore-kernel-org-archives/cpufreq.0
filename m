From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] Fix
	/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq with
	acpi-cpufreq and ondemand
Date: Tue, 2 Jan 2007 09:46:37 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454010D14DF@scsmsx413.amr.corp.intel.com>
References: <459A7D3F.60309@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <459A7D3F.60309@yahoo.fr>
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
To: Guillaume Chazarain <guichaz@yahoo.fr>, "Sadykov, Denis M" <denis.m.sadykov@intel.com>, cpufreq@lists.linux.org.uk


Hi,

This issue has been fixed in an earlier patch which is in mm right now
http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.20-rc2/2.
6.20-rc2-mm1/broken-out/git-cpufreq.patch
    [CPUFREQ] Bug fix for acpi-cpufreq and cpufreq_stats oops on
frequency change notification

Can you please check with 2.6.20-rc2-mm1 and report if there are any
issues with that kernel.

Thanks,
Venki

>-----Original Message-----
>From: Guillaume Chazarain [mailto:guichaz@yahoo.fr]=20
>Sent: Tuesday, January 02, 2007 7:42 AM
>To: Sadykov, Denis M; Pallipadi, Venkatesh; cpufreq@lists.linux.org.uk
>Subject: [PATCH] Fix=20
>/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq with=20
>acpi-cpufreq and ondemand
>
>Hi,
>
>This is 2.6.20 material I think.
>
>--=20
>Guillaume
>
>
