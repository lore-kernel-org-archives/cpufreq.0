From: Davidlohr Bueso <dave@gnu.org>
Subject: [PATCH] cpufreq: unnecesary double free in pcc_cpufreq_do_osc
Date: Fri, 24 Sep 2010 13:16:21 -0400
Message-ID: <1285348581.3031.2.camel@cowboy>
Reply-To: dave@gnu.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: davej@redhat.com, cpufreq@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

x86, cpufreq: avoid an unnecessary double free when finished in pcc_cpufreq_do_osc()

There is no need to fall through the out_free label thus saving a kfree call.

Signed-off-by: Davidlohr Bueso <dave@gnu.org>
---
 arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
index 994230d..db7dc35 100644
--- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
@@ -379,6 +379,8 @@ static int __init pcc_cpufreq_do_osc(acpi_handle *handle)
 	if (!(supported & 0x1))
 		return -ENODEV;
 
+	return ret;
+
 out_free:
 	kfree(output.pointer);
 	return ret;
-- 
1.7.0.4


