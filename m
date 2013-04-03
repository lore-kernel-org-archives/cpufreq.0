From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V3 2/2] cpufreq: AMD "frequency sensitivity feedback"
 powersave bias for ondemand governor
Date: Wed, 3 Apr 2013 19:30:28 +0200
Message-ID: <20130403173028.GB4716@pd.tnic>
References: <1364926304-1799-1-git-send-email-jacob.shin@amd.com>
 <20130402192352.GC17675@pd.tnic>
 <20130402200337.GA17919@jshin-Toonie>
 <2932884.BNCEuERbdR@skinner.arch.suse.de>
 <20130402210124.GI17675@pd.tnic>
 <20130403165324.GB17919@jshin-Toonie>
 <20130403170456.GA4723@pd.tnic>
 <20130403171738.GC17919@jshin-Toonie>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1365010229; bh=1Xi7J8JhTxjO9ik+zUtvZlwzAD/rTLm4vkNAgJADcTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=KwML0PMu6zkcgqoJJ4dUEBEvx1G94HsF+S9MDx
	NRDepkKvdab+NJMVpudKfiUjKixE1gZJU6OkUiMLMPm6is9p5++2BC67w1xbF2SJUso
	9SpoVMy7zj9+UUvG2DT/FtIrbv2V1NNRrE11rCpRqV2tpZvi5vo86/PvnQR59kd5gA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1365010229; bh=1Xi7J8JhTxjO9ik+zUtvZlwzAD/rTLm4vkNAgJADcTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=KwML0PMu6zkcgqoJJ4dUEBEvx1G94HsF+S9MDx
	NRDepkKvdab+NJMVpudKfiUjKixE1gZJU6OkUiMLMPm6is9p5++2BC67w1xbF2SJUso
	9SpoVMy7zj9+UUvG2DT/FtIrbv2V1NNRrE11rCpRqV2tpZvi5vo86/PvnQR59kd5gA=
Content-Disposition: inline
In-Reply-To: <20130403171738.GC17919@jshin-Toonie>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: Thomas Renninger <trenn@suse.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

On Wed, Apr 03, 2013 at 12:17:38PM -0500, Jacob Shin wrote:
> Writing 0 to powersave_bias or unloading the AMD driver could do that.
>
> When the AMD driver loads, it will give a sane default value to
> powersave_bias to enable it, when it unloads, it will put it back to
> 0.

... and on systems without hw feedback, it will keep powersave_bias to 0
by default, retaining the old behavior.

Yeah, sounds like a plan.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
