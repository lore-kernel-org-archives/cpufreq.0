From: Pavel Machek <pavel@ucw.cz>
Subject: Kconfig help fixes
Date: Sun, 5 Oct 2003 22:23:23 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031005202323.GA2366@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, Rusty trivial patch monkey Russell <trivial@rustcorp.com.au>

Hi!

This seems to be needed...
							Pavel

Index: drivers/cpufreq/Kconfig
===================================================================
RCS file: /home/pavel/sf/bitbucket/bkcvs/linux-2.5/drivers/cpufreq/Kconfig,v
retrieving revision 1.4
diff -u -r1.4 Kconfig
--- drivers/cpufreq/Kconfig	5 Sep 2003 19:15:37 -0000	1.4
+++ drivers/cpufreq/Kconfig	5 Oct 2003 20:09:21 -0000
@@ -6,7 +6,7 @@
 	  CPUFreq. Please note that it is recommended to use the sysfs
 	  interface instead (which is built automatically). 
 	  
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq. 
 	  
 	  If in doubt, say N.
 
@@ -64,7 +64,7 @@
           be able to set the CPU dynamically, like on LART 
 	  ( http://www.lart.tudelft.nl/ )
 
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq.
 
 	  If in doubt, say Y.
 
@@ -78,6 +78,6 @@
 	  the same functionality as long as "userspace" is the
 	  selected governor for the specified CPU.
 	
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq.
 
 	  If in doubt, say N.

-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
