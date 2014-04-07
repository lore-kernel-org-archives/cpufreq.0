From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [PATCH] drivers:cpufreq:unicore32: fix typo issue for 'clk'
Date: Mon, 07 Apr 2014 20:04:21 +0800
Message-ID: <53429445.5000005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=+Yf0UJBfbF/dl6BGZlhkzpDyijOycoquiZa03TQKp0Y=;
        b=ekyoC0494vnMimVTUoPVWAMFEWjhB6/+uH2wSeOUojd9pBiu28UtWwIf7EXDLShy02
         PqNktn8dZVUivi8xRa7ZxI7fTaCAzEwReKzYq+IADQbWjudXZUHERj9w0t38a+xGUdpw
         DZaIR5GFCxd3SyMOcUO2Ipt8n1VmRHVrsegKH3wzs8qYRdGXiGn/sE6wkSSZPzPEUY9N
         EUjHgFa+GwFN3w7sB5XAiFkLo49hw5slyzwJf/Op+a6i8GpOHNcIOTr5yo8hGggo6ems
         LPe1oQlNCKkhIKLok+j5mMVgpdPYV/g+VobmIbjgw4b/FsHAHSIQmy91n91FIOSpAe3r
         DJAQ==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Guan Xuetao <gxt@mprc.pku.edu.cn>, rjw@rjwysocki.net, viresh.kumar@linaro.org
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Need use 'clk' instead of 'mclk', which is the original removed local
variable.

The related original commit:

  "652ed95 cpufreq: introduce cpufreq_generic_get() routine"

The related error with allmodconfig for unicore32:

    CC      drivers/cpufreq/unicore2-cpufreq.o
  drivers/cpufreq/unicore2-cpufreq.c: In function =91ucv2_target=92:
  drivers/cpufreq/unicore2-cpufreq.c:48: error: =91struct cpufreq_polic=
y=92 has no member named =91mclk=92
  make[2]: *** [drivers/cpufreq/unicore2-cpufreq.o] Error 1
  make[1]: *** [drivers/cpufreq] Error 2
  make: *** [drivers] Error 2


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 drivers/cpufreq/unicore2-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/unicore2-cpufreq.c b/drivers/cpufreq/unico=
re2-cpufreq.c
index 13be802..8d045af 100644
--- a/drivers/cpufreq/unicore2-cpufreq.c
+++ b/drivers/cpufreq/unicore2-cpufreq.c
@@ -45,7 +45,7 @@ static int ucv2_target(struct cpufreq_policy *policy,
 	freqs.new =3D target_freq;
=20
 	cpufreq_freq_transition_begin(policy, &freqs);
-	ret =3D clk_set_rate(policy->mclk, target_freq * 1000);
+	ret =3D clk_set_rate(policy->clk, target_freq * 1000);
 	cpufreq_freq_transition_end(policy, &freqs, ret);
=20
 	return ret;
--=20
1.7.9.5
