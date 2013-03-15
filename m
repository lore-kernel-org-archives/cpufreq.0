From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 8/8] cpufreq: omap: remove omap-cpufreq
Date: Fri, 15 Mar 2013 09:24:11 -0500
Message-ID: <CAGo_u6obQhDyKo=f+Gn37epSf9+QgxqxdR_qQnz-YLUJRS5p1Q@mail.gmail.com>
References: <1363294695-658-1-git-send-email-nm@ti.com>
	<1363294695-658-9-git-send-email-nm@ti.com>
	<CAOh2x=kCWHL-e9wZxgE97BuNpj0uu67t6SwqghBkyZKL5hugDg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=+PQmR1relMya+Uhvh+MmOnpRUgj15AowKougmB7AiVI=;
        b=oAXq5LwWae26dv5lZfR/EBJfVUEadw2WiP2+Pr8LJD0vjyOVEkKtnI7lPwk9vduw1/
         OvpAKTmWw5MBOhn2Z28Mqjpq2jOsfRg1MfYQUt3d6lRhMEa9t4UFjI0khnvrFh+RYZiQ
         czJJLw34gXlKGuWG8OttSmg6MWSUeoPzbbvn7uCa5dC70b6IIHVpDlkA7h0Rei6EbVi9
         wL9hJSWiFdYhohK62HokzR1xjZpyByhrJodqcOVJnDfLuPaLnFoFIi6mvtqeYBqQEIFt
         5MImiBMigO+aK7NbXrrPkqH2ZqNIidO7XD7Fd3LKFP3I3Ng6reTNQdnftbhaTbxXfzAl
         7cxg==
In-Reply-To: <CAOh2x=kCWHL-e9wZxgE97BuNpj0uu67t6SwqghBkyZKL5hugDg@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-omap@vger.kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, =?ISO-8859-1?Q?Beno=EEt_Cousson?= <b-cousson@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Shawn Guo <shawn.guo@linaro.org>, Keerthy <j-keerthy@ti.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On Thu, Mar 14, 2013 at 11:51 PM, Viresh Kumar <viresh.kumar@linaro.org=
> wrote:
> On Fri, Mar 15, 2013 at 2:28 AM, Nishanth Menon <nm@ti.com> wrote:
>> We can now use cpufreq-cpu0 driver using DT entries.
>> remove the redundant omap-cpufreq driver from the tree.
>> Remove MAINTAINERS file entry for the same as well.
>>
>> Cc: Kevin Hilman <khilman@deeprootsystems.com>
>> Cc: "Beno=C4=ABt Cousson" <b-cousson@ti.com>
>> Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
>> Cc: Shawn Guo <shawn.guo@linaro.org>
>> Cc: Keerthy <j-keerthy@ti.com>
>> Cc: linux-omap@vger.kernel.org
>> Cc: devicetree-discuss@lists.ozlabs.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: cpufreq@vger.kernel.org
>> Cc: linux-pm@vger.kernel.org
>>
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> ---
>>  MAINTAINERS                    |    1 -
>>  drivers/cpufreq/Kconfig.arm    |    6 -
>>  drivers/cpufreq/Makefile       |    1 -
>>  drivers/cpufreq/omap-cpufreq.c |  291 -----------------------------=
-----------
>>  4 files changed, 299 deletions(-)
>>  delete mode 100644 drivers/cpufreq/omap-cpufreq.c
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Thanks Viresh, but based on the direction of the discussion going on
(keeping this driver active for non-DT configuration),
I will have to drop this patch in it's entirety.
---
Regards,
Nishanth Menon
--
To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
