From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/5] cpufreq: Do not track governor name for scaling
 drivers with internal governors.
Date: Thu, 7 Feb 2013 19:15:51 +0530
Message-ID: <CAOh2x=mZv+mWas__0e6mXQTf6FO2F3deW1rAxEVcKfNuG0qeuw@mail.gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
	<1360170133-5066-5-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=sFezYZE5GxgnD2tEsV4AbKfoFDqBukyyI1rRGg2OpGE=;
        b=BrYahvpM23ZdIoDg9F1pQSx8djscJ62HVwqGT7+jLq9u0WWqoozVYngwymnGr0lyAX
         z812ZnvB9CP/1JQIzmlffE68q8zDyJfiZgpW1A4UD4UzcE74Qq9jZNffc7eeJ3K0DFMW
         hjMiTRQ0WpiKKRNDalc7FyDs/+E7faZxA/4lMFsgec/cm9zzS8TvzhvorgVFu0McwBuc
         rzBslDSbxkP1c5E4Tpwraj9urtyo3r2yISl6ulEizsweqj86aCaSZXbnB0tYJ3yW3ZJn
         b0LWlVe0mwx/SLOFCX54K6gmLelMsuYYuyjeHEyAUbp0HW+mg7o+5mUF6Y8G3qRjRkXH
         VE0g==
In-Reply-To: <1360170133-5066-5-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Wed, Feb 6, 2013 at 10:32 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement internal governors do not have governor
> structures assocaited with them.  Only track the name of the governor
> associated with the CPU if the driver does not implement
> cpufreq_driver.setpolicy()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

To fix sparse warning updated this patch as:

commit ea241d95152c535c3d261f3a2240c45480b040bc
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Thu Feb 7 19:13:43 2013 +0530

    fixup! cpufreq: Do not track governor name for scaling drivers
with internal governors.
---
 drivers/cpufreq/cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index e140b81..819aa33 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1039,7 +1039,7 @@ static int __cpufreq_remove_dev(struct device
*dev, struct subsys_interface *sif
                __cpufreq_governor(data, CPUFREQ_GOV_STOP);

 #ifdef CONFIG_HOTPLUG_CPU
-       if (!cpufreq_driver->setpolicy)
+       if (!driver->setpolicy)
                strncpy(per_cpu(cpufreq_cpu_governor, cpu),
                        data->governor->name, CPUFREQ_NAME_LEN);
 #endif
