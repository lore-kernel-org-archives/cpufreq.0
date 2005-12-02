From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
	Dothan-based Celeron-M processors
Date: Fri, 2 Dec 2005 13:19:27 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60067F424F@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: CPUFreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

=20

>-----Original Message-----
>From: Bruno Ducrot [mailto:ducrot@poupinou.org]=20
>> - Support for cooling doesn't work when CPU also supports=20
>freq/voltage=20
>> scaling. Say a Enhanced Speedstep capable P4 CPU can still=20
>do throttling
>
>We use cpufreq already if present, then acpi_throttle.
>
>> for cooling. But, current cpufreq doesn't support that.
>> - Cooling driver should ideally be triggerred by thermal=20
>events and that
>> doesn't seem to happen either.
>
>I think you should look at linux/drivers/acpi/processor_thermal.c then.
>

I understand acpi_throttle and processor_thermal doing it. But,
p4-clockmod, meant for cooling should actual run like acpi_throttle and
get triggered more like throttle rather than powersaving frequency
drivers. Right?=20
Also, if throttling information is not there in ACPI, even then P4
clockmod can potentially be used as a replacement for acpi_throttle and
coexist with say acpi-cpufreq.

Thanks,
Venki
