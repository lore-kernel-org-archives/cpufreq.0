From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V3 2/2] cpufreq: AMD "frequency sensitivity feedback"
 powersave bias for ondemand governor
Date: Tue, 2 Apr 2013 23:01:24 +0200
Message-ID: <20130402210124.GI17675@pd.tnic>
References: <1364926304-1799-1-git-send-email-jacob.shin@amd.com>
 <20130402192352.GC17675@pd.tnic>
 <20130402200337.GA17919@jshin-Toonie>
 <2932884.BNCEuERbdR@skinner.arch.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364936487; bh=B+PbWyHYvDVZAhy2ISvhYKzw44np/Vcva/s5U5fLTVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=qaqkNjqaM+Bcg0EAdQyBLrQxyL+bhODTgZSn32
	HsVGE/1wlIc38KyFavEtSNRmLYaGeRZZu2Hwk0bcjlDVOfS19Xwsj7m47OvrT3PFPaC
	nqq1guMvyOR5WzYFfO/BddT+bDpqyomwhc3JyOFRrvp62na9TWBw+UFehZv9pGrw44=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364936486; bh=B+PbWyHYvDVZAhy2ISvhYKzw44np/Vcva/s5U5fLTVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=WFR9sPeEbRAOTsJtoRkoOfoAzD8OaUaf+FxjxP
	lLBDZrLi1UsTUTVHIrDUuocaMmqnq28xA3AWjpLfclMpMOR5GIa2c53oexZSVi4S5OV
	OMI345t06kJj0OiSixluPMJVHYjOV9el2j37cQgMpab6v29pUXbCzAXAdBfVAWMhYc=
Content-Disposition: inline
In-Reply-To: <2932884.BNCEuERbdR@skinner.arch.suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Jacob Shin <jacob.shin@amd.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

On Tue, Apr 02, 2013 at 10:51:51PM +0200, Thomas Renninger wrote:
> Yep, if you want anyone to make use of this, it should better get
> embedded in more general, at least general ondemand code.

Yeah, it all sounds like we want to enable this by default on systems
which support it. Maybe with an off-switch for people who want plain
ondemand decisions.

The remaining systems with ripped out powersave_bias would get plain
ondemand governor decisions. Provided, of course, nobody uses
powersave_bias and the functionality doesn't make any sense anyway.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
