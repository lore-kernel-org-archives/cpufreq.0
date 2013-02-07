From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/5] cpufreq: Retrieve current frequency from scaling
 drivers with internal governors
Date: Thu, 7 Feb 2013 19:16:20 +0530
Message-ID: <CAOh2x=mU=nPv2t2kh3YR-Lyx3gqgNPbms_kPsimFLZcbU2ULsw@mail.gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
	<1360170133-5066-2-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=RHV7FPLuWSt8WsJzV+Wc9gASMa/XqKpT4DLsGsBMXjA=;
        b=n7hq0y1vSSmn/JnnID3KIy5AmmZ52JCEls2gcyNcR67rilbj/Rlr6dv4WJTV62HLWj
         oScntB0RsRMBoFYvuVKFmP9IZN+X58+wDiciLOOr0ymcC1BDKhl2mkxyHMu4tXFZZMZD
         +RHcTBwwZOjUFH/fvb7AOWJH+nzmogIOaEXpyg/utVxuoJaH9QFo51qugHB1+S0TFfpx
         P9wxiJ0FUylEEgzW41PaHIx9qnM5plKcIrHFR4b4+lbmCJbhR5innCX2jMPw706PEISu
         p5F5hndQ3JpixYElHR6zeOKOEth+2DBwpucjLhQsfRuyT2IHV+8wF1y3umBgF/zUwL5F
         GfYw==
In-Reply-To: <1360170133-5066-2-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Wed, Feb 6, 2013 at 10:32 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement the cpufreq_driver.setpolicy() versus
> the cpufreq_driver.target() interface do not set policy->cur.
>
> Normally policy->cur is set during the call to cpufreq_driver.target()
> when the frequnecy request is made by the governor.
>
> If the scaling driver implements cpufreq_driver.setpolicy() and
> cpufreq_driver.get() interfaces use cpufreq_driver.get() to retrieve
> the current frequency.
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

To fix sparse warning updated this patch as:

commit f6060fa13ace2da4e691233706a788f91ad453da
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Thu Feb 7 19:12:16 2013 +0530

    fixup! cpufreq: Retrieve current frequency from scaling drivers
with internal governors
---
 drivers/cpufreq/cpufreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 447b313..e140b81 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1173,12 +1173,12 @@ static void cpufreq_out_of_sync(unsigned int
cpu, unsigned int old_freq,
  */
 unsigned int cpufreq_quick_get(unsigned int cpu)
 {
+       struct cpufreq_driver *driver = rcu_dereference(cpufreq_driver);
        struct cpufreq_policy *policy;
        unsigned int ret_freq = 0;

-       if (cpufreq_driver && cpufreq_driver->setpolicy &&
-                       cpufreq_driver->get)
-                       return cpufreq_driver->get(cpu);
+       if (driver && driver->setpolicy && driver->get)
+                       return driver->get(cpu);

        policy = cpufreq_cpu_get(cpu);
        if (policy) {
