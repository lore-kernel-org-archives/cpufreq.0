From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: arm64/cqufreq Kconfig error with v3.14-3893-gc12e69c6aaf7
Date: Wed, 2 Apr 2014 10:36:43 +0530
Message-ID: <CAKohpok3gKyOWD0=pSv0yQLNqJcNPNZagRGFXNFHW+3J7E=mOg@mail.gmail.com>
References: <CA+5PVA6awqaSHQboqdv9nynV9Xjp46VeqijDWxZX1v5wDK0NWQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CA+5PVA6awqaSHQboqdv9nynV9Xjp46VeqijDWxZX1v5wDK0NWQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Boyer <jwboyer@fedoraproject.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Catalin Marinas <catalin.marinas@arm.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@linaro.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On 2 April 2014 06:55, Josh Boyer <jwboyer@fedoraproject.org> wrote:
> Hi All,
>
> When running make listnewconfig/oldconfig on the config below with
> Linus' latest tree, I keep seeing this error message spit out:
>
> drivers/cpufreq/Kconfig:57:warning: choice value used outside its choice group
> drivers/cpufreq/Kconfig:65:warning: choice value used outside its choice group
> drivers/cpufreq/Kconfig:74:warning: choice value used outside its choice group
> drivers/cpufreq/Kconfig:83:warning: choice value used outside its choice group
> drivers/cpufreq/Kconfig:95:warning: choice value used outside its choice group
>
> At the moment I'm only seeing this on arm64 but I have no idea why.
> Does anyone else?

Hmm, there are two entries for this present in: arch/arm64/Kconfig

 +source "drivers/cpufreq/Kconfig"

You can see that here in Linus's merge: 4dedde

Probably both Rafael and Catalin were carrying this change..

--
viresh
