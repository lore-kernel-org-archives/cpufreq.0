From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 2/8] arch/x86/kernel/cpu/cpufreq: Fix unsigned return type
Date: Sun,  5 Sep 2010 21:00:20 +0200
Message-ID: <1283713226-8429-3-git-send-email-julia@diku.dk>
References: <1283713226-8429-1-git-send-email-julia@diku.dk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1283713226-8429-1-git-send-email-julia@diku.dk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

In each case, the function has an unsigned return type, but returns a
negative constant to indicate an error condition.  Each function is only
called once.  For nforce2_detect_chipset, the result is only compared to 0,
and for longrun_determine_freqs, the result is stored in a variable of type
(signed) int.  Thus, for both functions, unsigned can be dropped from the
return type.

A sematic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@exists@
identifier f;
constant C;
@@

 unsigned f(...)
 { <+...
*  return -C;
 ...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c |    2 +-
 arch/x86/kernel/cpu/cpufreq/longrun.c         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c b/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c
index 733093d..141abeb 100644
--- a/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c
+++ b/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c
@@ -393,7 +393,7 @@ static struct cpufreq_driver nforce2_driver = {
  * Detects nForce2 A2 and C1 stepping
  *
  */
-static unsigned int nforce2_detect_chipset(void)
+static int nforce2_detect_chipset(void)
 {
 	nforce2_dev = pci_get_subsys(PCI_VENDOR_ID_NVIDIA,
 					PCI_DEVICE_ID_NVIDIA_NFORCE2,
diff --git a/arch/x86/kernel/cpu/cpufreq/longrun.c b/arch/x86/kernel/cpu/cpufreq/longrun.c
index fc09f14..77945bf 100644
--- a/arch/x86/kernel/cpu/cpufreq/longrun.c
+++ b/arch/x86/kernel/cpu/cpufreq/longrun.c
@@ -165,7 +165,7 @@ static unsigned int longrun_get(unsigned int cpu)
  * TMTA rules:
  * performance_pctg = (target_freq - low_freq)/(high_freq - low_freq)
  */
-static unsigned int __cpuinit longrun_determine_freqs(unsigned int *low_freq,
+static int __cpuinit longrun_determine_freqs(unsigned int *low_freq,
 						      unsigned int *high_freq)
 {
 	u32 msr_lo, msr_hi;
