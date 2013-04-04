From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V4 2/2] cpufreq: AMD "frequency sensitivity feedback"
 powersave bias for ondemand governor
Date: Thu, 4 Apr 2013 21:23:23 +0200
Message-ID: <20130404192323.GI32271@pd.tnic>
References: <1365092344-11310-1-git-send-email-jacob.shin@amd.com>
 <1365092344-11310-3-git-send-email-jacob.shin@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1365103406; bh=yPeVLwsCClK19DIa/oqjj94xejaLwbnuR+fh6cIr3kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=e5p46T7MG0zOoM+OR9jBQPujhI9kaW7XQa0TpM
	x5O2OYbWHPg/VNTjIbaXTKRFITUHJnVOXRgD1nbGhzlC7YvMWpnSEdJIy79WECOPO3k
	l3KUvo7k9Thwf/Qn97STWgIgpLVtQeEsIjpuC8Qd3U3w2mKh43E0nfSjp0m3oIqKlU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1365103406; bh=yPeVLwsCClK19DIa/oqjj94xejaLwbnuR+fh6cIr3kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=e5p46T7MG0zOoM+OR9jBQPujhI9kaW7XQa0TpM
	x5O2OYbWHPg/VNTjIbaXTKRFITUHJnVOXRgD1nbGhzlC7YvMWpnSEdJIy79WECOPO3k
	l3KUvo7k9Thwf/Qn97STWgIgpLVtQeEsIjpuC8Qd3U3w2mKh43E0nfSjp0m3oIqKlU=
Content-Disposition: inline
In-Reply-To: <1365092344-11310-3-git-send-email-jacob.shin@amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Thomas Renninger <trenn@suse.de>

On Thu, Apr 04, 2013 at 11:19:04AM -0500, Jacob Shin wrote:
> Future AMD processors, starting with Family 16h, can provide software
> with feedback on how the workload may respond to frequency change --
> memory-bound workloads will not benefit from higher frequency, where
> as compute-bound workloads will. This patch enables this "frequency
> sensitivity feedback" to aid the ondemand governor to make better
> frequency change decisions by hooking into the powersave bias.
> 
> Signed-off-by: Jacob Shin <jacob.shin@amd.com>

Looks good to me.

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
