From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 15:11:45 +0100
Message-ID: <20130322141145.GF30807@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
 <3039053.c3U9fYsQRn@vostro.rjw.lan>
 <1479611.koCCfMhmrZ@skinner.arch.suse.de>
 <CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
 <20130322135419.GE30807@pd.tnic>
 <CAKohpongPUY-iQRQm+=x4CTomZ3okX9oipxrxizDBb8uR2s4ng@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363961512; bh=8zoJ96K8JHChq3RouxBrUfcHNkC8cdmk3tT25mAHDlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=E36EOfefq5tQPmzQSWzNaPnKLnYDrZklr/wasQ
	OJV3I2e+1gmHzSI5nXGk0xZ4Z7D8i8d9b5LBNRDkfUDN21d875O/uGce/HMCwlSYxC1
	eXoiyJ9fNfRog9WmqXDko3B7pg3zW7KVaRT0jyOn+bfIacWKC5bmQBqHpZh8Oizz9Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363961512; bh=8zoJ96K8JHChq3RouxBrUfcHNkC8cdmk3tT25mAHDlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=E36EOfefq5tQPmzQSWzNaPnKLnYDrZklr/wasQ
	OJV3I2e+1gmHzSI5nXGk0xZ4Z7D8i8d9b5LBNRDkfUDN21d875O/uGce/HMCwlSYxC1
	eXoiyJ9fNfRog9WmqXDko3B7pg3zW7KVaRT0jyOn+bfIacWKC5bmQBqHpZh8Oizz9Q=
Content-Disposition: inline
In-Reply-To: <CAKohpongPUY-iQRQm+=x4CTomZ3okX9oipxrxizDBb8uR2s4ng@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thomas Renninger <trenn@suse.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Fri, Mar 22, 2013 at 07:35:19PM +0530, Viresh Kumar wrote:
> But yes i will give it another try to go through the driver in details
> and see if i can fix it.

Right, and make sure it is a minimal fix which can go in now. If it
appears to get more involved, we'd probably need to revert now and you
can retry next merge window.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
