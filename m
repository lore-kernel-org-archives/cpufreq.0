From: Joe Perches <joe@perches.com>
Subject: [PATCH 09/59] arch/x86: Add missing "space"
Date: Mon, 19 Nov 2007 17:48:01 -0800
Message-ID: <c2f1bd6f19828452d5916728ebaa8d5f1bd0b152.1195454434.git.joe__684.542561839585$1195523695$gmane$org@perches.com>
References: 1234567
 <1195523331-15303-1-git-send-email-joe@perches.com>
 <1195523331-15303-2-git-send-email-joe@perches.com>
 <1195523331-15303-3-git-send-email-joe@perches.com>
 <1195523331-15303-4-git-send-email-joe@perches.com>
 <1195523331-15303-5-git-send-email-joe@perches.com>
 <1195523331-15303-6-git-send-email-joe@perches.com>
 <1195523331-15303-7-git-send-email-joe@perches.com>
 <1195523331-15303-8-git-send-email-joe@perches.com>
 <1195523331-15303-9-git-send-email-joe@perches.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756271AbXKTBwk@vger.kernel.org>
In-Reply-To: <1195523331-15303-9-git-send-email-joe@perches.com>
Message-Id: <c2f1bd6f19828452d5916728ebaa8d5f1bd0b152.1195454434.git.joe@perches.com>
In-Reply-To: <ee1678e1bc8b80b7ae420059fffc7241486ea91a.1195454434.git.joe@perches.com>
References: <ee1678e1bc8b80b7ae420059fffc7241486ea91a.1195454434.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Dave Jones <davej@codemonkey.org.uk>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org


Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/x86/kernel/cpu/cpufreq/powernow-k7.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k7.c b/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
index b5a9863..b73dce0 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
@@ -460,7 +460,7 @@ static int powernow_decode_bios (int maxfid, int startvid)
 
 			latency = psb->settlingtime;
 			if (latency < 100) {
-				printk (KERN_INFO PFX "BIOS set settling time to %d microseconds."
+				printk (KERN_INFO PFX "BIOS set settling time to %d microseconds. "
 						"Should be at least 100. Correcting.\n", latency);
 				latency = 100;
 			}
-- 
1.5.3.5.652.gf192c
