From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference
 at (null)
Date: Mon, 12 Aug 2013 10:29:45 +0530
Message-ID: <CAOh2x=nZhUujAKe-NRnfu7GwkPC3U-Po7qpD8xiWHGktF1kXKQ@mail.gmail.com>
References: <20130811055322.GA28118@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=wp1GahIXPkD6uYESWkkenumcCyI+GacwUGwsH/8zkmM=;
        b=ZuHXJvQSOGYaLU1m8FrIgRZlfhLgBc6aXdogXW2F0nISqPcV+A4DuboT8lMLs3X3Sx
         40ZDM3k1D1aTrNc11zcULP+G0GWm/OhMPv1h9c3k/D1+JjiZiuOL/7fBrYfu/Gjx/XQp
         UlnOindwVpJSe/EUcQVA0QNQjv0P+OXxCA62C0QNzFGs6ARc3eBOtQ+Js17VkYNqSLXa
         N7NB+OzCmc9boe4KNnX7iQtQ0oDgoMIOxyJxtGKY5+42j8grQSSbKiajxiYCbk48aL6B
         Xfwu1LyCIDEZnoArQ4FjeKg7YPmNsNGE9Z5eX+lMeqJDBDB4AL83St1Bhtaf+eKXUITR
         mHMg==
In-Reply-To: <20130811055322.GA28118@localhost>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Aug 11, 2013 at 11:23 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Greetings,
>
> I got the below dmesg and the first bad commit is
>
> commit 01e3e82efc6742d5cf7ba14fb7a9bea318b386d8
> Author: Lukasz Majewski <l.majewski@samsung.com>
> Date:   Tue Aug 6 22:53:08 2013 +0530
>
>     cpufreq: Store cpufreq policies in a list
>
>     Policies available in the cpufreq framework are now linked together.
>     They are accessible via cpufreq_policy_list defined in the cpufreq
>     core.
>
>     Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
>     Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
>     Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Its already fixed by: c88a1f8b96e7384627b918dfabbfc0c615a4a914 in Rafael's
bleeding-edge branch.. Thanks for reporting.
