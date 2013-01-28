From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: instantiate cpufreq-cpu0 as a platform_driver
Date: Mon, 28 Jan 2013 09:42:29 +0530
Message-ID: <CAOh2x=kCKbxX6ThzEty0F-MxxhsRMhh8++Nc7BqBaXNfaozoJw@mail.gmail.com>
References: <1359208550-16402-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=yM96XTV/6gtTsg2i1QZK1xQFrSZyhHjoootjOO9VGcs=;
        b=DwD3L5GvLBfQlSxbFvz9oYUwCuryJTVvwUtOkXZVJJmd6eXfqUSFv4bcztz8WvuIb7
         JkX987G0V/2/4emv2mJ59cmbAAe4bSIEhMRiUx14v6pWfZLIcJyPos/PNXlvXHp0w7Tt
         jGTrHw0OQhSwSAJgAex0/+TeqEymrPSzs8T60AR+1bSdRkRCO0kaPgDwbwkpQWh7tqjO
         8EljQDVmnGUdlLNAi9wc1K/QQwC7owQIew0mLNHMVB9xKM3aFHQnWAFDg+4DZ8PPzmb7
         ooOkq8S9xLRDKQxBLAwI1DtXrVn5I41X3rWyyeSXqxH9+CmpMk82RhnYRf9r8rgf36ya
         lu5A==
In-Reply-To: <1359208550-16402-1-git-send-email-shawn.guo@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawn.guo@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, AnilKumar Ch <anilkumar@ti.com>, Mark Langsdorf <mark.langsdorf@calxeda.com>, Andrew Lunn <andrew@lunn.ch>

On Sat, Jan 26, 2013 at 7:25 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> As multiplatform build is being adopted by more and more ARM platforms,
> initcall function should be used very carefully.  For example, when
> GENERIC_CPUFREQ_CPU0 is built in the kernel, cpu0_cpufreq_driver_init()
> will be called on all the platforms to initialize cpufreq-cpu0 driver.
>
> To eliminate this undesired the effect, the patch changes cpufreq-cpu0
> driver to have it instantiated as a platform_driver.  Then it will only
> run on platforms that create the platform_device "cpufreq-cpu0".
>
> Along with the change, it also changes cpu_dev to be &pdev->dev,
> so that managed functions can start working, and module build gets
> supported too.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Rafael,
>
> The patch depends patch "power: export opp cpufreq functions".
> https://patchwork.kernel.org/patch/1847261/
>
> AnilKumar,
>
> Unfortunately, the change will require some platform level adoption
> to have cpufreq-cpu0 driver continue working for am33xx.  But it should
> be as simple as something like below.
>
>         struct platform_device_info devinfo = { .name = "cpufreq-cpu0", };
>         platform_device_register_full(&devinfo);

Something similar was being discussed with Andrew (cc'd) on his patch
for kikwood cpufreq driver.

We shouldn't encourage addition of above as we are moving towards DT.
So, i would except an compatible array too in your patch and then driver
can be probed based on compatible string being present in cpu node.

What do you say?

--
viresh
