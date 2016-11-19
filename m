From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] Integrator DTS and defconfig changes
Date: Sat, 19 Nov 2016 16:19:08 +0100
Message-ID: <CACRpkdboZ-TwoHCUy5YFgzUoXbwWEYuSE8kdtAie51spPtZ1rg@mail.gmail.com>
References: <CACRpkdara5D=kvGVYu-WRh_JYK6Z9NKmQ-eniXsauxdzx-QJbA@mail.gmail.com>
 <20161118072506.GC1785@localhost> <CACRpkdYoornJx1fTN1C5OiR16w9DbTcr9ze4gc9PLkt7LCqqCQ@mail.gmail.com>
 <20161118175301.GA8882@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=U5S2LuJIlpbJIamfwO3k0BjQ0NY8QTdHc92/lfRgFfA=;
        b=EEA912pz47ihTiqxdl7+arEqvGreWJdwLbwb4GuqFuFcuYxpgrwL1zRG9n1ksj1wnO
         gSzjY/tipjlC5pOFfg+wkEF46eSwOqk33IqFWwkuBQ3TgSluCoGJxXGTN6fRd9gcw/wS
         oxXwlAFrROk9yskKOm+DVGTFCsVu+wuiLD/DM=
In-Reply-To: <20161118175301.GA8882@localhost>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olof Johansson <olof@lixom.net>
Cc: "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org

On Fri, Nov 18, 2016 at 6:53 PM, Olof Johansson <olof@lixom.net> wrote:
> On Fri, Nov 18, 2016 at 09:26:56AM +0100, Linus Walleij wrote:
>> On Fri, Nov 18, 2016 at 8:25 AM, Olof Johansson <olof@lixom.net> wrote:
>>
>> > I also sympathize that it's extra annoying having to split just three
>> > patches across two branches. So, if it's easier we can just cherry-pick
>> > apart the patches here across the branches (your comment about next
>> > coverage makes me suspect you have no direct downstream users of this
>> > branch). If that's OK, let me know and I'll do that tomorrow.
>>
>> It's fine to cherry-pick, I can also send two separate branches (or
>> just 2+1 stand-alone patches).
>>
>> Any way you like it :) just tell me what to do, all I want is to get this
>> in for v4.10.
>
> Cherry-picking is actually faster on our side than merging, so I've done that
> now. Queued into next/dt and next/defconfig for 4.10.

Thanks Olof, much appreciated!

Yours,
Linus Walleij
