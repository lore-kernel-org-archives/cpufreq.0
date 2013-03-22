From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 14:54:19 +0100
Message-ID: <20130322135419.GE30807@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
 <3039053.c3U9fYsQRn@vostro.rjw.lan>
 <1479611.koCCfMhmrZ@skinner.arch.suse.de>
 <CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363960465; bh=TKhkkEkIZ4O8ZF3wXm1oz6zOScqQny4X9oUOOLhk4vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=kDXAJqoErdyBGWHvhMk4znmEDMbA2asNJ8tr50
	u/KD5BPMKrnObj6+1xE5EVzJhzvWTVBbItLW56h9qP4qcL0qDevvZdQy/1861hmmT3u
	VjrhqEPilNFiTTRFOF7ZbXlhiGfUrqdh/YJjooBUPcN1k1G4R6KG88cNb0LC9ma7Zc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363960465; bh=TKhkkEkIZ4O8ZF3wXm1oz6zOScqQny4X9oUOOLhk4vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=kDXAJqoErdyBGWHvhMk4znmEDMbA2asNJ8tr50
	u/KD5BPMKrnObj6+1xE5EVzJhzvWTVBbItLW56h9qP4qcL0qDevvZdQy/1861hmmT3u
	VjrhqEPilNFiTTRFOF7ZbXlhiGfUrqdh/YJjooBUPcN1k1G4R6KG88cNb0LC9ma7Zc=
Content-Disposition: inline
In-Reply-To: <CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thomas Renninger <trenn@suse.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Fri, Mar 22, 2013 at 07:13:33PM +0530, Viresh Kumar wrote:
> I have never gone into coding for any non-ARM platform and am
> really not aware of acpi-cpufreq driver and its users. That's why
> i told everybody where the issue is, and they just need to fix
> acpi-cpufreq driver with right values of policy->cpus (affected_cpus)
> and everything else would work after that.

No, you're breaking existing drivers with your changes - nobody will fix
stuff *you're* breaking.

You need to get the hardware and test your changes on *that* hardware
too. Otherwise, the offending patches should be reverted until you can
provide a patchset which works on everything.

Geez, the fact that I even need to explain this...

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
