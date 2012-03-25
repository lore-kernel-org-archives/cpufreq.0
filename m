From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 11/13] cpupower: Fix broken mask values
Date: Sun, 25 Mar 2012 20:38:52 +0200
Message-ID: <1332700734-26435-11-git-send-email-linux@dominikbrodowski.net>
References: <20120325183807.GA26398@comet.dominikbrodowski.net>
 <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>, Dominik Brodowski <linux@dominikbrodowski.net>

From: Thomas Renninger <trenn@suse.de>

Signed-off-by: Thomas Renninger <trenn@suse.de>
Tested-by: Dave Jones <davej@redhat.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/utils/helpers/helpers.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/helpers.h b/tools/power/cpupower/utils/helpers/helpers.h
index 6280daa..2eb584c 100644
--- a/tools/power/cpupower/utils/helpers/helpers.h
+++ b/tools/power/cpupower/utils/helpers/helpers.h
@@ -66,8 +66,8 @@ enum cpupower_cpu_vendor {X86_VENDOR_UNKNOWN = 0, X86_VENDOR_INTEL,
 #define CPUPOWER_CAP_AMD_CBP		0x00000004
 #define CPUPOWER_CAP_PERF_BIAS		0x00000008
 #define CPUPOWER_CAP_HAS_TURBO_RATIO	0x00000010
-#define CPUPOWER_CAP_IS_SNB		0x00000011
-#define CPUPOWER_CAP_INTEL_IDA		0x00000012
+#define CPUPOWER_CAP_IS_SNB		0x00000020
+#define CPUPOWER_CAP_INTEL_IDA		0x00000040
 
 #define MAX_HW_PSTATES 10
 
-- 
1.7.5.4

