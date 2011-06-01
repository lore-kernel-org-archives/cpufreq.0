From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/5] CPUFREQ/S3C64xx: Move S3C64xx CPUfreq driver into
 drivers/cpufreq
Date: Wed, 01 Jun 2011 13:30:32 -0700
Message-ID: <4DE6A168.6090907@samsung.com>
References: <20110601094313.GA23122@opensource.wolfsonmicro.com>	<1306921493-30911-1-git-send-email-broonie@opensource.wolfsonmicro.com>	<BANLkTinR_WLjsgm5ogt_BbJwPFC0Kc1Dqg@mail.gmail.com>	<20110601095811.GB13591@opensource.wolfsonmicro.com>	<4DE69A66.9090002@samsung.com> <20110601200146.GC12949@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:message-id:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=qBuPCypXKmvzh0imVSjt1inRmM1gr420KzswTGr53yY=;
        b=m+2F3tgSUtG1XbqVF6DTLju6I0ez/qSWAcUFHPy4DTKvkgl31CmDAAa9w97H2QTbXI
         HpvR2WWDSJiUYy2jRQRVaGKw3/EGduDmnFIo6UssP+Y3Fgr4PJJHRpdo7coyWoV8TBSO
         9O/s28kv1RTJXjxf/ZpjpCPqdcv1hCZRKLqw8=
In-Reply-To: <20110601200146.GC12949@opensource.wolfsonmicro.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, Kyungmin Park <kmpark@infradead.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

On 06/01/11 13:01, Mark Brown wrote:
> On Wed, Jun 01, 2011 at 01:00:38PM -0700, Kukjin Kim wrote:
>
>> As I remember, 800Mhz support on S3C6410 is ok and replied about that.
>> Then isn't there any progress in my side?...I'm outside of my office.
>
> Yes, you replied and said it was OK but it's not appeared in -next yet.

Oops, sorry :(

Maybe I missed.
Ok, will apply in my after checking others.

Then if any updates, let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
