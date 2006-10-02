From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH] cpufreq: Documentation fix
Date: Mon, 2 Oct 2006 19:26:47 -0400
Message-ID: <20061002232647.GA10053@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

Fix reference to where the code actually is. Noted by Hero Wanders.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/Documentation/cpu-freq/core.txt b/Documentation/cpu-freq/core.txt
index 29b3f9f..ce0666e 100644
--- a/Documentation/cpu-freq/core.txt
+++ b/Documentation/cpu-freq/core.txt
@@ -24,7 +24,7 @@ Contents:
 1. General Information
 =======================
 
-The CPUFreq core code is located in linux/kernel/cpufreq.c. This
+The CPUFreq core code is located in drivers/cpufreq/cpufreq.c. This
 cpufreq code offers a standardized interface for the CPUFreq
 architecture drivers (those pieces of code that do actual
 frequency transitions), as well as to "notifiers". These are device
