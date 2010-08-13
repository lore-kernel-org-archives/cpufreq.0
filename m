From: Namhyung Kim <namhyung@gmail.com>
Subject: [PATCH] acpi-cpufreq: add missing __percpu markup
Date: Fri, 13 Aug 2010 23:00:11 +0900
Message-ID: <1281708011-26583-1-git-send-email-namhyung@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=KgbyofvZx5j0I/wmtEO/lutPYdWTuWe7XbDN4eH/MHs=;
        b=Jbiy1KroYz23yHMMpU6RVUEOa0Gmg6biAT3PvYkHqhmIEo6yC3KQ2iTva1sdwBTo8d
         an5w63LM5h1R9U6KGtYbZCEId3yFjDy+oh/ocLwm6L1pYUpOBML3C2df+OZc4YsLZoP5
         a3IDF5KnnChjI8+GamzBB/XFTIka0Reu6O4gk=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

acpi_perf_data is a percpu pointer but was missing __percpu markup.
Add it.

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
---
 arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
index 246cd3a..cd8da24 100644
--- a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -72,7 +72,7 @@ struct acpi_cpufreq_data {
 static DEFINE_PER_CPU(struct acpi_cpufreq_data *, acfreq_data);
 
 /* acpi_perf_data is a pointer to percpu data. */
-static struct acpi_processor_performance *acpi_perf_data;
+static struct acpi_processor_performance __percpu *acpi_perf_data;
 
 static struct cpufreq_driver acpi_cpufreq_driver;
 
-- 
1.7.0.4

