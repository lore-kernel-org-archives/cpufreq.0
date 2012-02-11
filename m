From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] powernow-k6: Really enable auto-loading
Date: Sat, 11 Feb 2012 23:04:12 +0000
Message-ID: <1329001452.325.59.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, Thomas Renninger <trenn@suse.de>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

Commit fa8031aefec0cf7ea6c2387c93610d99d9659aa2 ('cpufreq: Add support
for x86 cpuinfo auto loading v4') added a device ID table to this
driver, but didn't declare it as the module device ID table.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This looks like an oversight, but maybe there is some good reason why
this one shouldn't be auto-loaded?

Ben.

 drivers/cpufreq/powernow-k6.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/powernow-k6.c b/drivers/cpufreq/powernow-k6.c
index 54dd031..af23e0b 100644
--- a/drivers/cpufreq/powernow-k6.c
+++ b/drivers/cpufreq/powernow-k6.c
@@ -216,7 +216,7 @@ static const struct x86_cpu_id powernow_k6_ids[] = {
 	{ X86_VENDOR_AMD, 5, 13 },
 	{}
 };
-
+MODULE_DEVICE_TABLE(x86cpu, powernow_k6_ids);
 
 /**
  * powernow_k6_init - initializes the k6 PowerNow! CPUFreq driver
-- 
1.7.9


