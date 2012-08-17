From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 2/3] PM / OPP: Initialize OPP table from device tree
Date: Thu, 16 Aug 2012 20:53:05 -0500
Message-ID: <502DA401.7040408@gmail.com>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org> <1344577046-14847-3-git-send-email-shawn.guo@linaro.org> <201208162305.55114.rjw@sisk.pl> <20120817005210.GD24242@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=w0yOhQSdVXoMLYpoIz8AqFf+1XEnAGII2V+j+aG5zY4=;
        b=ErJi4IrAAKOvbZe7txpaj1JJNpdDvwywfJGYVeUQUNVDbItkRMxdxIpZ/a43FGn3P9
         T45qXk7EDSpJck6HEml6XhnEXzCDIOfhe78Zz2PlLtD/Cxzr5l/mUXwIcnCfeQL4XPB4
         E8w9aBIQcJ2NIe2OeaTC+p4LL7qvgznGfWVZLrxVhs3bhBg/5N1k6ih49eGGVfofZhZB
         ORbS7S+Kv/7uC/pGTwJ0M7XDb9tHIuArQqIsLrFAV2F6+hAPzcMw9q3f3DOP5m0p14jC
         i9eSPGy38Yh85/vM5qSA6rAq6PFQiT4Q+1MR6mBVVepZNckvpcSt4k2iX/n7379fWKAO
         R6Gg==
In-Reply-To: <20120817005210.GD24242@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>

On 08/16/2012 07:52 PM, Shawn Guo wrote:
> On Thu, Aug 16, 2012 at 11:05:54PM +0200, Rafael J. Wysocki wrote:
>> On Friday, August 10, 2012, Shawn Guo wrote:
>>> With a lot of devices booting from device tree nowadays, it requires
>>> that OPP table can be initialized from device tree.  The patch adds
>>> a helper function of_init_opp_table together with a binding doc for
>>> that purpose.
>>>
>>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>>
>> I need an ACK from whoever maintains the DT bindings for that.
>>
> Rob, please?

Acked-by: Rob Herring <rob.herring@calxeda.com>
