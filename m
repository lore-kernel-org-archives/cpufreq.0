From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 15:13:35 +0100
Message-ID: <20130322141335.GG30807@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <1479611.koCCfMhmrZ@skinner.arch.suse.de>
 <CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
 <1694228.Eg36y3ID9W@skinner.arch.suse.de>
 <CAKohpon0_aNK6-eXwdqPUg9SVAjScF7+-s+WTP0wWFNaOY-YSQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363961622; bh=5jteFdnkGUDVCHbEh9YK9cc55eWaCF9UdD+FGoI9Cis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=YyDZFIyykGvoZK04G9Y4QTMfLt1mQXuygESi4F
	zOfnOio0vzrwEjJJJJDTnsyqiQKUFhNIFiHgY6zAOZhG3BiQCguu0oadOLL4eucr7z7
	QH1dAWY0DYybKUesfwUWhi4J7oEQir1sx5nKNWcXyf8aWNIx0YNr0+jRf+te8xl2nM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363961622; bh=5jteFdnkGUDVCHbEh9YK9cc55eWaCF9UdD+FGoI9Cis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=YyDZFIyykGvoZK04G9Y4QTMfLt1mQXuygESi4F
	zOfnOio0vzrwEjJJJJDTnsyqiQKUFhNIFiHgY6zAOZhG3BiQCguu0oadOLL4eucr7z7
	QH1dAWY0DYybKUesfwUWhi4J7oEQir1sx5nKNWcXyf8aWNIx0YNr0+jRf+te8xl2nM=
Content-Disposition: inline
In-Reply-To: <CAKohpon0_aNK6-eXwdqPUg9SVAjScF7+-s+WTP0wWFNaOY-YSQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thomas Renninger <trenn@suse.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Fri, Mar 22, 2013 at 07:40:45PM +0530, Viresh Kumar wrote:
> acpi-cpufreq is broken and so all others who are using it. Sorry for
> asking the stupid question now but what's the hierarchy of cpufreq
> drivers for intel (I will try to go through it now), some drivers use
> acpi-cpufreq driver?

All relevant x86 out there uses acpi-cpufreq. Which means that breaking
it, breaks cpufreq on x86. Which is absolutely a no-no.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
