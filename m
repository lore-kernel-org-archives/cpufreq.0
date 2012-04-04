From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Wed, 04 Apr 2012 10:05:44 -0700
Message-ID: <4F7C7F68.7090000@samsung.com>
References: <20120213094940.GA15338@n2100.arm.linux.org.uk> <4F3CF3DA.7000806@samsung.com> <20120216160250.GP13673@n2100.arm.linux.org.uk> <00aa01ccf084$93c98a70$bb5c9f50$%kim@samsung.com> <20120327074931.GK5611@n2100.arm.linux.org.uk> <4F73B3E1.4080807@samsung.com> <20120404145204.GA24211@n2100.arm.linux.org.uk> <20120404145917.GB1929@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WBtXucP95sk93u+fCu+Wt09mno+jawgzK6DQkhjk+G4=;
        b=UewyETMP5wWuPjmQslFMXN566149py/GhL0DAew/sgCmJzJVz4MVhAPLX1yZNzhSDX
         WdikYgHECRj9dPzZ3u3Z+EEVAWRbPBB++XfA/9ZzT735aNf1NGMgWQhyxqHLGbu6/yHA
         UfMMh47951yieW712TxJVgPBYtb16FLYe1AKY9ud4/bmN1S0zc/9XusCLxcVfwxZQJTY
         gYZj3tZ93QIZtl//PdNj5y7RawY2i+cGT/WQl/O7V3HFIXTmjEpx36dZtDgBDIXXN81F
         S46LVMZvMZ0lgRMatP9E78f4tPWtoP2QdVGWiQBD6P2qDoRgXfA66XZ/fqa9lpGYmMIE
         kU9A==
In-Reply-To: <20120404145917.GB1929@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Dave Jones' <davej@redhat.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org

On 04/04/12 07:59, 'Dave Jones' wrote:
> On Wed, Apr 04, 2012 at 03:52:04PM +0100, Russell King - ARM Linux wrote:
>   >  On Wed, Mar 28, 2012 at 05:59:13PM -0700, Kukjin Kim wrote:
>   >  >  Russell King wrote:
>   >  >>  As predicted, this is breaking other ARM platforms.  Please fix this
>   >  >>  yourself before your crappy code gets pushed into mainline.  Thanks.
>   >  >>
>   >  >  I fixed it.
>   >
>   >  When will we see patches or the fix in mainline?
>
> Just send it to Linus directly.
>

Hi Dave,

OK, so may I send this to Linus with your ack?

Note, basically arm fixes move to upstream via arm-soc so I can send 
this alone to Linus directly. Or I should ask to apply this to Arnd and 
Olof.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
