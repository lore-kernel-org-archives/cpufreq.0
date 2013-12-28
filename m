From: Mateusz Krawczuk <mat.krawczuk@gmail.com>
Subject: [PATCH v5 Resend 2/3] Cpufreq: s5pv210 cpufreq fixes for CCF
Date: Sat, 28 Dec 2013 18:09:15 +0100
Message-ID: <1388250556-4594-3-git-send-email-mat.krawczuk@gmail.com>
References: <1388250556-4594-1-git-send-email-mat.krawczuk@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iTDjY6gKsdsAWYjfDWo5A0U8gFJvHRlikI+3fxqNr/w=;
        b=gl1shci4ryHXqUuSAOsNI7JjV5Cuf7uB8YZ5O2Uw2jTfCluyjrDnicmmb2wUOc6YIR
         hBdRLb8QNVZLDJO9bueA+mvdHpksfTKfa+VWh9J6Pq/uOyXoLV6oThdmbMXvc1b8rdjD
         NusFZrGRrgLS6hxDbfl5Qn/o4Wl9ZPqcElIzxYFIujAw3dbYUaimzYxsKRR2iM7kkI2Q
         YxQz+q3esh5qOjko585mlAboJxDFff9g4PMCfjZc0Z7/UgIwTOAQzERjBylxcea7Lyga
         3E6ZW042L1m2gFrLe/5MFsICEbyBs+6elOH5QUwF5XbLdbfFgQCPT0ujlDx4NfCIeIUM
         gP1w==
In-Reply-To: <1388250556-4594-1-git-send-email-mat.krawczuk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, mturquette@linaro.org, tomasz.figa@gmail.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com, m.szyprowski@samsung.com, padma.v@samsung.com, chander.kashyap@linaro.org, t.dakhran@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, Mateusz Krawczuk <m.krawczuk@partner.samsung.com>

From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>

Use common clock framework api to get clock.

Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/cpufreq/s5pv210-cpufreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index e3973da..ab0365a 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -471,17 +471,17 @@ static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 	unsigned long mem_type;
 	int ret;
 
-	cpu_clk = clk_get(NULL, "armclk");
+	cpu_clk = clk_get_sys("s5pv210-cpufreq", "armclk");
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
 
-	dmc0_clk = clk_get(NULL, "sclk_dmc0");
+	dmc0_clk = clk_get_sys("s5pv210-cpufreq", "sclk_dmc0");
 	if (IS_ERR(dmc0_clk)) {
 		ret = PTR_ERR(dmc0_clk);
 		goto out_dmc0;
 	}
 
-	dmc1_clk = clk_get(NULL, "hclk_msys");
+	dmc1_clk = clk_get_sys("s5pv210-cpufreq", "hclk_msys");
 	if (IS_ERR(dmc1_clk)) {
 		ret = PTR_ERR(dmc1_clk);
 		goto out_dmc1;
-- 
1.8.3.3
