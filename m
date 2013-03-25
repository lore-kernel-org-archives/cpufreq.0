From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Mon, 25 Mar 2013 14:55:16 +0100
Message-ID: <20130325135516.GB5263@pd.tnic>
References: <CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
 <1694228.Eg36y3ID9W@skinner.arch.suse.de>
 <2581491.irn18K9zaF@hammer82.arch.suse.de>
 <CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
 <CAKohpoksBOpW59YETR-SMWJSGsJSWKoXktJoVM38SietN9p3Ug@mail.gmail.com>
 <20130324044927.6a2b1588@ws>
 <CAKohpokknnU7jn0UuNsoRoho5MSmzT-Ub3sVwR030uJqMjSH7g@mail.gmail.com>
 <CAKohpomsrafpNii9zqAjqe5kqEGOEdP5mDpSSjTswrY1YNfhBw@mail.gmail.com>
 <20130325041541.4574f51a@ws>
 <CAKohpo=DY6kmUVjpuHimMdYp1ubRfbNYfTjAB=mDPEkSzqumRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364219718; bh=Z0h9OieYwq+zLZHajgddyYE9x+Il/e1mcyn007x8gCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=BnrApR3YPt1bifYB2vE5tSdH2j4Wnqrq4IXwiW
	JuWR1x0+E15l8BPfvnE6PCkijPPya9e+z9DqDaQlCEDgLfjMD5zpmlG1xDrAxVWC2UZ
	KG/gPLPUIGIwD2U4pcTLpZ5hYvdEqnZ/eTtmzf82iw2HivrgJqf/vguEo2FRBK0OBA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364219718; bh=Z0h9OieYwq+zLZHajgddyYE9x+Il/e1mcyn007x8gCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=BnrApR3YPt1bifYB2vE5tSdH2j4Wnqrq4IXwiW
	JuWR1x0+E15l8BPfvnE6PCkijPPya9e+z9DqDaQlCEDgLfjMD5zpmlG1xDrAxVWC2UZ
	KG/gPLPUIGIwD2U4pcTLpZ5hYvdEqnZ/eTtmzf82iw2HivrgJqf/vguEo2FRBK0OBA=
Content-Disposition: inline
In-Reply-To: <CAKohpo=DY6kmUVjpuHimMdYp1ubRfbNYfTjAB=mDPEkSzqumRg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Duncan <1i5t5.duncan@cox.net>, bugzilla-daemon@bugzilla.kernel.org, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Renninger <trenn@suse.de>, Andre Przywara <andre.przywara@linaro.org>, djwong@us.ibm.com

On Mon, Mar 25, 2013 at 04:53:39PM +0530, Viresh Kumar wrote:
> But for 3.9 i believe this patch should be good enough.

Seems so here too.

Tested-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
