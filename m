From: Hendrik Muhs <Hendrik.Muhs@web.de>
Subject: [Patch] small cleanup for powernow-k7.c
Date: Thu, 20 Jan 2005 21:38:35 +0100
Message-ID: <200501202138.35324.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_LbB8BygnIv6UDxm"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk

--Boundary-00=_LbB8BygnIv6UDxm
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

attached is a patch which fixes a wrong entry in the vid table and some 
comments.

It is broken down from my powernow-k7 patch to manual set multiplier/voltage 
(for Desktop mainboards which does not have  PST table in their BIOS 
("Another powernow-k7 patch for Desktop XP-M usage")).

A final question: 

Is something like this absolutly out of question for inclusion in mainline?
(yes I've read the archives and I have not found a final answer on this)

I see that this feature is not official supported by vendors and although I 
have implemented some mechanisms which should prevent serious CPU damage it 
can not (by design) completly safe (system may freeze on some setups).

On the other side their is demand for this feature (not only for me). I do not 
know what to do with it in the future. If the door for inclusion in mainline 
is closed I would consider make some kind of source package and 
forking/renaming the driver so that it can be build independent from kernel.

Hendrik

--Boundary-00=_LbB8BygnIv6UDxm
Content-Type: text/x-diff; charset="us-ascii";
	name="powernow-k7_smallcleanup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="powernow-k7_smallcleanup.patch"

--- linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c.orig	2005-01-20 19:45:56.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2005-01-20 20:11:04.000000000 +0100
@@ -67,16 +67,20 @@
 #endif
 
 #ifdef CONFIG_CPU_FREQ_DEBUG
-/* divide by 1000 to get VID. */
+/* divide by 1000 to get VCore voltage in V. */
 static int mobile_vid_table[32] = {
     2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
     1600, 1550, 1500, 1450, 1400, 1350, 1300, 0,
     1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
-    1075, 1050, 1024, 1000, 975, 950, 925, 0,
+    1075, 1050, 1025, 1000, 975, 950, 925, 0,
 };
 #endif
 
-/* divide by 10 to get FID. */
+/* divide by 10 to get multiplier.
+ * 0x19 should maybe 220 not 225 (see CrystalCPUID), but as their are no CPU's 
+ * with this multiplier (and possibly never will be) it does not matter 
+ */
+
 static int fid_codes[32] = {
     110, 115, 120, 125, 50, 55, 60, 65,
     70, 75, 80, 85, 90, 95, 100, 105,

--Boundary-00=_LbB8BygnIv6UDxm
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_LbB8BygnIv6UDxm--

