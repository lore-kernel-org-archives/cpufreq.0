From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Uninitialized use of cmd.val
	inarch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:423
Date: Tue, 2 Jan 2007 09:57:29 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454010D1506@scsmsx413.amr.corp.intel.com>
References: <459A7EFD.2040204@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <459A7EFD.2040204@yahoo.fr>
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
To: Guillaume Chazarain <guichaz@yahoo.fr>, cpufreq@lists.linux.org.uk
Cc: davej@redhat.com


Thanks for the patch! This was indeed a bug in the driver..
Acking the second patch  acpi_cpufreq_uninitialized_cmd_val2 patch.

Can you please resend with description of the bug and Signed off line
and copy Dave so that he can pick up this patch.

Thanks,
Venki
=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Guillaume Chazarain
>Sent: Tuesday, January 02, 2007 7:49 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Uninitialized use of cmd.val=20
>inarch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:423
>
>Hi,
>
>In arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:acpi_cpufreq_target()
>cmd.val =3D (cmd.val & ~INTEL_MSR_RANGE) | msr;
>
>cmd.val seems to be used uninitialized. So, one of the attached patch
>should be needed. Both patches, and no patch at all, work for=20
>me though.
>
>This is linux-2.6.20-rc3 and the code is really executed (I=20
>traced it) with
>my Pentium M.
>
>Thanks.
>
>--=20
>Guillaume
>
>
