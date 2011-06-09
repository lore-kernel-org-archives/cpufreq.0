From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] S3C6410: Support 800MHz operation in cpufreq
Date: Thu, 09 Jun 2011 11:29:00 -0700
Message-ID: <4DF110EC.8030209@samsung.com>
References: <1307540955-10086-1-git-send-email-broonie@opensource.wolfsonmicro.com> <20110608140238.GB7204@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:message-id:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=l7248a2uL+NWW1mXFTswdIlzfJW2LEvRWKUSRKaWbZU=;
        b=LY8Fv5NA3+AHp1PWXV4X/A6ZTV3Wj4WOpZqwVlCRziFyD38SZ9o1tm0drJGMPB/e1X
         UG5a7y4LXiu6WnIfidUB3rTafdZRdIhXUPDVb4k3rl8NFnouTG71RvyGWeULezBE/grp
         pjo7Ze7fxaqXJ1yVmVxc3sR50meGltYmNHqIQ=
In-Reply-To: <20110608140238.GB7204@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 06/08/11 07:02, Dave Jones wrote:
> On Wed, Jun 08, 2011 at 02:49:15PM +0100, Mark Brown wrote:
>   >  At least some newer S3C6410 silicon supports operation up to 800MHz rather
>   >  than just 667MHz. Unfortunately I don't have access to any of documentation
>   >  of this other than some running systems, add a new cpufreq table entry for
>   >  this based on the behaviour of those systems.
>   >
>   >  Signed-off-by: Mark Brown<broonie@opensource.wolfsonmicro.com>
>   >  ---
>   >
>   >  Kukjin already indicated on several occasions that he was happy with
>   >  this change but it never seems to get applied or an actual ack.
>
> applied, thanks.
>
> 	Dave

Dave, could you please add my ack on this?

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Mark, sorry for late my ack :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
