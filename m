From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] acpi-cpufreq: force transitions even if driver thinks
	CPU is already at given P-State
Date: Fri, 8 Oct 2004 14:01:54 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60030F1A5B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk, davej@redhat.com


>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.de]=20
>Sent: Friday, October 08, 2004 12:46 PM
>To: cpufreq@www.linux.org.uk; Pallipadi, Venkatesh; davej@redhat.com
>Subject: [PATCH] acpi-cpufreq: force transitions even if=20
>driver thinks CPU is already at given P-State
>
>[applies on top of bk-cpufreq and the 34 patches already pushed]
>
>As it isn't possible to determine whether the P-state last set is
>still the one currently active in the platform, transitions shouldn't
>abort because the driver thinks the CPU is already at the target state.
>Also, it is good to know with what status a transition failed, so print
>out that value -- that snipped is from Venkates Pallipadi in his test
>patch for bug # 3507.
>
>Signed-off-by: Dominik Brodowski <linux@brodo.de>
>
>diff -ruN=20
>linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c=20
>linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
>--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c=09
>2004-09-27 23:11:45.000000000 +0200
>+++ linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c=09
>2004-10-08 21:21:46.947060184 +0200
>@@ -118,12 +118,6 @@
> 		return (-EAGAIN);
> 	}
> =09
>-	if (state =3D=3D data->acpi_data.state) {
>-		dprintk("Already at target state (P%d)\n", state);
>-		retval =3D 0;
>-		goto migrate_end;
>-	}
>-


I am worried about the performance implication that this would have
with governors like ondemand. Especially since writing to IO port=20
involves some SMM transitions and may cost something like 100uS.

Thanks,
Venki
