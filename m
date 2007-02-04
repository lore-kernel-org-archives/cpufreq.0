From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Fix guess_fsb function
Date: Sun, 04 Feb 2007 15:58:46 +0100
Message-ID: <45C5F4A6.1000704@interia.pl>
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


This is bug reported by John-Marc Chandonia:
> Detected 1002.292 MHz processor.
> longhaul: VIA C3 'Nehemiah B' [C5N] CPU detected.  Powersaver supported.
> longhaul: Using throttling support.
> longhaul: Invalid (reserved) FSB!
FSB is correcly guessed for 999.554 MHz CPU.
To fix this error:
- ROUNDING should be range, not mask - at it's current value it is +7 -8,
- more precise calculations inside guess_fsb - 7.5x133MHz is 1000MHz now.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   32 +++++++++---------------------
 1 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -318,31 +318,19 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 
 #define ROUNDING	0xf
 
-static int _guess(int guess, int mult)
-{
-	int target;
-
-	target = ((mult/10)*guess);
-	if (mult%10 != 0)
-		target += (guess/2);
-	target += ROUNDING/2;
-	target &= ~ROUNDING;
-	return target;
-}
-
-
 static int guess_fsb(int mult)
 {
-	int speed = (cpu_khz/1000);
+	int speed = cpu_khz / 1000;
 	int i;
-	int speeds[] = { 66, 100, 133, 200 };
-
-	speed += ROUNDING/2;
-	speed &= ~ROUNDING;
-
-	for (i=0; i<4; i++) {
-		if (_guess(speeds[i], mult) == speed)
-			return speeds[i];
+	int speeds[] = { 666, 1000, 1333, 2000 };
+	int f_max, f_min;
+
+	for (i = 0; i < 4; i++) {
+		f_max = ((speeds[i] * mult) + 50) / 100;
+		f_max += (ROUNDING / 2);
+		f_min = f_max - ROUNDING;
+		if ((speed <= f_max) && (speed >= f_min))
+			return speeds[i] / 10;
 	}
 	return 0;
 }

----------------------------------------------------------------------
Oficjalne konto pocztowe europejskich internautow! 
>>> http://link.interia.pl/f19e8
