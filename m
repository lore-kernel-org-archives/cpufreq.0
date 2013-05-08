From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] cpufreq, ondemand: Remove leftover debug line
Date: Wed,  8 May 2013 21:34:48 +0200
Message-ID: <1368041688-29986-1-git-send-email-bp@alien8.de>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1368041587; bh=2PJgahwDCnAsRcvRoSZ5q64bKbySDoAHCsVD+cL8pbo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=miBhDMigyQ1QpIwd2Z8NEo4jYWC
	DdyfgJlkkbRiyYKPHQJJK/xD72Mt+ASimiLjO50vEvX1ibYn3X0OFar1qnHI2JGfXFU
	kzMD6iBWesH0I/dtn9BBSPCgFskk2Asy/4EMjIAiLU+ypTXI2r89hR79o/3FCTDwevw
	oFRWRLiHak=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1368041587; bh=2PJgahwDCnAsRcvRoSZ5q64bKbySDoAHCsVD+cL8pbo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=miBhDMigyQ1QpIwd2Z8NEo4jYWC
	DdyfgJlkkbRiyYKPHQJJK/xD72Mt+ASimiLjO50vEvX1ibYn3X0OFar1qnHI2JGfXFU
	kzMD6iBWesH0I/dtn9BBSPCgFskk2Asy/4EMjIAiLU+ypTXI2r89hR79o/3FCTDwevw
	oFRWRLiHak=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

I don't see how the virtual address of the tuners pointer would be of
any help to anyone so remove it.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/cpufreq/cpufreq_ondemand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index b0ffef96bf77..4b9bb5def6f1 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -547,7 +547,6 @@ static int od_init(struct dbs_data *dbs_data)
 	tuners->io_is_busy = should_io_be_busy();
 
 	dbs_data->tuners = tuners;
-	pr_info("%s: tuners %p\n", __func__, tuners);
 	mutex_init(&dbs_data->mutex);
 	return 0;
 }
-- 
1.8.3.rc0

