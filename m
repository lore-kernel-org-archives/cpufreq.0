From: Andrew Morton <akpm@osdl.org>
Subject: speedstep-libc-fix-frequency-multiplier-for-pentium4.patch
Date: Fri, 4 Feb 2005 16:45:26 -0800
Message-ID: <20050204164526.3c866dda.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

ack?


From: Matthias-Christian Ott <matthias.christian@tiscali.de>

The Pentium4 models 0&1 have a longer MSR_EBC_FREQUENCY_ID register as the
models 2&3, so the bit shift must be bigger.

Signed-off-by: Matthias-Christian Ott <matthias.christian@tiscali.de>
Signed-off-by: Andrew Morton <akpm@osdl.org>
---

 25-akpm/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletion(-)

diff -puN arch/i386/kernel/cpu/cpufreq/speedstep-lib.c~speedstep-libc-fix-frequency-multiplier-for-pentium4 arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- 25/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c~speedstep-libc-fix-frequency-multiplier-for-pentium4	2005-02-04 02:35:16.293948136 -0800
+++ 25-akpm/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2005-02-04 02:36:00.366248128 -0800
@@ -160,7 +160,10 @@ static unsigned int pentium4_get_frequen
 		printk(KERN_DEBUG "speedstep-lib: couldn't detect FSB speed. Please send an e-mail to <linux@brodo.de>\n");
 
 	/* Multiplier. */
-	mult = msr_lo >> 24;
+	if (c->x86_model < 2)
+		mult = msr_lo >> 27;
+	else
+		mult = msr_lo >> 24;
 
 	dprintk("P4 - FSB %u kHz; Multiplier %u; Speed %u kHz\n", fsb, mult, (fsb * mult));
 
_
