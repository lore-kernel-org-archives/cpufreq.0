From: Pavel Machek <pavel@ucw.cz>
Subject: do not leak memory in powernow-k8
Date: Sat, 3 Jan 2004 13:42:13 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040103124213.GA423@elf.ucw.cz>
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
To: Andrew Morton <akpm@zip.com.au>, kernel list <linux-kernel@vger.kernel.org>, Rusty trivial patch monkey Russell <trivial@rustcorp.com.au>, cpufreq@www.linux.org.uk

Hi!

This prevents memory leak if something goes wrong. Please apply,

								Pavel

Index: linux.new/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
===================================================================
--- linux.new.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-12-25 13:28:48.000000000 +0100
+++ linux.new/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-12-25 13:29:08.000000000 +0100
@@ -687,11 +687,13 @@
 			if (ppst[j].vid < rvo) {	/* vid+rvo >= 0 */
 				printk(KERN_ERR BFX
 				       "0 vid exceeded with pstate %d\n", j);
+				kfree(ppst);
 				return -ENODEV;
 			}
 			if (ppst[j].vid < maxvid+rvo) { /* vid+rvo >= maxvid */
 				printk(KERN_ERR BFX
 				       "maxvid exceeded with pstate %d\n", j);
+				kfree(ppst);
 				return -ENODEV;
 			}
 		}
@@ -706,7 +708,7 @@
 
 		for (j = 0; j < numps; j++)
 			if ((ppst[j].fid==currfid) && (ppst[j].vid==currvid))
-				return (0);
+				return 0;
 
 		printk(KERN_ERR BFX "currfid/vid do not match PST, ignoring\n");
 		return 0;


-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
