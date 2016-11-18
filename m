From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Integrator DTS and defconfig changes
Date: Thu, 17 Nov 2016 23:25:06 -0800
Message-ID: <20161118072506.GC1785@localhost>
References: <CACRpkdara5D=kvGVYu-WRh_JYK6Z9NKmQ-eniXsauxdzx-QJbA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eIFefbmyd/+4LRUVlXWt4UrwBxZbNuI4/fnS4G2/7/c=;
        b=L4NhemQxAN+FrgFyLYag+zNWndFhc5i54e2sbDvdFgK1QgV8PmYnXUtkpS2kxlIg8C
         mvnM1RdeFevyU2UfaSbslQO4Wkf/6Zp7rgykOsLhSnhiOUWjjZoZ6YOnOBNtnRd0IhUF
         EQW3P/7V3MkD0apm3jYI9oJ0UuRFFq9EkwUrztwVSudBoE9iiTXZ1oPlVFKMwTnycnSd
         0d6nE9Y5gT58RTO1QBGHIeghLF/HPXE3sy3dDqIMFEKYq1QRDkym9cRq89fX7xvPiedQ
         wk3qg+9HbLQI6/db+RDagpPCyA5D+HPV+6+ALFJ1SHjhZv12/fw/apjFFAp3DbvoEE0j
         zzkg==
Content-Disposition: inline
In-Reply-To: <CACRpkdara5D=kvGVYu-WRh_JYK6Z9NKmQ-eniXsauxdzx-QJbA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org

Hi Linus,

On Wed, Nov 09, 2016 at 09:10:35AM +0100, Linus Walleij wrote:
> Hi ARM SoC folks,
> 
> this adds DT-based cpufreq to the Integrator family.
> 
> The corresponding cpufreq changes are merged by Rafael to the
> cpufreq tree, and can go in orthogonally.
> 
> However I have included the defconfig change turning on the feature
> here as it makes all kind of logic sense to have these three patches
> in succession: addin the DTS nodes and then turning on the DT
> cpufreq.
> 
> If you insist, of course I can send the defconfig patch separately.
> I just think it makes more sense like this.
> 
> Please pull it in so we get some rotation in linux-next for this!

Hmm.

I understand that it makes sense for your platform do turn on the option
at the same time as adding the DT entries, but there's nothing that should
require them to go in together (they just won't be used until both branches are
in).

We try to keep our categories of patches separate in the arm-soc tree;
keeping SoC changes, driver changes, DT changes and defconfig changes
is from a general code hygiene point of view beneficial and we encourage all
platform maintainers to follow those guidelines.

I also sympathize that it's extra annoying having to split just three
patches across two branches. So, if it's easier we can just cherry-pick
apart the patches here across the branches (your comment about next
coverage makes me suspect you have no direct downstream users of this
branch). If that's OK, let me know and I'll do that tomorrow.


Cheers,


-Olof

