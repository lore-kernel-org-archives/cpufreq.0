From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] CPUFREQ/S5PV210, EXYNOS4: Add Kconfig options for S5PV210
 and EXYNOS4 CPUfreq drivers
Date: Wed, 01 Jun 2011 13:28:18 -0700
Message-ID: <4DE6A0E2.5040807@samsung.com>
References: <1306476428-24808-1-git-send-email-dg77.kim@samsung.com>	<1306483489-10432-1-git-send-email-dg77.kim@samsung.com>	<4DE6977E.5080107@samsung.com> <20110601195418.GA30806@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:message-id:date:from:user-agent
         :mime-version:to:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=CAihX0xyHUL5DBNOJDZJ4Vxt6lKtoqLCwYRzmeqjaj8=;
        b=FqYGj7p21CwPCwa6NuyOqi2V6ya/wnDs8XZlJpOcevo0A9E+R+6cz3YjfH0/1h3mJc
         MDzvT0ERp0T9H000xiYucPihyXh9lC4/qFVBETuK6UeTgbfqjJCDKFnkdDbbc72SM3pg
         V9OF9omZIkq9yAESGiRrx4XBOiyKxkouljeDU=
In-Reply-To: <20110601195418.GA30806@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>, Kukjin Kim <kgene.kim@samsung.com>, Donggeun Kim <dg77.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger

On 06/01/11 12:54, Dave Jones wrote:
> On Wed, Jun 01, 2011 at 12:48:14PM -0700, Kukjin Kim wrote:
>
>   >  Dave, could you please see below? If you're ok, will submit remained
>   >  others for Samsung cpufreq drivers.
>
> I'm ok with the principle of the patch, though it doesn't seem to include
> any driver movement, so just applying this will break the compile.
> (If it happens in another patch, they should really go together to
>   not break bisecting)
>
Hi Dave,

OK, will submit others which include moving cpufreq driver soon.

If you don't mind I will make some branch to merge in both, my tree
and yours.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
