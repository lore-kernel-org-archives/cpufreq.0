From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 7/8] cpupower: Provide -c param for cpupower monitor to schedule process on all cores
Date: Tue, 27 Nov 2012 13:17:48 +0100
Message-ID: <1354018669-63680-8-git-send-email-trenn@suse.de>
References: <1354018669-63680-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1354018669-63680-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

If an MSR based monitor is run in parallel this is not needed. This is the
default case on all/most Intel machines.

But when only sysfs info is read via cpupower monitor -m Idle_Stats (typically
the case for non root users) or when other monitors are PCI based (AMD),
Idle_Stats, read from sysfs can be totally bogus:

cpupower monitor -m Idle_Stats
PKG |CORE|CPU | POLL | C1-N | C3-N | C6-N
   0|   0|   0|  0.00|  0.00|  0.24| 99.81
   0|   0|  32|  0.00|  0.00|  0.00| 100.7
...
   0|  17|  20|  0.00|  0.00|  0.00| 173.1
   0|  17|  52|  0.00|  0.00|  0.07| 173.0
   0|  18|  68|  0.00|  0.00|  0.00|  0.00
   0|  18|  76|  0.00|  0.00|  0.00|  0.00
...


With the -c option all cores are woken up and the kernel
did update cpuidle statistics before reading out sysfs.
This causes some overhead. Therefore avoid if possible, use
if needed:

cpupower monitor -c -m Idle_Stats
PKG |CORE|CPU | POLL | C1-N | C3-N | C6-N
   0|   0|   0|  0.00|  0.00|  0.00| 100.2
   0|   0|  32|  0.00|  0.00|  0.00| 100.2
...
   0|   8|   8|  0.00|  0.00|  0.00| 99.82
   0|   8|  40|  0.00|  0.00|  0.00| 99.81
   0|   9|  24|  0.00|  0.00|  0.00| 100.3
   0|   9|  56|  0.00|  0.00|  0.00| 100.2
   0|  16|   4|  0.00|  0.00|  0.00| 99.75
   0|  16|  36|  0.00|  0.00|  0.00| 99.38
...

Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/man/cpupower-monitor.1        |   15 +++++++++++++--
 tools/power/cpupower/utils/helpers/helpers.h       |    1 +
 .../cpupower/utils/idle_monitor/cpupower-monitor.c |   18 +++++++++++++++++-
 .../cpupower/utils/idle_monitor/cpupower-monitor.h |   17 +++++++++++++++++
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/tools/power/cpupower/man/cpupower-monitor.1 b/tools/power/cpupower/man/cpupower-monitor.1
index 1141c20..e01c35d 100644
--- a/tools/power/cpupower/man/cpupower-monitor.1
+++ b/tools/power/cpupower/man/cpupower-monitor.1
@@ -7,11 +7,11 @@ cpupower\-monitor \- Report processor frequency and idle statistics
 .RB "\-l"
 
 .B cpupower monitor
-.RB [ "\-m <mon1>," [ "<mon2>,..." ] ]
+.RB [ -c ] [ "\-m <mon1>," [ "<mon2>,..." ] ]
 .RB [ "\-i seconds" ]
 .br
 .B cpupower monitor
-.RB [ "\-m <mon1>," [ "<mon2>,..." ] ]
+.RB [ -c ][ "\-m <mon1>," [ "<mon2>,..." ] ]
 .RB command
 .br
 .SH DESCRIPTION
@@ -64,6 +64,17 @@ Only display specific monitors. Use the monitor string(s) provided by \-l option
 Measure intervall.
 .RE
 .PP
+\-c
+.RS 4
+Schedule the process on every core before starting and ending measuring.
+This could be needed for the Idle_Stats monitor when no other MSR based
+monitor (has to be run on the core that is measured) is run in parallel.
+This is to wake up the processors from deeper sleep states and let the
+kernel re
+-account its cpuidle (C-state) information before reading the
+cpuidle timings from sysfs.
+.RE
+.PP
 command
 .RS 4
 Measure idle and frequency characteristics of an arbitrary command/workload.
diff --git a/tools/power/cpupower/utils/helpers/helpers.h b/tools/power/cpupower/utils/helpers/helpers.h
index f84985f..aa9e954 100644
--- a/tools/power/cpupower/utils/helpers/helpers.h
+++ b/tools/power/cpupower/utils/helpers/helpers.h
@@ -114,6 +114,7 @@ struct cpupower_topology {
 
 extern int get_cpu_topology(struct cpupower_topology *cpu_top);
 extern void cpu_topology_release(struct cpupower_topology cpu_top);
+
 /* CPU topology/hierarchy parsing ******************/
 
 /* X86 ONLY ****************************************/
diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
index 7a657f3..c4bae92 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
@@ -39,6 +39,7 @@ static int mode;
 static int interval = 1;
 static char *show_monitors_param;
 static struct cpupower_topology cpu_top;
+static unsigned int wake_cpus;
 
 /* ToDo: Document this in the manpage */
 static char range_abbr[RANGE_MAX] = { 'T', 'C', 'P', 'M', };
@@ -314,16 +315,28 @@ int fork_it(char **argv)
 int do_interval_measure(int i)
 {
 	unsigned int num;
+	int cpu;
+
+	if (wake_cpus)
+		for (cpu = 0; cpu < cpu_count; cpu++)
+			bind_cpu(cpu);
 
 	for (num = 0; num < avail_monitors; num++) {
 		dprint("HW C-state residency monitor: %s - States: %d\n",
 		       monitors[num]->name, monitors[num]->hw_states_num);
 		monitors[num]->start();
 	}
+
 	sleep(i);
+
+	if (wake_cpus)
+		for (cpu = 0; cpu < cpu_count; cpu++)
+			bind_cpu(cpu);
+
 	for (num = 0; num < avail_monitors; num++)
 		monitors[num]->stop();
 
+
 	return 0;
 }
 
@@ -332,7 +345,7 @@ static void cmdline(int argc, char *argv[])
 	int opt;
 	progname = basename(argv[0]);
 
-	while ((opt = getopt(argc, argv, "+li:m:")) != -1) {
+	while ((opt = getopt(argc, argv, "+lci:m:")) != -1) {
 		switch (opt) {
 		case 'l':
 			if (mode)
@@ -351,6 +364,9 @@ static void cmdline(int argc, char *argv[])
 			mode = show;
 			show_monitors_param = optarg;
 			break;
+		case 'c':
+			wake_cpus = 1;
+			break;
 		default:
 			print_wrong_arg_exit();
 		}
diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.h b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.h
index 9312ee1..9e43f33 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.h
+++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.h
@@ -65,4 +65,21 @@ extern long long timespec_diff_us(struct timespec start, struct timespec end);
 				"could be inaccurate\n"), mes, ov);		\
 }
 
+
+/* Taken over from x86info project sources  -> return 0 on success */
+#include <sched.h>
+#include <sys/types.h>
+#include <unistd.h>
+static inline int bind_cpu(int cpu)
+{
+	cpu_set_t set;
+
+	if (sched_getaffinity(getpid(), sizeof(set), &set) == 0) {
+		CPU_ZERO(&set);
+		CPU_SET(cpu, &set);
+		return sched_setaffinity(getpid(), sizeof(set), &set);
+	}
+	return 1;
+}
+
 #endif /* __CPUIDLE_INFO_HW__ */
-- 
1.7.6.1

