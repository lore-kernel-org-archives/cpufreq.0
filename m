From: aeriksson@fastmail.fm
Subject: interrupts as source for cpufreqd rules
Date: Tue, 29 Jun 2004 19:44:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040629174459.D9FC43F03@latitude.mynet.no-ip.org>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreqd-devel@lists.sourceforge.net
Cc: cpufreq@www.linux.org.uk


Hi cpufreqd evelopers,

The attached patch add a new information source for building rules.
Now you can do:

[Rules]
interrupt_interval:1,12:1-20

And you get a hit if the sum of the increments of irq 1 and 12 under
the delay period falls within 1-20. This is useful to detect
periods of e.g. interactivity.

While doing the patch I discovered that the current rating scheme for
the different event sources was really hard to grasp. Actually, I
failed to see the logic in it, so the current approach (to set the
MATCH_INTR to 16) may or may not be correct. 

It sort of got to me that you could implement the core of cpufreqd
around the evaluation of an expression. Has that been considered? 

Comments appreciated,

/Anders

diff -Nur cpufreqd-1.1.orig/Makefile.am cpufreqd-1.1.orig-patched/Makefile.am
--- cpufreqd-1.1.orig/Makefile.am	2004-01-05 17:27:03.000000000 +0100
+++ cpufreqd-1.1.orig-patched/Makefile.am	2004-06-26 17:48:51.000000000 +0200
@@ -20,6 +20,7 @@
 sbin_PROGRAMS = cpufreqd
 
 cpufreqd_SOURCES = \
+		    interrupt.c \
                     main.c \
                     config_parser.c \
                     sys_check.c \
diff -Nur cpufreqd-1.1.orig/config_parser.c cpufreqd-1.1.orig-patched/config_parser.c
--- cpufreqd-1.1.orig/config_parser.c	2004-01-05 17:27:03.000000000 +0100
+++ cpufreqd-1.1.orig-patched/config_parser.c	2004-06-27 11:27:50.000000000 +0200
@@ -21,6 +21,8 @@
  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
+#include <limits.h>
+
 #include "cpufreqd.h"
 #include "main.h"
 #include "config_parser.h"
@@ -359,6 +361,11 @@
   r->cpu->min = 101;    /* so we won't ever trigger them... */
   r->cpu->max = -1;
   
+  /* initialize interrupt_interval */
+  r->intr = (interrupt_interval *) malloc(sizeof(interrupt_interval));
+  r->cpu->min = INT_MAX;    /* so we won't ever trigger them... */
+  r->cpu->max = -1;
+  
   while (!feof(config)) {
     char *clean;
     char *name;
@@ -393,6 +400,28 @@
     } else if (strcmp(name,"battery_interval") == 0) {
       r->bat->min = atoi(strtok(value,"-"));
       r->bat->max = atoi(strtok(NULL,""));
+    } else if (strncmp(name,"interrupt_interval",18) == 0) {
+	    char *ints,*interval;
+	    char *p;
+
+	    ints = strtok(value,":");
+	    interval = strtok(NULL,":");
+	    cp_log(LOG_DEBUG "Got ints: %s, interval: %s\n",ints,interval);
+
+	    /* Populate the interrupt bitmask */
+	    p=strtok(ints,",");
+	    while (p!= NULL) {
+		    int intno;
+		    
+		    if ((intno = atoi(p)) <=MAX_INTERRUPT) {
+			    r->intr_mask |= (1 << intno);
+			    cp_log(LOG_DEBUG "Set mask at %u, now %u\n",intno,r->intr_mask);
+		    }
+		    p=strtok(NULL,",");
+	    }    
+	    /* Set the interval */
+	    r->intr->min = atoi(strtok(interval,"-"));
+	    r->intr->max = atoi(strtok(NULL,""));
     } else if (strcmp(name,"cpu_interval") == 0) {
       r->cpu->min = atoi(strtok(value,"-"));
       r->cpu->max = atoi(strtok(NULL,""));
diff -Nur cpufreqd-1.1.orig/cpufreqd.h cpufreqd-1.1.orig-patched/cpufreqd.h
--- cpufreqd-1.1.orig/cpufreqd.h	2004-01-05 17:27:03.000000000 +0100
+++ cpufreqd-1.1.orig-patched/cpufreqd.h	2004-06-27 07:59:50.000000000 +0200
@@ -61,6 +61,7 @@
 #define CPUFREQD_STATEDIR   "/var/"
 #endif
 
+#define MAX_INTERRUPT     32
 #define CPUFREQD_CONFIG   CPUFREQD_CONFDIR"cpufreqd.conf"
 #define CPUFREQD_PIDFILE  CPUFREQD_STATEDIR"run/cpufreqd.pid"
 #define APM_PROC_FILE     "/proc/apm"
@@ -88,6 +89,11 @@
   int max;
 } cpu_interval;
 
+typedef struct {
+  int min;
+  int max;
+} interrupt_interval;
+
 typedef struct profile {
   char name[255];
   long int min_freq;
@@ -103,6 +109,8 @@
   unsigned int ac;        /* AC power state */
   battery_interval *bat;
   cpu_interval *cpu;  
+  interrupt_interval *intr;
+  int intr_mask;     
   char profile_name[255];
   struct string_list *program_list;
   profile *prof;
@@ -120,8 +128,11 @@
   unsigned int flags;
 	char version[101];
 	char time[101];
+  int intr_last[MAX_INTERRUPT];
+  int intr[MAX_INTERRUPT];
 } sys_info;
 
+#define MATCH_INTR    16
 #define MATCH_AC       8
 #define MATCH_CPU      4
 #define MATCH_BATTERY  2
Files cpufreqd-1.1.orig/interrupt and cpufreqd-1.1.orig-patched/interrupt differ
diff -Nur cpufreqd-1.1.orig/interrupt.c cpufreqd-1.1.orig-patched/interrupt.c
--- cpufreqd-1.1.orig/interrupt.c	1970-01-01 01:00:00.000000000 +0100
+++ cpufreqd-1.1.orig-patched/interrupt.c	2004-06-27 11:52:05.000000000 +0200
@@ -0,0 +1,36 @@
+#include <stdio.h>
+#include <errno.h>
+
+#include "cpufreqd.h"
+#include "main.h"
+
+#define INTERRUPTS_PROC_FILE "/proc/interrupts"
+
+int scan_interrupt_info(int *i_info) {
+  
+  FILE *fp;
+  char buf[101];
+  char ignore[101];
+  char col1[101],col2[101];
+  int i;
+  char *endptr;
+
+  fp = fopen(INTERRUPTS_PROC_FILE , "r");
+  if (!fp) {
+    cp_log(LOG_ERR, "scan_system_info(): %s: %s\n", APM_PROC_FILE, strerror(errno));
+    return(-1);
+  }
+    
+  while (fgets(buf, 100, fp)) {
+    sscanf(buf, "%s %s %s\n",
+	   col1, col2, ignore);
+    i=strtol(col1, &endptr, 10);
+    if(endptr==col1) 
+      continue; 
+    if(i>MAX_INTERRUPT) 
+      continue;
+    i_info[i]=strtol(col2, (char **)NULL, 10);
+  }
+  fclose(fp);
+  return 0;
+}
diff -Nur cpufreqd-1.1.orig/main.c cpufreqd-1.1.orig-patched/main.c
--- cpufreqd-1.1.orig/main.c	2004-01-05 17:27:03.000000000 +0100
+++ cpufreqd-1.1.orig-patched/main.c	2004-06-27 12:02:29.000000000 +0200
@@ -1,3 +1,4 @@
+
 /*
  *  Copyright (C) 2002,2003,2004  Mattia Dongili<dongili@supereva.it>
  *                                George Staikos <staikos@0wned.org>
@@ -329,6 +330,11 @@
   sys_info *_system = 0L;
   _system = (sys_info *)malloc(sizeof(sys_info)); 
   memset(_system, 0, sizeof(sys_info));
+  /* bootstrap the intr table */
+  if (scan_interrupt_info(_system->intr)<0) {
+	  cp_log(LOG_ERR, "main_loop(): Can't get interrupt info. Exiting.\n");
+	  return(-1);
+  }
   
   while (!force_exit) {
 
@@ -340,6 +346,13 @@
     _system->battery_time = 0;
     _system->cpu_percent = 0;
     
+    /* get interrupts */
+    memcpy(_system->intr_last,_system->intr,MAX_INTERRUPT*sizeof(int));
+    if (scan_interrupt_info(_system->intr)<0) {
+      cp_log(LOG_ERR, "main_loop(): Can't get interrupt info. Exiting.\n");
+      return(-1);
+    }
+    
     /* scan_system_info */
     if ((*libsys_scan_system_info)(_system)<0) {
       cp_log(LOG_ERR, "main_loop(): Can't get system info. Exiting.\n");
@@ -360,7 +373,7 @@
 
     if (_system && active_rule) {
       /* check if we need a new rule */
-      if (active_rule->hits <= (MATCH_CPU | MATCH_AC | MATCH_BATTERY | MATCH_PROG)) {
+      if (active_rule->hits <= (MATCH_INTR | MATCH_CPU | MATCH_AC | MATCH_BATTERY | MATCH_PROG)) {
 
         /* find a valid rule */
         r_temp = find_valid_rule(_system, configuration->rules);
@@ -559,7 +572,7 @@
 
   rule *r_iter = 0L;
   rule *ret = 0L;
-  int necessary_hits = (MATCH_CPU | MATCH_AC | MATCH_BATTERY | MATCH_PROG);
+  int necessary_hits = (MATCH_INTR | MATCH_CPU | MATCH_AC | MATCH_BATTERY | MATCH_PROG);
   int hits_prev = 0L;
   
   if (active_rule != NULL && active_rule->hits > 0)
@@ -570,7 +583,7 @@
     r_iter->hits = get_rule_hits(s, r_iter);
     r_iter = r_iter->next;
   }
-  
+
   while (necessary_hits > 0) {
     r_iter = r;
     
@@ -580,6 +593,7 @@
       /* TODO: add precedence factor to rules having he same score */
       if (r_iter->hits > hits_prev && r_iter->hits >= necessary_hits) {
         hits_prev = r_iter->hits;
+
         ret = r_iter;
       }
       r_iter = r_iter->next;
@@ -614,12 +628,28 @@
  */
 int get_rule_hits(const sys_info *si, const rule *r) {
   int hits = 0, debug = 0;
+  int i, intr_rate = 0;
   
   /* check battery */
   if (si->battery_percent >= r->bat->min && si->battery_percent <= r->bat->max) { 
     hits |= MATCH_BATTERY;
   }
 
+  /* check interrupts */
+  for (i=0;i<=MAX_INTERRUPT-1;i++) {
+	  if (r->intr_mask & (1<<i)) {
+		  /* This interrupt is in the rule */
+		  int diff;
+		  diff = si->intr[i] - si->intr_last[i];
+		  cp_log(LOG_DEBUG, "Interrupt %2u increased by %u\n",i,diff);
+		  intr_rate += diff;
+	  }
+  }
+  if (intr_rate >= r->intr->min && intr_rate <= r->intr->max) {
+	  hits |= MATCH_INTR;
+	  cp_log(LOG_DEBUG, "Got a hit on rule %s for interrupts, rate=%u\n",r->name,intr_rate);
+  }
+
   /* check cpu */
   if (si->cpu_percent >= r->cpu->min && si->cpu_percent <= r->cpu->max) {
     hits |= MATCH_CPU;
