From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v3 5/7] ARM: dts: Exynos: add cpu nodes, opp and cpu clock
 configuration data
Date: Sat, 8 Feb 2014 10:50:42 +0530
Message-ID: <CAJuA9aghuiVtTV4srj_Sp0sJFJ6D=1vS5fVZHf5S+SuUkpvMVA@mail.gmail.com>
References: <1391788548-13056-1-git-send-email-thomas.ab@samsung.com>
	<1391788548-13056-6-git-send-email-thomas.ab@samsung.com>
	<52F507CB.6090300@arm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=69Bx8hFtQrVNq71D1dyFeRrWJGD+LDf+E7PCNhUZnTU=;
        b=niSQgc+Uo/ZB4ChlCwGnWERoiBKgnKhxkCYmQY+D0fZLysTTCJHYCLotxABBzY56RU
         oQFa9CxoftrpUYjsq83zW1AhJ1i/WrfJiWFi+sd3AAqtOM7WQktVWEsLi1QDWpie1jUv
         17m0rpKPLL9xsxapDyJpeSKbRYP1BJmRl1CBUdFMghnRSc99onXSoC2W5In5A2u/Qbqm
         +vI3mWBSyW8krjAFjoBl+Hc34AjINzKFxjSLoqVfdMWm+O3h9Ost/r+Ghe1yr6be5a8g
         mz+DzdOhQNuu7pArG/cQUZ5w54YCAFjprHqN4OnUF80FDsHpR2gcE1QZ732GvNzfmJU1
         RGtw==
In-Reply-To: <52F507CB.6090300@arm.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.majewski@samsung.com" <l.majewski@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "mturquette@linaro.org" <mturquette@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "t.figa@samsung.com" <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>

On Fri, Feb 7, 2014 at 9:50 PM, Sudeep Holla <Sudeep.Holla@arm.com> wrote:
> On 07/02/14 15:55, Thomas Abraham wrote:
>> From: Thomas Abraham <thomas.ab@samsung.com>
>>
>> For all Exynos based platforms, add CPU nodes, operating points and cpu
>> clock data for migrating from Exynos specific cpufreq driver to using
>> generic cpufreq-cpu0 driver.
>>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>
> [...]
>
>> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
>> index 5c412aa..c613fc2 100644
>> --- a/arch/arm/boot/dts/exynos4x12.dtsi
>> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
>> @@ -31,6 +31,42 @@
>>                 mshc0 = &mshc_0;
>>         };
>>
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               cpu@0 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a9";
>> +                       reg = <0>;
>> +                       clocks = <&clock 12>;
>> +                       clock-names = "cpu";
>> +
>> +                       operating-points = <
>> +                               1500000 1350000
>> +                               1400000 1287500
>> +                               1300000 1250000
>> +                               1200000 1187500
>> +                               1100000 1137500
>> +                               1000000 1087500
>> +                                900000 1037500
>> +                                800000 1000000
>> +                                700000  987500
>> +                                600000  975000
>> +                                500000  950000
>> +                                400000  925000
>> +                                300000  900000
>> +                                200000  900000
>> +                       >;
>> +                       clock-latency = <200000>;
>> +                       boost-frequency = <1500000 1350000>;
>
> This is confusing, 1350000 is not in the OPP frequency list or this is still
> following old binding with voltage. Either case this needs to be fixed.

Yes, I missed that. Will fix it. Thanks for your review.

Regards,
Thomas.


>
> Regards,
> Sudeep
>
