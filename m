From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3/6 v4] cpufreq: tolerate inexact values when collecting
 stats
Date: Sun, 11 Nov 2012 17:38:24 +0100
Message-ID: <20121111163821.GA21635@x1.osrc.amd.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com>
 <1352313166-28980-1-git-send-email-mark.langsdorf@calxeda.com>
 <1352313166-28980-4-git-send-email-mark.langsdorf@calxeda.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1352651897; bh=PkIoZRdKcUsI9xC/VWXm+BdXhVo7/WShTczVO0nOmbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Y+877x9ei4KINLAhFlq3o1Z2NekU5biq8MQ8DC
	DW0UfSf1SdTT7PL0szq9lwBKqMPx2rTVg/d+8TkC5GrgmldaXDg61tffMCsIEjHOq4Z
	qagz8qUmzRCIB9lxtIb5dXwemCxBkGuYJ2zFzO7l5eUBCSNBr0xU8K8AXxXNNZPxQ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1352651897; bh=PkIoZRdKcUsI9xC/VWXm+BdXhVo7/WShTczVO0nOmbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Y+877x9ei4KINLAhFlq3o1Z2NekU5biq8MQ8DC
	DW0UfSf1SdTT7PL0szq9lwBKqMPx2rTVg/d+8TkC5GrgmldaXDg61tffMCsIEjHOq4Z
	qagz8qUmzRCIB9lxtIb5dXwemCxBkGuYJ2zFzO7l5eUBCSNBr0xU8K8AXxXNNZPxQ4=
Content-Disposition: inline
In-Reply-To: <1352313166-28980-4-git-send-email-mark.langsdorf@calxeda.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, MyungJoo Ham <myungjoo.ham@gmail.com>

On Wed, Nov 07, 2012 at 12:32:43PM -0600, Mark Langsdorf wrote:
> When collecting stats, if a frequency doesn't match the table, go through
> the table again with both the search frequency and table values shifted
> left by 10 bits.

Why would that second pass succeed?

And why is this in generic code (I'm assuming this is a Calxeda-specific
case)?

-- 
Regards/Gruss,
Boris.
