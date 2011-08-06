From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [cpupower] RFC: support "cpupower subcommand [ -c cpulist ]"
Date: Sat, 6 Aug 2011 17:18:29 +0200
Message-ID: <20110806151829.GA8559@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

Currently, one needs to set the cpulist _before_ the subcommand, i.e.

	cpupower [ -c cpulist ] subcommand [ARGS]

However, cpufrequtils used to allow to have "-c CPU" as a parameter to
cpufreq-set(1) or cpufreq-info(1). Therefore, it may make sense to also
support

	cpupower subcommand [ARGS#1] [ -c cpulist ] [ARGS#2]

The attached patch attempts to do so, but I'm not yet 100% convinced myself
that a) we should do this at all, and b) that I chose the right approach.

Best,
	Dominik

diff --git a/tools/power/cpupower/utils/cpupower.c b/tools/power/cpupower/utils/cpupower.c
index 5844ae0..1bb02df 100644
--- a/tools/power/cpupower/utils/cpupower.c
+++ b/tools/power/cpupower/utils/cpupower.c
@@ -101,20 +101,26 @@ static void print_version(void)
 	printf(_("Report errors and bugs to %s, please.\n"), PACKAGE_BUGREPORT);
 }
 
-static void handle_options(int *argc, const char ***argv)
+static char **handle_options(int *argc, const char ***argv)
 {
 	int ret, x, new_argc = 0;
+	int before_command = 1;
+	char **new_argv;
 
 	if (*argc < 1)
-		return;
+		return NULL;
 
-	for (x = 0;  x < *argc && ((*argv)[x])[0] == '-'; x++) {
+	new_argv = calloc(*argc, sizeof(unsigned long));
+	for (x = 0;  x < *argc; x++) {
 		const char *param = (*argv)[x];
-		if (!strcmp(param, "-h") || !strcmp(param, "--help")) {
+		if (param[0] != '-')
+			before_command = 0;
+		if ((!strcmp(param, "-h") || !strcmp(param, "--help"))
+			&& before_command) {
 			print_help();
 			exit(EXIT_SUCCESS);
 		} else if (!strcmp(param, "-c") || !strcmp(param, "--cpu")) {
-			if (*argc < 2) {
+			if ((*argc < 2) || (*argc == x + 1)) {
 				print_help();
 				exit(EXIT_FAILURE);
 			}
@@ -129,9 +135,8 @@ static void handle_options(int *argc, const char ***argv)
 					exit(EXIT_FAILURE);
 				}
 			}
+			/* Cut out the next param as well */
 			x += 1;
-			/* Cut out param: cpupower -c 1 info -> cpupower info */
-			new_argc += 2;
 			continue;
 		} else if (!strcmp(param, "-v") ||
 			!strcmp(param, "--version")) {
@@ -140,30 +145,31 @@ static void handle_options(int *argc, const char ***argv)
 #ifdef DEBUG
 		} else if (!strcmp(param, "-d") || !strcmp(param, "--debug")) {
 			be_verbose = 1;
-			new_argc++;
-			continue;
 #endif
-		} else {
-			fprintf(stderr, "Unknown option: %s\n", param);
+		} else if (before_command) {
+			fprintf(stderr, "1 Unknown option: %s\n", param);
 			print_help();
 			exit(EXIT_FAILURE);
 		}
+		new_argv[new_argc] = strdup(param);
+		new_argc += 1;
 	}
-	*argc -= new_argc;
-	*argv += new_argc;
+	*argc = new_argc;
+	return new_argv;
 }
 
-int main(int argc, const char *argv[])
+int main(int argc, const char *i_argv[])
 {
-	const char *cmd;
+	char *cmd;
 	unsigned int i, ret;
+	char **argv;
 
 	cpus_chosen = bitmask_alloc(sysconf(_SC_NPROCESSORS_CONF));
 
 	argc--;
-	argv += 1;
+	i_argv += 1;
 
-	handle_options(&argc, &argv);
+	argv = handle_options(&argc, &i_argv);
 
 	cmd = argv[0];
 
@@ -193,7 +199,7 @@ int main(int argc, const char *argv[])
 					  "privileges\n"), cmd);
 			return EXIT_FAILURE;
 		}
-		ret = p->main(argc, argv);
+		ret = p->main(argc, (const char **) argv);
 		if (cpus_chosen)
 			bitmask_free(cpus_chosen);
 		return ret;
