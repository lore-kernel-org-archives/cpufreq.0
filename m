From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Sun, 24 Mar 2013 11:31:02 +0100
Message-ID: <20130324103102.GA18601@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
 <1694228.Eg36y3ID9W@skinner.arch.suse.de>
 <2581491.irn18K9zaF@hammer82.arch.suse.de>
 <CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364121063; bh=cQ/ixq/Dl1k22leVNt5YngDzPP8AmW9wYxuxYIsPQOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=FYUZJVAMWEsFZho5yBWhjHC+W5fW6fOmX6rP+G
	7MskgAOotCPxz2jUJWhGW6vA9YcmRjhI/jOmOoIIHCGmwb7M9kaOkD9RtmGJd7vK6N/
	AtBIpBgsm80hXdJk6LHZyEnlbBdBnY7VdU96Drz9TNYi4buhXNqdYXReTaFPKIBv7M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364121063; bh=cQ/ixq/Dl1k22leVNt5YngDzPP8AmW9wYxuxYIsPQOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=FYUZJVAMWEsFZho5yBWhjHC+W5fW6fOmX6rP+G
	7MskgAOotCPxz2jUJWhGW6vA9YcmRjhI/jOmOoIIHCGmwb7M9kaOkD9RtmGJd7vK6N/
	AtBIpBgsm80hXdJk6LHZyEnlbBdBnY7VdU96Drz9TNYi4buhXNqdYXReTaFPKIBv7M=
Content-Disposition: inline
In-Reply-To: <CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>, Thomas Renninger <trenn@suse.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Sun, Mar 24, 2013 at 02:40:53PM +0530, Viresh Kumar wrote:
> > And powernow-k8 does not exist anymore..., fortunately I didn't have to
> > look at this stuff for some time.
> 
> Sure? Driver is still present in mainline.

powernow-k8 is still there for, well, K8 only. Newer machines are
handled by acpi-cpufreq. Thus is acpi-cpufreq's health of major
importance especially now. :)

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
