From: Stefano Brivio <stefano.brivio@polimi.it>
Subject: [PATCH] cpufreq: fix configuration help message
Date: Thu, 29 Nov 2007 19:37:41 +0100
Message-ID: <20071129193741.6b84164a@morte>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk

cpufreq support can't be built as a module. Fix the related configuration
help message.


Signed-off-by: Stefano Brivio <stefano.brivio@polimi.it>

---

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 721f86f..c159ae6 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -9,9 +9,6 @@ config CPU_FREQ
 	  clock speed, you need to either enable a dynamic cpufreq governor
 	  (see below) after boot, or use a userspace tool.
 
-	  To compile this driver as a module, choose M here: the
-	  module will be called cpufreq.
-
 	  For details, take a look at <file:Documentation/cpu-freq>.
 
 	  If in doubt, say N.



-- 
Ciao
Stefano
