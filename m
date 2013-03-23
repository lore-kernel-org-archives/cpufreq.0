From: Borislav Petkov <bp@alien8.de>
Subject: Re: More cpufreq breakage
Date: Sat, 23 Mar 2013 17:06:44 +0100
Message-ID: <20130323160644.GC10811@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
 <20130323134541.GA10811@pd.tnic>
 <5152799.d8sLDQMJWT@vostro.rjw.lan>
 <CAKohpomTBEu1ByjnSw1mbyBhXKTrj=Qte7fBuyaKp+TcOb8d_w@mail.gmail.com>
 <CAKohpok-75YSAwdni5O07PtmEZbSKF9YrJjpHtG+r0T-aVn6ww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364054807; bh=o7AKvi3Ugw5FYKuxgIOKWLZkscEfkqnX1abn26BA4u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=SnhXhAr4Vid6a0VVVF3B0NJKM03xz/w+38uK5A
	hgL7iGvnLYm0J6Rd7D9qGQ1odmw2ZFUxoyZ1o5w37ULb6JD0IRL2KOmYPrqZbYcNEHp
	8Yi+PI0mkDKFeOPvMfLCATJ1mlcnaN0WE3d8mVrVlKO7ca62snMHYY2SIae+C2i2TI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364054807; bh=o7AKvi3Ugw5FYKuxgIOKWLZkscEfkqnX1abn26BA4u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=SnhXhAr4Vid6a0VVVF3B0NJKM03xz/w+38uK5A
	hgL7iGvnLYm0J6Rd7D9qGQ1odmw2ZFUxoyZ1o5w37ULb6JD0IRL2KOmYPrqZbYcNEHp
	8Yi+PI0mkDKFeOPvMfLCATJ1mlcnaN0WE3d8mVrVlKO7ca62snMHYY2SIae+C2i2TI=
Content-Disposition: inline
In-Reply-To: <CAKohpok-75YSAwdni5O07PtmEZbSKF9YrJjpHtG+r0T-aVn6ww@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: 1i5t5.duncan@cox.net, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On Sat, Mar 23, 2013 at 08:46:00PM +0530, Viresh Kumar wrote:
> On 23 March 2013 20:04, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > I think otherwise, Its the cpu online path but this didn't happened for
> > first boot (probably).
> 
> I tried on my 4 cpu laptop and my bad, couldn't reproduce the issue
> reported by both Borislav and Duncan :(
> 
> Hibernation logs (Borislav's bug):
> https://pastebin.linaro.org/2019/
> 
> cpufreq-info after hibernation (same happens with suspend)  (Duncan's bug):
> https://pastebin.linaro.org/2020/

Those pastebin things want a login. Use a free one.

> The main difference between our systems is number of cpu groups that
> share clock line. On setup of both Duncan and Borislav, they had total
> of 8 cpus and four groups 0-1, 2-3, 4-5, 6-7. And thus have four
> policy structures. And i have only one group 0-1-2-3 and thus only one
> policy struct.

So this should give you a clue - you need to repro it on a similar
machine and your laptop is obviously not similar.

> @Borislav: BTW, can you try reproducing your issue again? If that is
> reproducible?

I've seen it only once so far and I've suspended the machine a bunch of
times already. So I don't think it is that easy to reproduce.

> I don't see (logically) how sub_preempt_count() can be called from
> cpufreq_governor_dbs()? As it is mostly called from kernel/sched/ part
> only.

As Rafael said, there's a notifier running which can, AFAICT, disable
preemption on another CPU in parallel, for example.

> If you still get it, try disabling cpufreq completely and see if it is
> gone or not.

Unfortunately this is my desktop machine and I don't want to test stuff
on it because I need it to work. And I've already downgraded to 3.8.3
because of the other cpufreq breakage which kept a subset of the cores
at max freq because acpi-cpufreq wasn't loading on them.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
