From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v2 1/7] cpufreq: cpufreq-cpu0: allow optional safe voltage
 during frequency transitions
Date: Mon, 3 Feb 2014 21:36:23 +0530
Message-ID: <CAJuA9ahFqcT9oEUY5zU6pWxZLMkgQx9F521qAS0HQ-KvBjdRbw@mail.gmail.com>
References: <1390047057-2239-1-git-send-email-thomas.ab@samsung.com>
	<CAPtuhTj2ZOb+5LDbqghuOhQZfVy8i1xuWotoZ6ocbJFgMxnSMQ@mail.gmail.com>
	<CAJuA9ajLUPtsReomPuuzMpshTEiUz81sc4584DEVQnG=iwGb-g@mail.gmail.com>
	<2009408.gnUEcoqA3p@phil>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=jpuJn8qnXQUSljxrrdAROQJDJvbEVXY2XtmNQAdCKGg=;
        b=yFzm25vEqlXdmSWT8Dp3bGy6DZjAbgjF3q34+VKa/fHKHtixBW59xfKWKZJT5Rj0Md
         YmnJQBFM7AV1alvpEOqRi5cAMqKbTPNY+ue+NkHWceEXoSkhBCnbQCvIiiLcDCDRlL1v
         R80OPn26qOW7/TQg+YMF65De91iJU1wPWOioj/B8cs+rq3uEB4nmYIboKORTCo46JUvU
         Y8MhyDNd47ZzUxIpkjHb4cxYHi43w/skItKUUkVYEsZHvyja14D7QN81PS05PkpKOrNQ
         LoUKfrK13uy4tTPVmrZO7TNWzrS0M2W0/6cjZF0Men8Wn6o5T3N9h/jqA3XIHVewor2z
         Ehgg==
In-Reply-To: <2009408.gnUEcoqA3p@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Mike Turquette <mturquette@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, thomas.ab@samsung.com

On Thu, Jan 30, 2014 at 8:39 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:
> On Thursday, 30. January 2014 18:23:44 Thomas Abraham wrote:
>> Hi Mike,
>>
>> On Wed, Jan 29, 2014 at 12:17 AM, Mike Turquette <mturquette@linaro.=
org>
> wrote:
>> > On Mon, Jan 27, 2014 at 9:30 PM, Thomas Abraham <ta.omasab@gmail.c=
om>
> wrote:
>> >> Hi Mike,
>> >>
>> >> On Tue, Jan 28, 2014 at 1:55 AM, Mike Turquette <mturquette@linar=
o.org>
> wrote:
>> >>> Quoting Thomas Abraham (2014-01-18 04:10:51)
>> >>>
>> > As far as I can tell
>> > the remux does not happen because it is necessary to generate the
>> > required clock rate, but because we don't want to run the ARM core=
 out
>> > of spec for a short time while the PLL relocks. Assuming I have th=
at
>> > part of it right, I prefer for the parent mux operation to be a pa=
rt
>> > of the CPUfreq driver's .target callback instead of hidden away in=
 the
>> > clock driver.
>>
>> The re-parenting is mostly done to keep the ARM CPU clocked while th=
e
>> PLL is stopped, reprogrammed and restarted. One of the side effects =
of
>> that is, the clock speed of the temporary parent could be higher the=
n
>> what is allowed due to the ARM voltage at the time of re-parenting.
>> That is the reason to use the safe voltage.
>
> The Rockchip-SoCs use something similar, so I'm following quite close=
ly what
> Thomas is trying to do here, as similar solution would also solve thi=
s issue
> for me.
>
> On some Rockchip-SoCs even stuff like pclk and hclk seems to be sourc=
ed from
> the divided armclk, creating additional constraints.
>
> But on the RKs (at least in the upstream sources) the armclk is simpl=
y equal
> to the pll output. A divider exists, but is only used to make sure th=
at the
> armclk stays below the original rate when sourced from the temp-paren=
t, like
>
>         if (clk_get_rate(temp_parent) > clk_get_rate(main_parent)
>                 set_divider(something so that rate(temp) <=3D rate(ma=
in)
>         clk_set_parent(...)
>
> Isn't there a similar possiblity on your platform, as it would remove=
 the need
> for the safe-voltage?

Hi Heiko,

Yes, this works too! I have tested this method on Exynos4210,
Exynos4412 and Exynos5250 and it works fine without any need for safe
voltage. This is much better than using safe voltage. Thank you for
suggesting this.

Regards,
Thomas.

>
>
> In general I also like the approach of hiding the rate-change logic i=
nside
> this composite clock, as the depending clocks can be easily kept in s=
ync. As
> with the Rockchips the depending clocks are different for each of the=
 three
> Cortex-A9 SoCs I looked at, it would be "interesting" if all of this =
would
> need to be done in a cpufreq driver.
>
>
> Heiko
>
