From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] EPS - Correct 2nd brand test
Date: Mon, 12 Feb 2007 22:19:12 +0100
Message-ID: <45D0D9D0.2020107@interia.pl>
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


Solution for small, but nasty bug: access beyond end of f_table 
for C7 brand.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/e_powersaver.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/e_powersaver.c b/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
--- a/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
+++ b/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
@@ -234,7 +234,7 @@ static int eps_cpu_init(struct cpufreq_policy *policy)
 
 	/* Fill frequency and MSR value table */
 	f_table = &centaur->freq_table[0];
-	if (brand == EPS_BRAND_EDEN) {
+	if (brand != EPS_BRAND_C7M) {
 		f_table[0].frequency = fsb * min_multiplier;
 		f_table[0].index = (min_multiplier << 8) | min_voltage;
 		f_table[1].frequency = fsb * max_multiplier;


----------------------------------------------------------------------
Na Walentynki odwiedz A.Morka 
>> http://link.interia.pl/f1a10
