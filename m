From: Namhyung Kim <namhyung@gmail.com>
Subject: [PATCH] add missing __percpu markup in pcc-cpufreq.c
Date: Sun,  8 Aug 2010 02:37:23 +0900
Message-ID: <1281202643-26709-1-git-send-email-namhyung@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=7ycKDu/57hY6jR2PDOgkVSODkeS9UClqEBNlldd5Nzk=;
        b=X/Jlljyw470Jfr7hJxc2eYSKjlGZl34XQVywGUmSBbh62LxAihr+2e5qDhsHbnwbNL
         P0GUgAQkdCj0p11fe8OcWWVokoMPnGq9yoeR6tD87v0vDPZzcpXUOw+H7r9fp1S/OOR4
         xrfp5atKV506iV5aG5+yssOVhxkOnJ5ENi3fk=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

pcc_cpu_info is a percpu pointer but was missing __percpu markup.
Add it.

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
---
 arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
index a36de5b..994230d 100644
--- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
@@ -110,7 +110,7 @@ struct pcc_cpu {
 	u32 output_offset;
 };
 
-static struct pcc_cpu *pcc_cpu_info;
+static struct pcc_cpu __percpu *pcc_cpu_info;
 
 static int pcc_cpufreq_verify(struct cpufreq_policy *policy)
 {
-- 
1.7.0.4

