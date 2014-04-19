From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/2] Support cpufreq driver for Exynos3250
Date: Sat, 19 Apr 2014 16:36:48 +0200
Message-ID: <53528A00.6090906@gmail.com>
References: <1397787634-9334-1-git-send-email-cw00.choi@samsung.com>	<CAK9yfHygoHZ7hnAcLuuaMEsPb8Tqw-QbcTrQ+b=2CD6kK3odmw@mail.gmail.com>	<CAGTfZH1M9h3Sx73wJsD=_vnSyV-+fyOY041PN_7ea718B0mFoQ@mail.gmail.com>	<53527F54.5020601@gmail.com> <CAK9yfHxdC7JAJ6CiBsoHWcdbnv53qzs0XNtfjsabGmA6Sgv=ww@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=rFnRvtoBXxCDbfCbgnuwHoIfcT8N1PA5qDTQj6tfaUg=;
        b=Dimkz2KO+usw6CF2sCsRl3B6b6ChJBn1/Yyel9iZbL6V5Oitp0kjpUBc2GLR8PhxPo
         Q/qLgEQZZZQe4Faf16uw84z74IgLWXGu/2ifKcrTM8wnh5BRVnIhs2ChdmoakFJAUf5W
         V7u4ecI3mAncs3TMDoI1iN++9jyVuFAkHsU3TyWiZO4kSZWLE48kgDYuy0zkX1MO5LpC
         hKPY4eZjZlkKBBDQkKcOyOOhEbX7b86XmMcM3aG7URNMUbkUDJ65NTKgJ6qip8wzbJOl
         5ASPsAafSRmThbwKjVwtpAVchDWXcELP27rZ7AOasjid26/r4o0uBIpoWtQ//IjuUWxF
         83Jg==
In-Reply-To: <CAK9yfHxdC7JAJ6CiBsoHWcdbnv53qzs0XNtfjsabGmA6Sgv=ww@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Chanwoo Choi <cwchoi00@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, LKML <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>



On 19.04.2014 16:35, Sachin Kamat wrote:
> Hi Tomasz,
>
>
> On 19 April 2014 19:21, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Chanwoo, Sachin,
>>
>>
>> On 19.04.2014 15:43, Chanwoo Choi wrote:
>>>
>>> Hi Sachin,
>>>
>>> On Fri, Apr 18, 2014 at 5:14 PM, Sachin Kamat <sachin.kamat@linaro.org>
>>> wrote:
>>>>
>>>> Hi Chanwoo,
>>>>
>>>> On 18 April 2014 07:50, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>>>>>
>>>>> This patchset support cpufreq driver for Exynos3250 which uses the
>>>>> Cortex-A7
>>>>> dual cores and has a target speed of 1.0 GHz and code clean using
>>>>> dev_err/info
>>>>> instead of pr_err/info function.
>>>>
>>>>
>>>> Per SoC cpufreq driver which does not use CCF is no more encouraged for
>>>> new
>>>> Exynos platforms. Thomas has already posted patches to make use of
>>>> generic cpu freq driver
>>>> on Exynos platforms. Please refer to [1] and try to utilize it for
>>>> this platform as well.
>>>>
>>>> [1] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/26886
>>>
>>>
>>> OK, I'll refer to this new patch for cpufreq and rebase it.
>>>
>>> Thanks for your reply.
>>
>>
>> The last version posted by Thomas still had several comments to be addressed
>> that could lead to quite big changes in the whole design in next version.
>> According to the information from Thomas, the work on it is in progress and
>> we should see updated patchset soon.
>
> Yes, that is right. I wanted Chanwoo to be aware of this new design
> and track the same.
>

Sure. Just wanted to make sure this is clear.

Best regards,
Tomasz
