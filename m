From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] ARM: SA1100: Create dummy clk_get_rate() to avoid
 build failures
Date: Fri, 10 Jan 2014 07:14:16 +0530
Message-ID: <CAKohpo=kpyEatDfc8GZ=660sB60co4gSwxCp_brQbm5xhynmyQ@mail.gmail.com>
References: <aaadbfa341a881c8250f2d23bc77062228d2e70b.1389279793.git.viresh.kumar@linaro.org>
	<CAOesGMgQgOUxbj=0=AYx2pN4mh5HoDcW4p1W89+kvNtXpFmYxA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAOesGMgQgOUxbj=0=AYx2pN4mh5HoDcW4p1W89+kvNtXpFmYxA@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olof Johansson <olof@lixom.net>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Russell King <linux@arm.linux.org.uk>

On 9 January 2014 21:56, Olof Johansson <olof@lixom.net> wrote:
> On Thu, Jan 9, 2014 at 7:08 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> There are some parts of common kernel which would be using routines like
>> clk_get_rate() on some platforms. Currently these wouldn't be called for SA1100
>> boards but we need these routines for successful builds of these boards.
>>
>> So, this patch creates a dummy clk_get_rate() routine which is being used by
>> cpufreq core. More dummy routines might be added later if there is a need for
>> that.
>>
>> Cc: Russell King <linux@arm.linux.org.uk>
>> Cc: Arnd Bergmann <arnd.bergmann@linaro.org>
>> Reported-by: <Olof Johansson> olof@lixom.net
>
> That's not the right format.

So sorry for that..
@Rafael: Can you fix this up while applying? Or you want me to send
this again?
