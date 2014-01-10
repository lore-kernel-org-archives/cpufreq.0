From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH 6/6] arm: dts: add cpu nodes for Exynos4210 SoC
Date: Fri, 10 Jan 2014 17:36:00 +0530
Message-ID: <CAJuA9ag47f3gHmnXmJHOg+rUhG9O8XsmuLcECXA-cczJjJmSTA@mail.gmail.com>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
	<1389283165-17708-7-git-send-email-thomas.ab@samsung.com>
	<20140110113218.423bc6e0@amdc2363>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=QWPmBTd/vj59a2jCmlIdXrXg+VlScFoSIjObx6JaCpY=;
        b=a+KcVNR4pPvJ+nHXJ8g0CFORsEVrk+i9+3RnQwMH9n714dFSg11fhnoXlg8EMz1EuH
         G85+bAxxbM6sz0ngwpG647U7q4AG44WnxrDIlaP/hhujMFRlIcpFEHa9pnHwXxInrDG9
         jdYYTIrFIvYebDc0ireBmgQvSXkc87ykFxjOcQnPUtxcGLd99ZXshpMfGeRHUs9xmZVF
         4sLYz43LZmrrlZnRoYEcAbLXUKBdH+7bERq3DT0UZgYl4eJuXRNKCkH7G4fD14XKEN+G
         bIQQqdmY7jE8HYkO4xuAML/8FmibmFMex9ygrHRaJubgp2t6VBzyA6iEJt5YB/ZnuUTA
         29Fw==
In-Reply-To: <20140110113218.423bc6e0@amdc2363>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, thomas.ab@samsung.com, Lukasz Majewski <l.majewski@majess.pl>

Hi Lukasz,

On Fri, Jan 10, 2014 at 4:02 PM, Lukasz Majewski <l.majewski@samsung.com> wrote:
> Hi Thomas,
>
>> Add CPU nodes for Exynos4210 SoC and also properties required by the
>> cpufreq-cpu0 driver.
>>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4210-origen.dts         |    6 ++++++
>>  arch/arm/boot/dts/exynos4210-trats.dts          |    6 ++++++
>>  arch/arm/boot/dts/exynos4210-universal_c210.dts |    6 ++++++
>>  arch/arm/boot/dts/exynos4210.dtsi               |   22
>> ++++++++++++++++++++++ 4 files changed, 40 insertions(+), 0
>> deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
>> b/arch/arm/boot/dts/exynos4210-origen.dts index 2aa13cb..afecd8f
>> 100644 --- a/arch/arm/boot/dts/exynos4210-origen.dts
>> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
>> @@ -32,6 +32,12 @@
>>               bootargs ="root=/dev/ram0 rw ramdisk=8192
>> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc"; };
>>
>> +     cpus {
>> +             cpu: cpu@0 {
>> +                     cpu0-supply = <&buck1_reg>;
>> +             };
>> +     };
>> +
>>       regulators {
>>               compatible = "simple-bus";
>>               #address-cells = <1>;
>> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts
>> b/arch/arm/boot/dts/exynos4210-trats.dts index 63cc571..25487d7 100644
>> --- a/arch/arm/boot/dts/exynos4210-trats.dts
>> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
>> @@ -30,6 +30,12 @@
>>               bootargs = "console=ttySAC2,115200N8
>> root=/dev/mmcblk0p5 rootwait earlyprintk panic=5"; };
>>
>> +     cpus {
>> +             cpu: cpu@0 {
>> +                     cpu0-supply = <&varm_breg>;
>> +             };
>> +     };
>> +
>>       regulators {
>>               compatible = "simple-bus";
>>
>> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> b/arch/arm/boot/dts/exynos4210-universal_c210.dts index
>> d2e3f5f..74d5a70 100644 ---
>> a/arch/arm/boot/dts/exynos4210-universal_c210.dts +++
>> b/arch/arm/boot/dts/exynos4210-universal_c210.dts @@ -28,6 +28,12 @@
>>               bootargs = "console=ttySAC2,115200N8
>> root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1"; };
>>
>> +     cpus {
>> +             cpu: cpu@0 {
>> +                     cpu0-supply = <&vdd_arm_reg>;
>> +             };
>> +     };
>> +
>>       mct@10050000 {
>>               compatible = "none";
>>       };
>> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
>> b/arch/arm/boot/dts/exynos4210.dtsi index 48ecd7a..3db2da8 100644
>> --- a/arch/arm/boot/dts/exynos4210.dtsi
>> +++ b/arch/arm/boot/dts/exynos4210.dtsi
>> @@ -36,6 +36,28 @@
>>               reg = <0x10023CA0 0x20>;
>>       };
>>
>> +     cpus {
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             cpu: cpu@0 {
>> +                     device_type = "cpu";
>> +                     compatible = "arm,cortex-a9";
>> +                     reg = <0>;
>> +                     clocks = <&clock 12>;
>> +                     clock-names = "cpu";
>> +
>> +                     operating-points = <
>> +                             200000  950000
>> +                             400000  975000
>> +                             500000  975000
>> +                             800000  1075000
>> +                             1000000 1150000
>> +                             1200000 1250000
>> +                     >;
>
> On the ./arch/arm/boot/dts/highbank.dts the oop's order is decreasing.
>
> That shouldn't be a problem for the cpufreq core, however in my opinion
> we shall stick to one convention.

There are other platforms like the OMAP which use increasing order but
the decreasing order seems to be the most prevalent. I will change the
order in the next version of this patch series.

Thanks,
Thomas.

>
>> +                     safe-opp-index = <3>;
>> +             };
>> +     };
>> +
>>       gic: interrupt-controller@10490000 {
>>               cpu-offset = <0x8000>;
>>       };
>
>
>
> --
> Best regards,
>
> Lukasz Majewski
>
> Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
