From: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH] cpufreq: dbx500: Round to closest available freq
Date: Thu, 11 Apr 2013 14:52:39 -0700
Message-ID: <516730A7.60206@boundarydevices.com>
References: <1365599175-22361-1-git-send-email-ulf.hansson@stericsson.com> <CACRpkdb75wPjXEYdkqE6BOCsuFA_ZBc6GAz1m-5vHWSrSGKyUA@mail.gmail.com> <1512269.3ZuqNVLx3s@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1512269.3ZuqNVLx3s@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mats Fagerstrom <mats.fagerstrom@stericsson.com>, Ulf Hansson <ulf.hansson@linaro.org>, cpufreq@vger.kernel.org, Rickard Andersson <rickard.andersson@stericsson.com>, Ulf Hansson <ulf.hansson@stericsson.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4/11/2013 2:33 PM, Rafael J. Wysocki wrote:
> On Thursday, April 11, 2013 10:33:07 PM Linus Walleij wrote:
>> On Wed, Apr 10, 2013 at 3:06 PM, Ulf Hansson <ulf.hansson@stericsson.com> wrote:
>>
>>> From: Mats Fagerstrom <mats.fagerstrom@stericsson.com>
>>>
>>> When reading the cpu speed, round it to the closest available
>>> frequency from the table.
>>>
>>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>>> Signed-off-by: Mats Fagerstrom <mats.fagerstrom@stericsson.com>
>> (...)
>>> +       /* The value is rounded to closest frequency in the defined table. */
>>> +       while (freq_table[i + 1].frequency != CPUFREQ_TABLE_END) {
>>> +               if (freq < freq_table[i].frequency +
>>> +                  (freq_table[i + 1].frequency - freq_table[i].frequency) / 2)

if (freq < (freq_table[i].frequency + freq_table[i + 1].frequency) / 2)

is easier to read.



>>>                          return freq_table[i].frequency;
>> Oh that works, clever.
>>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Thanks, applied.
>
> Rafael
>
>

