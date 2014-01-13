From: John Tobias <john.tobias.ph@gmail.com>
Subject: Re: [PATCH v4 2/2] cpufreq: imx6q-cpufreq driver depends on SOC_IMX6Q/SOC_IMX6SL
Date: Sun, 12 Jan 2014 20:55:52 -0800
Message-ID: <CACUGKYP9DWx7JRNnBGoAxGhDi5iNQ3Q_5NSZPcz6QQpYVqxWbQ@mail.gmail.com>
References: <1389321592-33220-1-git-send-email-john.tobias.ph@gmail.com>
	<1389321592-33220-2-git-send-email-john.tobias.ph@gmail.com>
	<20140113032603.GG23525@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=E/i0hDr+OpfANY0pcWP5JXpCSL5Zpx6yrol+xOB7nNc=;
        b=anMdhzDP6AA2sRVcSXD0tf8soJLb6NioMflEYpngQxrYARwI3kZoqVMqDzz3z7CWLq
         iDxe0CG9qqwt5NoXuCbG3BHjyjYsHE9p6vEDJ0NGX6U3epgkxaNLp5pu+A1nenjrjoVB
         L1KCzPLvktx0i+jkAlgCJzVThuCiizaWW0makfuysNW9QImie9y3/hf2fpUFWurE6YPU
         teEsRkPFOgTXrN6tc9VjdQvJvTZ602lZ+1kO2dvkT330WfMfWzJ9x0JlD+U9nN4/LCpP
         MToG9DvBMBfvV8SoeLCIku9l4wF1sAiQj2AjqbJWdVojpbD1UNX0ypm1BXmoar99jDGv
         vaUQ==
In-Reply-To: <20140113032603.GG23525@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawn.guo@linaro.org>
Cc: rjw@rjwysocki.net, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "<kernel@pengutronix.de>" <kernel@pengutronix.de>, "<linux@arm.linux.org.uk>" <linux@arm.linux.org.uk>, "<linux-arm-kernel@lists.infradead.org>" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <festevam@gmail.com>

That's ok.

On Sun, Jan 12, 2014 at 7:26 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> On Thu, Jan 09, 2014 at 06:39:52PM -0800, John Tobias wrote:
>> The ARCH_HAS_CPUFREQ, HAVE_IMX_ANATOP and PM_OPP are moved up to ARCH_MCX.
>> The driver should show if the SOC_IMX6Q and/or SOC_IMX6SL is/are selected.
>>
>> Signed-off-by: John Tobias <john.tobias.ph@gmail.com>
>> ---
>>  drivers/cpufreq/Kconfig.arm | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>> index 3ba5dcc..230c663 100644
>> --- a/drivers/cpufreq/Kconfig.arm
>> +++ b/drivers/cpufreq/Kconfig.arm
>> @@ -80,7 +80,7 @@ config ARM_HIGHBANK_CPUFREQ
>>
>>  config ARM_IMX6Q_CPUFREQ
>>       tristate "Freescale i.MX6 cpufreq support"
>> -     depends on ARCH_MXC
>> +     depends on SOC_IMX6Q || SOC_IMX6SL
>
> No.  We do not want to touch this line where there is another IMX6xx can
> reuse the driver.  Depending on ARCH_MXC is good enough, since we
> already have the symbol prompt and help text to tell the targets that
> the driver supports.
>
> Shawn
>
>>       depends on REGULATOR_ANATOP
>>       help
>>         This adds cpufreq driver support for Freescale i.MX6 series SoCs.
>> --
>> 1.8.3.2
>>
>
