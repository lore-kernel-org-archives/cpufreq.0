From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [ANNOUNCE] CPUSpeed 1.2.1 released!
Date: Tue, 11 Jan 2005 23:53:34 +0100
Message-ID: <20050111225334.GC10025@dominikbrodowski.de>
References: <41E1EE54.2050200@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41E1EE54.2050200@carlthompson.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl Thompson <cet@carlthompson.net>
Cc: cpufreq@www.linux.org.uk

Hi Carl,

> As always, feedback is welcome.
Could you merge this patch (or an adaption if you want to preserve the
direct interface) to CPUSpeed? I haven't re-diffed it to the new version,
but as I already had sent it earlier... I'm willing to re-diff, of course,
but want your feedback first.

Thanks,
	Dominik

diff -ruN cpuspeed-1.1/cpuspeed.cc cpuspeed-1.1-libcpufreq/cpuspeed.cc
--- cpuspeed-1.1/cpuspeed.cc	2003-11-08 00:07:14.000000000 +0100
+++ cpuspeed-1.1-libcpufreq/cpuspeed.cc	2004-11-14 11:36:56.706589216 +0100
@@ -15,6 +15,7 @@
 
     Contributors:
         Enrico Tassi <gareuselesinge@libero.it>
+	Dominik Brodowski <linux@brodo.de>
 
     This program is only for computers with Linux kernels compiled with
     CPUFreq.  You must have a CPU that supports frequency and/or voltage
@@ -35,6 +36,7 @@
 #include <stdarg.h>
 #include <time.h>
 #include <sys/utsname.h>
+#include <cpufreq.h>
 
 #ifndef NAME
 #  define NAME "cpuspeed"
@@ -52,42 +54,6 @@
 #   define errprintf(A...)
 #endif
 
-#define SYSFS_MIN_SPEED_FILE \
-    "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq"
-
-#define SYSFS_MAX_SPEED_FILE \
-     "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq"
-
-#define SYSFS_CURRENT_SPEED_FILE \
-     "/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed"
-
-#define SYSFS_GOVERNOR_FILE \
-     "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
-
-#define SYSFS_USERSPACE \
-    "userspace"
-
-#define PROC_MIN_SPEED_FILE \
-    "/proc/sys/cpu/0/speed-min"
-
-#define PROC_MAX_SPEED_FILE \
-    "/proc/sys/cpu/0/speed-max"
-
-#define PROC_CURRENT_SPEED_FILE \
-    "/proc/sys/cpu/0/speed"
-
-#define PROC_GOVERNOR_FILE \
-    "/proc/cpufreq"
-
-#define PROC_USERSPACE \
-    "0%0%100%userspace"
-
-char * MIN_SPEED_FILE;
-char * MAX_SPEED_FILE;
-char * CURRENT_SPEED_FILE;
-char * GOVERNOR_FILE;
-char * USERSPACE;
-
 // defines what info we care about for each speed step
 struct
 {
@@ -128,22 +94,6 @@
     fclose(fp);
 }
 
-// write a line to a file
-void
-write_line(const char * filename, const char *fmt, ...)
-{
-    FILE * fp = fopen(filename, "w+");
-    if (!fp)
-        die(true, "Could not open file for writing: %s", filename);
-    va_list ap;
-    // get variable argument list passed
-    va_start(ap, fmt);
-    if (vfprintf(fp, fmt, ap) < 0)
-        die(true, "Could not write to file: %s", filename);
-    va_end(ap);
-    fclose(fp);
-}
-
 // read an integer value from a file
 unsigned
 read_value(const char * filename)
@@ -156,14 +106,14 @@
 // get the current CPU speed
 unsigned get_speed()
 {
-    return read_value(CURRENT_SPEED_FILE);
+  return cpufreq_get_freq_kernel(0);
 }
 
 // set the current CPU speed
 void set_speed(unsigned value)
 {
     errprintf("Setting speed to: %uKHz\n", value);
-    write_line(CURRENT_SPEED_FILE, "%u\n", value);
+    cpufreq_set_frequency(0, value);
     // give CPU / chipset voltage time to settle down
     usleep(10000);
 }
@@ -191,9 +141,42 @@
 void
 get_supported_speeds()
 {
-    unsigned min = read_value(MIN_SPEED_FILE);
-    unsigned max = read_value(MAX_SPEED_FILE);
+    unsigned long min;
+    unsigned long max;
     const unsigned step = 25000;
+    struct cpufreq_available_frequencies *freqs, *tmp;
+    unsigned current_speed = 0;
+    int ret;
+
+    freqs = cpufreq_get_available_frequencies(0);
+    if (freqs) {
+        unsigned int count = 0;
+        /* these may be unsorted */
+        tmp = freqs;
+        while (tmp) {
+            count++;
+	    tmp = tmp->next;
+	}
+	if (count > (MAX_SPEEDS - 1))
+             count = (MAX_SPEEDS - 1);
+        max = 20000000;
+	for (current_speed = 0; (current_speed < count); current_speed++) {
+            min = 0;
+	    tmp = freqs;
+	    while (tmp) {
+	        if ((tmp->frequency < max) && (tmp->frequency > min))
+		   min = freqs->frequency;
+		tmp = tmp->next;
+	    }
+            speeds[current_speed].khz = min;
+	    max = min;
+	}
+	speeds[count].khz = 0;
+        cpufreq_put_available_frequencies(freqs);
+        return;
+    }
+
+    ret = cpufreq_get_hardware_limits(0, &min, &max);
 
     // Go to max speed if we are not already there
     for (unsigned current = get_speed(); current < max; current += step)
@@ -203,7 +186,6 @@
     // CPU by looping from the maximum speed to the minimum speed and trying
     // to set every possible speed divisible by step!
     speeds[0].khz = max;
-    unsigned current_speed = 0;
     for (unsigned current = max - step; current > min - step; current -= step)
     {
         set_speed(current);
@@ -421,26 +403,8 @@
 int
 main(unsigned argc, char * argv[])
 {
-    struct utsname un;
-    uname(&un);
-    if (!strncmp(un.release, "2.4", 3))
-    {
-        MIN_SPEED_FILE = PROC_MIN_SPEED_FILE;
-        MAX_SPEED_FILE = PROC_MAX_SPEED_FILE;
-        CURRENT_SPEED_FILE = PROC_CURRENT_SPEED_FILE;
-        GOVERNOR_FILE = PROC_GOVERNOR_FILE;
-        USERSPACE = PROC_USERSPACE;
-    }
-    else
-    {
-        MIN_SPEED_FILE = SYSFS_MIN_SPEED_FILE;
-        MAX_SPEED_FILE = SYSFS_MAX_SPEED_FILE;
-        CURRENT_SPEED_FILE = SYSFS_CURRENT_SPEED_FILE;
-        GOVERNOR_FILE = SYSFS_GOVERNOR_FILE;
-        USERSPACE = SYSFS_USERSPACE;
-    }
-
     unsigned interval = 20; // 2 seconds
+    int ret;
     bool daemonize = false;
 
     // parse argv
@@ -546,11 +510,11 @@
         }
     }
 
+    
     // use the userspace governor
-    write_line(GOVERNOR_FILE, "%s\n", USERSPACE);
-
-    if (access(CURRENT_SPEED_FILE, W_OK) < 0)
-        die(true, "Cannot write to speed control file: %s", CURRENT_SPEED_FILE);
+    ret = cpufreq_modify_policy_governor(0, "userspace");
+    if (ret)
+      return -ENODEV;
 
     // run in background if requested
     if (daemonize)
diff -ruN cpuspeed-1.1/Makefile cpuspeed-1.1-libcpufreq/Makefile
--- cpuspeed-1.1/Makefile	2003-11-08 02:02:31.000000000 +0100
+++ cpuspeed-1.1-libcpufreq/Makefile	2004-11-11 19:29:39.000000000 +0100
@@ -10,13 +10,13 @@
 
 $(TARGET): cpuspeed.cc
 	$(CC) -c $(COPTS) -DNAME=\"$(TARGET)\" cpuspeed.cc
-	$(CC) cpuspeed.o -o $(TARGET)
+	$(CC) -lcpufreq -L/usr/lib/ cpuspeed.o -o $(TARGET)
 	strip $(TARGET)
 
 # Debug targets
 $(DEBUG_TARGET): cpuspeed.cc
 	$(CC) -c -g -DDEBUG -DNAME=\"$(DEBUG_TARGET)\" -o cpuspeed_debug.o cpuspeed.cc
-	$(CC) cpuspeed_debug.o -o $(DEBUG_TARGET)
+	$(CC) -lcpufreq cpuspeed_debug.o -o $(DEBUG_TARGET)
 
 install: $(TARGET)
 	cp -f $(TARGET) /sbin
