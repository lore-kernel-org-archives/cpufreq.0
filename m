From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.58,1.59
Date: Thu, 26 Aug 2004 14:25:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C0KGE-0006oZ-2m@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv26017

Modified Files:
	patch 
Log Message:
merge with current cpufreq bk tree and 2.6.9-r1

Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.58
retrieving revision 1.59
diff -u -r1.58 -r1.59
--- patch	5 Nov 2003 18:27:40 -0000	1.58
+++ patch	26 Aug 2004 13:25:15 -0000	1.59
@@ -0,0 +1,14 @@
+--- linux.original/include/asm-i386/acpi.h	2004/08/26 13:13:44
++++ linux/include/asm-i386/acpi.h	2004/08/26 13:14:33
+@@ -101,6 +101,11 @@
+         :"=r"(n_hi), "=r"(n_lo)     \
+         :"0"(n_hi), "1"(n_lo))
+ 
++/*
++ * Refer Intel ACPI _PDC support document for bit definitions
++ */
++#define ACPI_PDC_EST_CAPABILITY_SMP 	0xa
++#define ACPI_PDC_EST_CAPABILITY_MSR	0x1
+ 
+ #ifdef CONFIG_ACPI_BOOT 
+ extern int acpi_lapic;
