From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 14:21:20 +0100
Message-ID: <20130322132120.GD30807@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <3039053.c3U9fYsQRn@vostro.rjw.lan>
 <CAKohpokjzbYTrxF=kO-XSQwNowheHjuJbzzuvHwk9yOQ=7-izg@mail.gmail.com>
 <2181763.eSzSO6ey0C@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363958486; bh=U9za4hcOgVBg+YtQTiSB7g5Rza0UcreOippNdC6kt5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=mD9n10ONNFoWlRpRLt6FiymaCnvCDpjp6k141T
	BsV774MmKcvzrgLRdjmOoF6tLOlJQw5/dyxa9YM192+hJeQfWDZHcz7g5Ifjv6Wwc5M
	QRivm6bpIwcdLzSH9ETCLTplq3glQ0Z5V9MMqiFSS5eHdeyJfLO6INiX7Tgz3Eeu2o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363958486; bh=U9za4hcOgVBg+YtQTiSB7g5Rza0UcreOippNdC6kt5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=mD9n10ONNFoWlRpRLt6FiymaCnvCDpjp6k141T
	BsV774MmKcvzrgLRdjmOoF6tLOlJQw5/dyxa9YM192+hJeQfWDZHcz7g5Ifjv6Wwc5M
	QRivm6bpIwcdLzSH9ETCLTplq3glQ0Z5V9MMqiFSS5eHdeyJfLO6INiX7Tgz3Eeu2o=
Content-Disposition: inline
In-Reply-To: <2181763.eSzSO6ey0C@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On Fri, Mar 22, 2013 at 02:12:50PM +0100, Rafael J. Wysocki wrote:
> On Friday, March 22, 2013 05:45:29 PM Viresh Kumar wrote:
> > On 22 March 2013 17:47, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> > > OK, so what exactly do you need to now?
> > 
> > s/now/know ??
> 
> Yes, sorry.

Right, I heard about this breakage on Bulldozer and I can repro it here
too :(.

Which is not good and it needs to be fixed ASAP. From looking at the
patches in question, this should be reproducible on everything, though,
since it is generic cpufreq code. And if so, this makes the urgency of a
fix much more dire.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
