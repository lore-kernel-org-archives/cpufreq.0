From: Artem Savkov <artem.savkov@gmail.com>
Subject: Re: [BUG] cpufreq: sleeping function called from invalid context at
 kernel/workqueue.c:2811
Date: Thu, 7 Feb 2013 10:27:44 +0400
Message-ID: <20130207062743.GA4388@thinkpad.lan>
References: <20130206202513.GA5626@thinkpad.lan>
 <1543919.ZBNJa64WB5@vostro.rjw.lan>
 <1873989.qC1mdEKIl9@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=rdPflSpkw3+WQnvbwLlW/c0Fo5PLTpYgfms47tdvlTI=;
        b=bgV3trOgAvzaDKu+ZTDa1DOr2Y/EQVgayjojIiPNP+iLDq8wwPfm7kupRRUwX4jCap
         NtbtNdIuyN6wRCnqRFj0e+NwJiRFNcaj6bBItvTt9l6IoSPYA5R9H2rOXt0bMeG/zKw2
         FWFjJzaMYmEpcRh+Akgg9moF/oTkEtWmVNZtYFTOYIumX3KXpGz628SgRpNyHXNVLGf8
         27WF8bQ0t25wyLsZD6A/4yBd+TAuzeDUZ9zli26GliMtSv1Xxo2URnLctZYR9PTcaJHb
         LSlbPtBy/E/gh+XF4qxNBHXxCE+mfVMqyo3p1JDy8V50wLiQgHwrBiIn8wjxNKIJ2kSX
         BqAA==
Content-Disposition: inline
In-Reply-To: <1873989.qC1mdEKIl9@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

On Thu, Feb 07, 2013 at 01:41:57AM +0100, Rafael J. Wysocki wrote:
> On Wednesday, February 06, 2013 10:11:25 PM Rafael J. Wysocki wrote:
> > On Thursday, February 07, 2013 12:25:13 AM Artem Savkov wrote:
> > > I get the following BUG on suspend using systemd-sleep(this doesn't
> > > happen with pm-suspend). This seems to be introduced by some of the
> > > Viresh's patches.
> > 
> > Which branch from which day?

The log is from linux-next-20130205, still reproducible on -20130206

> OK, I've reproduced it and the appended patch fixes it for me.  Can you please
> try it and report back?

I've tried the patch and the bug is still reproducible. I might be wrong
but it seems that the bug happens on first __cpufreq_remove_dev
call(CPU1) on __cpufreq_governor(data, CPUFREQ_GOV_STOP) call (line
~1050) but changes in your patch are all below that call.

-- 
Kind regards,
Artem
