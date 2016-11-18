From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Integrator DTS and defconfig changes
Date: Fri, 18 Nov 2016 09:53:01 -0800
Message-ID: <20161118175301.GA8882@localhost>
References: <CACRpkdara5D=kvGVYu-WRh_JYK6Z9NKmQ-eniXsauxdzx-QJbA@mail.gmail.com>
 <20161118072506.GC1785@localhost>
 <CACRpkdYoornJx1fTN1C5OiR16w9DbTcr9ze4gc9PLkt7LCqqCQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FL0fYT8c625UDOffCgLCgmkBU/7CTRHgWiarmawG7fw=;
        b=KbOYUNVtP6CK1wvuxCeG9Uc9/pYFzFbtnfn6zuKRVvkmGjenyQ0vdurQ9e9kUVv1Gk
         zRXGOtVl6xP5kmLMYDi7Xj6q23IQBu63phcdV5o6a4YG2yL7jZAl1bbPLKmVoEJ5zP+V
         4Dic1cv9Gs/iOjhUxrw06pnLMOopIgvT2H6r43DzuE7tSuzle4RCEcwahsDlR3zTlJTp
         RFf2L9PF3vHUYz2Q6oQxCwCDMXR8SkjJEl/ZtNdbHU4acamL9llncEKSJb3DLLrMj/jN
         EidpBUOreAIwIdWVxZWxXML3PlGOKVUk/mmY6KqAbbEHTI/tpkYPNKxjUdOR52DHwwcn
         b5ug==
Content-Disposition: inline
In-Reply-To: <CACRpkdYoornJx1fTN1C5OiR16w9DbTcr9ze4gc9PLkt7LCqqCQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org

On Fri, Nov 18, 2016 at 09:26:56AM +0100, Linus Walleij wrote:
> On Fri, Nov 18, 2016 at 8:25 AM, Olof Johansson <olof@lixom.net> wrote:
> 
> > I also sympathize that it's extra annoying having to split just three
> > patches across two branches. So, if it's easier we can just cherry-pick
> > apart the patches here across the branches (your comment about next
> > coverage makes me suspect you have no direct downstream users of this
> > branch). If that's OK, let me know and I'll do that tomorrow.
> 
> It's fine to cherry-pick, I can also send two separate branches (or
> just 2+1 stand-alone patches).
> 
> Any way you like it :) just tell me what to do, all I want is to get this
> in for v4.10.

Cherry-picking is actually faster on our side than merging, so I've done that
now. Queued into next/dt and next/defconfig for 4.10.


Thanks!


-Olof
