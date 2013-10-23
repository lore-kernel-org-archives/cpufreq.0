From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 Resend 13/34] cpufreq: ia64: Convert to light weight
 ->target_index() routine
Date: Wed, 23 Oct 2013 09:56:30 +0530
Message-ID: <CAKohpomR1rtRFP2bLi2M6gf6sN6Rc5H8Q8v9mk9M7+9EWHxsnw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "rjw@sisk.pl" <rjw@sisk.pl>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 22 October 2013 22:02, Luck, Tony <tony.luck@intel.com> wrote:
>> This patch converts existing .target() to newly defined light weight
>> .target_index() routine for this driver.
>>
>> CPUFreq core will call cpufreq_frequency_table_target() before calling this
>> routine and will pass index to it.
>>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Tested-by: Tony Luck <tony.luck@intel.com>

Thanks Tony..

@Rafael: Count this Tested-by for 1/34 and 31/34 as he actually
tested both :)
