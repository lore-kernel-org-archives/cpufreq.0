From: =?ISO-8859-1?Q?S=E9rgio?= Monteiro Basto <sergiomb@netcabo.pt>
Subject: compile smp error
Date: Tue, 06 Jul 2004 02:27:23 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1089077242.3446.5.camel@darkstar>
Reply-To: sergiomb@netcabo.pt
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

Hi,
This hunk give a compile error on kernel-2.4.27-rc3,
EXPORT_SYMBOLs are already in the code 10 lines above.

--- linux-original/arch/i386/kernel/i386_ksyms.c        2003-11-28 19:26:19=
.000000000 +0100
+++ linux/arch/i386/kernel/i386_ksyms.c 2003-12-06 00:00:46.000000000 +0100
@@ -131,7 +131,9 @@
 EXPORT_SYMBOL(cpu_data);
 EXPORT_SYMBOL(kernel_flag_cacheline);
 EXPORT_SYMBOL(smp_num_cpus);
+EXPORT_SYMBOL(smp_num_siblings);
 EXPORT_SYMBOL(cpu_online_map);
+EXPORT_SYMBOL(cpu_sibling_map);
 EXPORT_SYMBOL_NOVERS(__write_lock_failed);
 EXPORT_SYMBOL_NOVERS(__read_lock_failed);

thanks,
--=20
S=E9rgio M. B.
