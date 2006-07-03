From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - There are limits
Date: Mon, 03 Jul 2006 07:18:12 +0200
Message-ID: <44A8A894.7020907@interia.pl>
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

Changes in Kconfig:
1. ACPI_PROCESSOR - next patch need ACPI C3 state working,
2. !X86_UP_APIC - (un)patched "longhaul" isn't APIC compatible,
3. !SMP - (un)patched "longhaul" isn't SMP compatible. First=20
step would be APIC support. Second - per CPU private data.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

--- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/Kconfig.orig	2006-06-18=
 03:49:35.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-07-02 19:4=
8:40.000000000 +0200
@@ -202,7 +202,7 @@ config X86_LONGRUN
 config X86_LONGHAUL
 	tristate "VIA Cyrix III Longhaul"
 	select CPU_FREQ_TABLE
-	depends on BROKEN
+	depends on !SMP && !X86_UP_APIC && ACPI_PROCESSOR
 	help
 	  This adds the CPUFreq driver for VIA Samuel/CyrixIII,
 	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T


------------------------------------------------------------------------
Wyje=BFd=BFasz na wakacje? Zaplanuj tras=EA z map24.=20
http://map24.interia.pl
