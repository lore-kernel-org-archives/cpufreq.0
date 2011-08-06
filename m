From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [cpupower] RFC: use man(1) when calling "cpupower help subcommand"
Date: Sat, 6 Aug 2011 18:11:43 +0200
Message-ID: <20110806161143.GA12443@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

Instead of printing something non-formatted to stdout, call
man(1) to show the man page for the proper subcommand.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/tools/power/cpupower/man/cpupower-frequency-info.1 b/tools/power/cpupower/man/cpupower-frequency-info.1
index 3194811..bb60a8d 100644
--- a/tools/power/cpupower/man/cpupower-frequency-info.1
+++ b/tools/power/cpupower/man/cpupower-frequency-info.1
@@ -1,10 +1,10 @@
-.TH "cpufreq-info" "1" "0.1" "Mattia Dongili" ""
+.TH "cpupower-frequency-info" "1" "0.1" "Mattia Dongili" ""
 .SH "NAME"
 .LP 
-cpufreq\-info \- Utility to retrieve cpufreq kernel information
+cpupower frequency\-info \- Utility to retrieve cpufreq kernel information
 .SH "SYNTAX"
 .LP 
-cpufreq\-info [\fIoptions\fP]
+cpupower [ \-c cpulist ] frequency\-info [\fIoptions\fP]
 .SH "DESCRIPTION"
 .LP 
 A small tool which prints out cpufreq information helpful to developers and interested users.
diff --git a/tools/power/cpupower/man/cpupower-frequency-set.1 b/tools/power/cpupower/man/cpupower-frequency-set.1
index 26e3e13..685f469 100644
--- a/tools/power/cpupower/man/cpupower-frequency-set.1
+++ b/tools/power/cpupower/man/cpupower-frequency-set.1
@@ -1,13 +1,13 @@
-.TH "cpufreq-set" "1" "0.1" "Mattia Dongili" ""
+.TH "cpupower-freqency-set" "1" "0.1" "Mattia Dongili" ""
 .SH "NAME"
 .LP 
-cpufreq\-set \- A small tool which allows to modify cpufreq settings.
+cpupower frequency\-set \- A small tool which allows to modify cpufreq settings.
 .SH "SYNTAX"
 .LP 
-cpufreq\-set [\fIoptions\fP]
+cpupower [ \-c cpu ] frequency\-set [\fIoptions\fP]
 .SH "DESCRIPTION"
 .LP 
-cpufreq\-set allows you to modify cpufreq settings without having to type e.g. "/sys/devices/system/cpu/cpu0/cpufreq/scaling_set_speed" all the time.
+cpupower frequency\-set allows you to modify cpufreq settings without having to type e.g. "/sys/devices/system/cpu/cpu0/cpufreq/scaling_set_speed" all the time.
 .SH "OPTIONS"
 .LP 
 .TP 
diff --git a/tools/power/cpupower/man/cpupower.1 b/tools/power/cpupower/man/cpupower.1
index 78c20fe..baf741d 100644
--- a/tools/power/cpupower/man/cpupower.1
+++ b/tools/power/cpupower/man/cpupower.1
@@ -3,7 +3,7 @@
 cpupower \- Shows and sets processor power related values
 .SH SYNOPSIS
 .ft B
-.B cpupower [ \-c cpulist ] subcommand [ARGS]
+.B cpupower [ \-c cpulist ] <command> [ARGS]
 
 .B cpupower \-v|\-\-version
 
@@ -13,24 +13,24 @@ cpupower \- Shows and sets processor power related values
 \fBcpupower \fP is a collection of tools to examine and tune power saving
 related features of your processor.
 
-The manpages of the subcommands (cpupower\-<subcommand>(1)) provide detailed
+The manpages of the commands (cpupower\-<command>(1)) provide detailed
 descriptions of supported features. Run \fBcpupower help\fP to get an overview
-of supported subcommands.
+of supported commands.
 
 .SH Options
 .PP
 \-\-help, \-h
 .RS 4
-Shows supported subcommands and general usage.
+Shows supported commands and general usage.
 .RE
 .PP
 \-\-cpu cpulist,  \-c cpulist
 .RS 4
 Only show or set values for specific cores.
-This option is not supported by all subcommands, details can be found in the
-manpages of the subcommands.
+This option is not supported by all commands, details can be found in the
+manpages of the commands.
 
-Some subcommands access all cores (typically the *\-set commands), some only
+Some commands access all cores (typically the *\-set commands), some only
 the first core (typically the *\-info commands) by default.
 
 The syntax for <cpulist> is based on how the kernel exports CPU bitmasks via
diff --git a/tools/power/cpupower/utils/builtin.h b/tools/power/cpupower/utils/builtin.h
index c870ffb..c10496f 100644
--- a/tools/power/cpupower/utils/builtin.h
+++ b/tools/power/cpupower/utils/builtin.h
@@ -8,11 +8,4 @@ extern int cmd_freq_info(int argc, const char **argv);
 extern int cmd_idle_info(int argc, const char **argv);
 extern int cmd_monitor(int argc, const char **argv);
 
-extern void set_help(void);
-extern void info_help(void);
-extern void freq_set_help(void);
-extern void freq_info_help(void);
-extern void idle_info_help(void);
-extern void monitor_help(void);
-
 #endif
diff --git a/tools/power/cpupower/utils/cpupower.c b/tools/power/cpupower/utils/cpupower.c
index 5844ae0..8bbd3db 100644
--- a/tools/power/cpupower/utils/cpupower.c
+++ b/tools/power/cpupower/utils/cpupower.c
@@ -11,6 +11,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <errno.h>
 
 #include "builtin.h"
 #include "helpers/helpers.h"
@@ -19,7 +20,6 @@
 struct cmd_struct {
 	const char *cmd;
 	int (*main)(int, const char **);
-	void (*usage)(void);
 	int needs_root;
 };
 
@@ -44,55 +44,66 @@ int be_verbose;
 static void print_help(void);
 
 static struct cmd_struct commands[] = {
-	{ "frequency-info",	cmd_freq_info,	freq_info_help,	0	},
-	{ "frequency-set",	cmd_freq_set,	freq_set_help,	1	},
-	{ "idle-info",		cmd_idle_info,	idle_info_help,	0	},
-	{ "set",		cmd_set,	set_help,	1	},
-	{ "info",		cmd_info,	info_help,	0	},
-	{ "monitor",		cmd_monitor,	monitor_help,	0	},
-	{ "help",		cmd_help,	print_help,	0	},
-	/*	{ "bench",	cmd_bench,	NULL,		1	}, */
+	{ "frequency-info",	cmd_freq_info,	0	},
+	{ "frequency-set",	cmd_freq_set,	1	},
+	{ "idle-info",		cmd_idle_info,	0	},
+	{ "set",		cmd_set,	1	},
+	{ "info",		cmd_info,	0	},
+	{ "monitor",		cmd_monitor,	0	},
+	{ "help",		cmd_help,	0	},
+	/*	{ "bench",	cmd_bench,	1	}, */
 };
 
-int cmd_help(int argc, const char **argv)
-{
-	unsigned int i;
-
-	if (argc > 1) {
-		for (i = 0; i < ARRAY_SIZE(commands); i++) {
-			struct cmd_struct *p = commands + i;
-			if (strcmp(p->cmd, argv[1]))
-				continue;
-			if (p->usage) {
-				p->usage();
-				return EXIT_SUCCESS;
-			}
-		}
-	}
-	print_help();
-	if (argc == 1)
-		return EXIT_SUCCESS; /* cpupower help */
-	return EXIT_FAILURE;
-}
-
 static void print_help(void)
 {
 	unsigned int i;
 
 #ifdef DEBUG
-	printf(_("cpupower [ -d ][ -c cpulist ] subcommand [ARGS]\n"));
-	printf(_("  -d, --debug      May increase output (stderr) on some subcommands\n"));
+	printf(_("Usage:\tcpupower [-d|--debug] [-c|--cpu cpulist ] <command> [<args>]\n"));
 #else
-	printf(_("cpupower [ -c cpulist ] subcommand [ARGS]\n"));
+	printf(_("Usage:\tcpupower [-c|--cpu cpulist ] <command> [<args>]\n"));
 #endif
-	printf(_("cpupower --version\n"));
-	printf(_("Supported subcommands are:\n"));
+	printf(_("Supported commands are:\n"));
 	for (i = 0; i < ARRAY_SIZE(commands); i++)
 		printf("\t%s\n", commands[i].cmd);
-	printf(_("\nSome subcommands can make use of the -c cpulist option.\n"));
-	printf(_("Look at the general cpupower manpage how to use it\n"));
-	printf(_("and read up the subcommand's manpage whether it is supported.\n"));
-	printf(_("\nUse cpupower help subcommand for getting help for above subcommands.\n"));
+	printf(_("\nNot all commands can make use of the -c cpulist option.\n"));
+	printf(_("\nUse 'cpupower help <command>' for getting help for above commands.\n"));
+}
+
+static int print_man_page(const char *subpage)
+{
+	int len;
+	char *page;
+
+	len = 10; /* enough for "cpupower-" */
+	if (subpage != NULL)
+		len += strlen(subpage);
+
+	page = malloc(len);
+	if (!page)
+		return -ENOMEM;
+
+	sprintf(page, "cpupower");
+	if ((subpage != NULL) && strcmp(subpage, "help")) {
+		strcat(page, "-");
+		strcat(page, subpage);
+	}
+
+	execlp("man", "man", page, NULL);
+
+	/* should not be reached */
+	return -EINVAL;
+}
+
+int cmd_help(int argc, const char **argv)
+{
+	if (argc > 1) {
+		print_man_page(argv[1]); /* exits within execlp() */
+		return EXIT_FAILURE;
+	}
+
+	print_help();
+	return EXIT_SUCCESS;
 }
 
 static void print_version(void)
