From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Cpufreq on kernel 2.6.18
Date: Fri, 6 Oct 2006 16:08:22 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454B2E59D@scsmsx413.amr.corp.intel.com>
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
To: Luca <morpheus@ferrara.linux.it>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Luca
>Sent: Friday, October 06, 2006 1:01 PM
>To: cpufreq@lists.linux.org.uk
>Subject: Cpufreq on kernel 2.6.18
>
>Hello,
>I just updated the kernel from 2.6.15.2 to 2.6.18 and the=20
>frequency scaling of my Centrinlo Laptop stopped working=20
>(keeping the same configuration).
>The dir /sys/devices/system/cpu/cpu0/ is empty and I don't=20
>know which other tests I could make.
>I also tried to move CONFIG_X86_ACPI_CPUFREQ from builtin to=20
>module: loading the module does not give any information nor any error.
>I need 2.6.18 for other drivers, so it would be really nice if=20
>I could solve this problem that seems to be the only driver=20
>that's not working properly (and my battery would be much happier :) )
>If you need more informations just tell me.
>

Can you enable CPU_FREQ_DEBUG in your config and pass =
"cpufreq.debug=3D3"
in kernel parameter and send in the dmesg log.

Thanks,
Venki
