From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH][3/4] Longhaul - Move old_ratio to correct place
Date: Thu, 17 May 2007 22:36:42 +0200
Message-ID: <464CBCDA.9040508@interia.pl>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


Move one line where it should be. After first transition
Longhaul will skip frequency transition if destination
frequency is already set.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -87,6 +87,7 @@ static int clock_ratio[32];
 static int eblcr_table[32];
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
+static unsigned int old_ratio = -1;
 
 #ifdef CONFIG_CPU_FREQ_DEBUG
 static char speedbuffer[8];
@@ -251,7 +252,6 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 {
 	int speed, mult;
 	struct cpufreq_freqs freqs;
-	static unsigned int old_ratio=-1;
 	unsigned long flags;
 	unsigned int pic1_mask, pic2_mask;
 
-- 



----------------------------------------------------------------------
Wicie, rozumicie....
Zobacz >>> http://link.interia.pl/f1a74
