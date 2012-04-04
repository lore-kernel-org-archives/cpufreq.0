From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Wed, 4 Apr 2012 15:52:04 +0100
Message-ID: <20120404145204.GA24211@n2100.arm.linux.org.uk>
References: <20120213094940.GA15338@n2100.arm.linux.org.uk> <4F3CF3DA.7000806@samsung.com> <20120216160250.GP13673@n2100.arm.linux.org.uk> <00aa01ccf084$93c98a70$bb5c9f50$%kim@samsung.com> <20120327074931.GK5611@n2100.arm.linux.org.uk> <4F73B3E1.4080807@samsung.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=0SqAjJhLM6d2athS6DJsQcc+px08hlOEQkZh7wa8W7s=;
	b=TZUo4Ok4O9eyHg+qZBN/PVmzH3UtYWnQjnmBTjYpF/ZsDpSpuHe8Fx5bSXdiTMGxrtXWZnmbrg4Mq1dEabLhvOWcHtjbLQG55dZDJErHNFnoA2oPIIgxUTBR/S503+J6E3u76FBIpuKgSFMCnLG2ceeINz6AEnHqZdSIXcojx+M=;
Content-Disposition: inline
In-Reply-To: <4F73B3E1.4080807@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Dave Jones' <davej@redhat.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Mar 28, 2012 at 05:59:13PM -0700, Kukjin Kim wrote:
> Russell King wrote:
>> As predicted, this is breaking other ARM platforms.  Please fix this
>> yourself before your crappy code gets pushed into mainline.  Thanks.
>>
> I fixed it.

When will we see patches or the fix in mainline?
