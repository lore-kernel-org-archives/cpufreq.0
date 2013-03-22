From: Borislav Petkov <bp@alien8.de>
Subject: Re: More cpufreq breakage
Date: Fri, 22 Mar 2013 16:13:48 +0100
Message-ID: <20130322151348.GI30807@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <20130319074953.C200811FB80@bugzilla.kernel.org>
 <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
 <3039053.c3U9fYsQRn@vostro.rjw.lan>
 <20130322151228.GH30807@pd.tnic>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363965234; bh=F0NVwezCknY+asAjSmBjduCyKgop0HblVIuTztIKhgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=SfdltWRWH5RzOTlLLvNA0oXGeL5Dxv1LYPEo9Y
	wOhYfHqHqF4RcqCOi0rKcJWGFtR6ai548Df5VHYQzCVGThDf+W6NYvfFuL6YkBFQZ7u
	tRCyfzyEyEVsXU0PUbRIz51MsVlZVhMqIy18/bj+HUWws+jy+jn7T5CZyJQDjt/i/g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363965234; bh=F0NVwezCknY+asAjSmBjduCyKgop0HblVIuTztIKhgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=SfdltWRWH5RzOTlLLvNA0oXGeL5Dxv1LYPEo9Y
	wOhYfHqHqF4RcqCOi0rKcJWGFtR6ai548Df5VHYQzCVGThDf+W6NYvfFuL6YkBFQZ7u
	tRCyfzyEyEVsXU0PUbRIz51MsVlZVhMqIy18/bj+HUWws+jy+jn7T5CZyJQDjt/i/g=
Content-Disposition: inline
In-Reply-To: <20130322151228.GH30807@pd.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On Fri, Mar 22, 2013 at 04:12:28PM +0100, Borislav Petkov wrote:
> Btw,
> 
> while we're at it, I just discovered this in dmesg. Plain -rc3.

Forgot to say, this happened once during resume.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
