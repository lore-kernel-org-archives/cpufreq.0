From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 5/5] powernow-k7: Fix CPU family number
Date: Sat, 11 Feb 2012 22:55:59 +0000
Message-ID: <1329000959.325.56.camel@deadeye>
References: <1329000256.325.48.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1329000256.325.48.camel@deadeye>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Kroah-Hartman <gregkh@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, Thomas Renninger <trenn@suse.de>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

Commit fa8031aefec0cf7ea6c2387c93610d99d9659aa2 ('cpufreq: Add support
for x86 cpuinfo auto loading v4') seems to have inadvertently changed
the matched CPU family number from 6 to 7.  Change it back.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/cpufreq/powernow-k7.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/powernow-k7.c b/drivers/cpufreq/powernow-k7.c
index 501d167..cf7e1ee 100644
--- a/drivers/cpufreq/powernow-k7.c
+++ b/drivers/cpufreq/powernow-k7.c
@@ -112,7 +112,7 @@ static int check_fsb(unsigned int fsbspeed)
 }
 
 static const struct x86_cpu_id powernow_k7_cpuids[] = {
-	{ X86_VENDOR_AMD, 7, },
+	{ X86_VENDOR_AMD, 6, },
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, powernow_k7_cpuids);
-- 
1.7.9


