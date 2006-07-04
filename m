From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - There are limits
Date: Tue, 04 Jul 2006 17:50:57 +0200
Message-ID: <44AA8E61.7030807@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

Hello!

There is no need to worry about local APIC.
There is need to worry about I/O APIC, because I/O APIC=20
is replacing good old 8259. Acording to Nehemiah datasheet VIA is=20
using 3-wire bus to connect local APIC to I/O APIC.

"[...] When IA32_APIC_BASE[11] is set to 0, processor APICs based on the 3-=
wire APIC
 bus cannot be generally re-enabled until a system hardware reset. The 3-wi=
re bus
 looses track of arbitration that would be necessary for complete re-enabli=
ng. Certain
 (local) APIC functionality can be enabled. [...]"

So we must set disable bit for each interrupt in I/O APIC registers.=20
Same situation as for PIC - we must poke registers direcly.
How to do this? I don't know. So at the moment it is better=20
to fail.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff -uprN -X linux-2.6.17-git20-vanilla/Documentation/dontdiff linux-2.6.1=
7-git20-vanilla/arch/i386/kernel/cpu/cpufreq/Kconfig linux-2.6.17-git20/arc=
h/i386/kernel/cpu/cpufreq/Kconfig
--- linux-2.6.17-git20-vanilla/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-06=
-18 03:49:35.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-07-04 16:0=
3:36.000000000 +0200
@@ -202,7 +202,7 @@ config X86_LONGRUN
 config X86_LONGHAUL
 	tristate "VIA Cyrix III Longhaul"
 	select CPU_FREQ_TABLE
-	depends on BROKEN
+	depends on ACPI_PROCESSOR
 	help
 	  This adds the CPUFreq driver for VIA Samuel/CyrixIII,
 	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T
diff -uprN -X linux-2.6.17-git20-vanilla/Documentation/dontdiff linux-2.6.1=
7-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c linux-2.6.17-git20/=
arch/i386/kernel/cpu/cpufreq/longhaul.c
--- linux-2.6.17-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006=
-07-02 19:41:52.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-04 1=
7:11:21.000000000 +0200
@@ -534,6 +534,15 @@ static int __init longhaul_cpu_init(stru
 	char *cpuname=3DNULL;
 	int ret;
=20
+#ifdef CONFIG_SMP
+	if (num_online_cpus() > 1)
+		return -ENODEV;
+#endif
+#ifdef CONFIG_X86_IO_APIC
+	if (cpu_has_apic)
+		return -ENODEV;
+#endif
+
 	switch (c->x86_model) {
 	case 6:
 		cpu_model =3D CPU_SAMUEL;

------------------------------------------------------------------------
Interaktywne mapy miast na http://map24.interia.pl/
