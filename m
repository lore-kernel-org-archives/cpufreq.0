From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH V2 0/8] ARM: OMAP3+: support cpufreq-cpu0 for device tree boot
Date: Thu, 28 Mar 2013 08:43:18 -0500
Message-ID: <CAGo_u6rn=GHVfJiz_7gkse2e-e3BZicEqJBQWomftpi-nCvfng@mail.gmail.com>
References: <1363715590-5131-1-git-send-email-nm@ti.com>
	<51542390.1020300@ti.com>
Mime-Version: 1.0
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Fk1xx1GitX0L06Je37dlJ2P7X2jrApNgqiyS038YhSs=;
        b=dt3GkLqrsDNsmo7Rb3bFIj1cZhhw0XkURAEMoTvAHOxJHnNUkvoJKx9neDfHGST4EF
         4WMZoBqpHX2xPOEnME2XnQWXKEmxKw1rJKN1WbIIcq8KeKpgJ58DQubLKtBOmqh8dTa+
         QNoTuSerEO95kdY67ZtycaWP4p9C3o9mAZMrnPaNhlmJj0qAjQymTTl0FdSLVUcIP+D+
         65E20Rng3oBlWg+2aBvP/GLxkwDv0Mtf5d4xuo1xqoQce0xFqJ4Ig+lTvfzl0SeJ8gWE
         fYwcwBQ7TKVl/zWHyOr1KrWMyI/HGm/RHvZvQtQW7qVaRZFmJkAQDouBcVTPV5GlSDwe
         2z+w==
In-Reply-To: <51542390.1020300@ti.com>
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benoit Cousson <b-cousson@ti.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-pm@vger.kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, Keerthy <j-keerthy@ti.com>, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Jon Hunter <jon-hunter@ti.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Benoit,

On Thu, Mar 28, 2013 at 6:03 AM, Benoit Cousson <b-cousson@ti.com> wrote:
> The patches 1 to 6 looks good to me. Beside the pretty long Cc list,
> that should not necessarily contain all the mailing list.
Arrgh.. my bad. I will keep it in mind for the future.

>
> Since you are changing / renaming some DTS files, and to avoid any merge
> conflict I will apply only these 6 patches.
> DTS and driver changes are in theory orthogonal enough to allow merging
> them separately and in any order.
>
> I'll update my branch with these patches ASAP.
Thanks. I will post a v3 of remaining patches later today.

Regards,
Nishanth Menon
