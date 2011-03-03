From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/4] powernow-k8: The table index is not worth displaying
Date: Thu,  3 Mar 2011 21:31:24 +0100
Message-ID: <1299184287-18854-2-git-send-email-trenn@suse.de>
References: <1299184287-18854-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1299184287-18854-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

and it also is misleading due to another message above
which makes the index look like it is the CPU.

https://bugzilla.kernel.org/show_bug.cgi?id=24562

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: davej@codemonkey.org.uk
CC: cpufreq@vger.kernel.org
---
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index c567dec..1ae4133 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -630,8 +630,7 @@ static void print_basics(struct powernow_k8_data *data)
 					data->powernow_table[j].frequency/1000);
 			} else {
 				printk(KERN_INFO PFX
-					"   %d : fid 0x%x (%d MHz), vid 0x%x\n",
-					j,
+					"fid 0x%x (%d MHz), vid 0x%x\n",
 					data->powernow_table[j].index & 0xff,
 					data->powernow_table[j].frequency/1000,
 					data->powernow_table[j].index >> 8);
-- 
1.7.3.4

