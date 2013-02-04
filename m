From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/4] CPUFreq: Implement per policy instances of governors
Date: Mon, 4 Feb 2013 13:32:21 +0100
Message-ID: <20130204123221.GA22340@pd.tnic>
References: <cover.1359976493.git.viresh.kumar@linaro.org>
 <5808458.pvV2iHpBWm@vostro.rjw.lan>
 <CAKohpok7RiJ_HKGi3r0vU26kNEtFKq==pMMoshT6Z2yy9ghemA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1359981150; bh=w1olXITDIgTh0bso2ONk569uoyszu8wfnvA2RcUpw7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=kt2bNVJX8hBe+uQvuf0cW5g0hWFFWB62jLy7yt
	nDlxKdtPa/WXMQjT5D3FoVgfPtTY2ovenBdw0dcikuERdaKH3F4bhBRVEs45mcneuQ8
	kWQlHmWGnldYuK5Iv31DlCM1sy3+C6Oaof7zx6w05UFcvMj8IBQS9pOiWmQX0gmmV4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1359981149; bh=w1olXITDIgTh0bso2ONk569uoyszu8wfnvA2RcUpw7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=omOFp7XkxdVVRggWViqApwr8Sf6Phgoytavr7S
	3FuHRllaui9RLUR+wAmKD5IjqfVTWeo4+FKeiN0tn1NtdnsW0/GADohjJwJNuAt35e8
	sCI4ydV6iTvqbMtzhcYplOmGTsfsEY4iR1IXRbMtTVioG0grGJ3qZE48gdL753bzME=
Content-Disposition: inline
In-Reply-To: <CAKohpok7RiJ_HKGi3r0vU26kNEtFKq==pMMoshT6Z2yy9ghemA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com

On Mon, Feb 04, 2013 at 05:54:18PM +0530, Viresh Kumar wrote:
> One important point i would like to highlight is: governors directory
> would be present in cpu/cpu*/cpufreq/ now instead of cpu/cpufreq/.

Uh, hold on, isn't this breaking a bunch of userspace with this move?
Also, on all those other systems which don't need per-policy governors,
we probably don't need this. So maybe this should be made optional, to
be enabled by a config option IMO...

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
