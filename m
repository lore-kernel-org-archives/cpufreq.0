From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH] cpufreq: fix up comment in cpufreq.h
Date: Wed, 4 May 2005 21:03:45 +0200
Message-ID: <20050504190345.GA12645@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@lists.linux.org.uk

Fix up comment in cpufreq.h stating transition latency should be passed
in microseconds -- it was decided long ago to switch to nanoseconds.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

Index: 2.6.12-rc2/include/linux/cpufreq.h
===================================================================
--- 2.6.12-rc2.orig/include/linux/cpufreq.h	2005-03-02 18:23:48.000000000 +0100
+++ 2.6.12-rc2/include/linux/cpufreq.h	2005-04-09 22:19:04.000000000 +0200
@@ -49,7 +49,7 @@
 /* Frequency values here are CPU kHz so that hardware which doesn't run 
  * with some frequencies can complain without having to guess what per 
  * cent / per mille means. 
- * Maximum transition latency is in microseconds - if it's unknown,
+ * Maximum transition latency is in nanoseconds - if it's unknown,
  * CPUFREQ_ETERNAL shall be used.
  */
