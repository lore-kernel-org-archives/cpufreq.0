From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq 2.4 interface removal schedule [Was: Re: [PATCH] add feature-removal-schedule.txt documentation]
Date: Tue, 11 Jan 2005 13:23:09 +0100
Message-ID: <20050111122309.GA12458@dominikbrodowski.de>
References: <1105039259.4468.9.camel@laptopd505.fenrus.org> <20050106201531.GJ1292@us.ibm.com> <20050106203258.GN26051@parcelfarce.linux.theplanet.co.uk> <20050106210408.GM1292@us.ibm.com> <20050106212417.GQ26051@parcelfarce.linux.theplanet.co.uk> <20050106152621.395f935e.akpm@osdl.org> <20050106235633.GA10110@kroah.com> <41DEC0BF.4010708@osdl.org> <Pine.LNX.4.58.0501070949410.2272@ppc970.osdl.org> <20050107181131.GA29152@kroah.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S262745AbVAKMYE@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050107181131.GA29152@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@osdl.org
Cc: cpufreq@www.linux.org.uk, greg@kroah.com, "Randy.Dunlap" <rddunlap@osdl.org>, Andrew Morton <akpm@osdl.org>, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>, paulmck@us.ibm.com, arjan@infradead.org, linux-kernel@vger.kernel.org, jtk@us.ibm.com, wtaber@us.ibm.com, pbadari@us.ibm.com, markv@us.ibm.com

Even though these 2.4. interfaces are already gone in Dave Jones' cpufreq
bitkeeper tree, here's a patch which properly announces it in
Documentation/feature-removal-schedule.txt:


Add meaningful content concerning the removal of deprecated interfaces to
the cpufreq core.

Signed-off-by: Dominik Brodowski <linux@brodo.de>
---

 Documentation/feature-removal-schedule.txt |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

Index: 2.6.10/Documentation/feature-removal-schedule.txt
===================================================================
--- 2.6.10.orig/Documentation/feature-removal-schedule.txt	2005-01-11 13:09:50.000000000 +0100
+++ 2.6.10/Documentation/feature-removal-schedule.txt	2005-01-11 13:15:12.000000000 +0100
@@ -17,10 +17,18 @@
 
 ---------------------------
 
-What:	/proc/sys/cpu and the sysctl interface to cpufreq (2.4.x interfaces)
+What:	/proc/sys/cpu/*, sysctl and /proc/cpufreq interfaces to cpufreq (2.4.x interfaces)
 When:	January 2005
 Files:	drivers/cpufreq/: cpufreq_userspace.c, proc_intf.c
-	function calls throughout the kernel tree
-Why:	Deprecated, has been replaced/superseded by (what?)....
+Why:	/proc/sys/cpu/* has been deprecated since inclusion of cpufreq into
+	the main kernel tree. It bloats /proc/ unnecessarily and doesn't work
+	well with the "governor"-based design of cpufreq.
+	/proc/cpufreq/* has also been deprecated for a long time and was only
+	meant for usage during 2.5. until the new sysfs-based interface became
+	ready. It has an inconsistent interface which doesn't work well with
+	userspace setting the frequency. The output from /proc/cpufreq/* can
+	be emulated using "cpufreq-info --proc" (cpufrequtils).
+	Both interfaces are superseded by the cpufreq interface in
+	/sys/devices/system/cpu/cpu%n/cpufreq/.
 Who:	Dominik Brodowski <linux@brodo.de>
 
