From: Reimar =?iso-8859-1?Q?D=F6ffinger?=
	<Reimar.Doeffinger@stud.uni-karlsruhe.de>
Subject: [PATCH] allow powersave as default governor
Date: Wed, 31 May 2006 19:05:30 +0200
Message-ID: <20060531170530.GA9967@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk

this patch against linux 2.6.16.16 kernel adds the powersave governor to
the list of possible default governors.
Avoids noisy fan e.g. during fsck when no userspace governor is running
yet.
Tested and in use on my Athlon 64 notebook, running in 64 bit mode.

Signed-off-by: Reimar D=F6ffinger <Reimar.Doeffinger <at> gmx de>
---

diff -ur linux-2.6.16.16.orig/drivers/cpufreq/Kconfig linux-2.6.16.16/drive=
rs/cpufreq/Kconfig
--- linux-2.6.16.16.orig/drivers/cpufreq/Kconfig	2006-03-20 06:53:29.000000=
000 +0100
+++ linux-2.6.16.16/drivers/cpufreq/Kconfig	2006-05-14 12:22:47.000000000 +=
0200
@@ -66,6 +66,14 @@
 	  the frequency statically to the highest frequency supported by
 	  the CPU.
=20
+config CPU_FREQ_DEFAULT_GOV_POWERSAVE
+	bool "powersave"
+	select CPU_FREQ_GOV_POWERSAVE
+	help
+	  Use the CPUFreq governor 'powersave' as default. This sets
+	  the frequency statically to the lowest frequency supported by
+	  the CPU.
+
 config CPU_FREQ_DEFAULT_GOV_USERSPACE
 	bool "userspace"
 	select CPU_FREQ_GOV_USERSPACE
diff -ur linux-2.6.16.16.orig/drivers/cpufreq/cpufreq_powersave.c linux-2.6=
.16.16/drivers/cpufreq/cpufreq_powersave.c
--- linux-2.6.16.16.orig/drivers/cpufreq/cpufreq_powersave.c	2006-03-20 06:=
53:29.000000000 +0100
+++ linux-2.6.16.16/drivers/cpufreq/cpufreq_powersave.c	2006-05-14 12:26:51=
.000000000 +0200
@@ -32,7 +32,7 @@
 	return 0;
 }
                                                            =20
-static struct cpufreq_governor cpufreq_gov_powersave =3D {
+struct cpufreq_governor cpufreq_gov_powersave =3D {
 	.name		=3D "powersave",
 	.governor	=3D cpufreq_governor_powersave,
 	.owner		=3D THIS_MODULE,
--- linux-2.6.16.16.orig/include/linux/cpufreq.h	2006-05-14 12:23:42.000000=
000 +0200
+++ linux-2.6.16.16/include/linux/cpufreq.h	2006-05-14 12:24:32.000000000 +=
0200
@@ -276,6 +276,9 @@
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 extern struct cpufreq_governor cpufreq_gov_performance;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_performance
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE)
+extern struct cpufreq_governor cpufreq_gov_powersave;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_powersave
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
