From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH 6/9] cpufreq: pxa3xx: move cpufreq driver to drivers/cpufreq
Date: Sun, 31 Mar 2013 19:34:34 +0800
Message-ID: <CAMPhdO_ix16iy+KX+pXwhpO4u3Lx_eL3vVCyf+Lu4HthodekRA@mail.gmail.com>
References: <cover.1364205812.git.viresh.kumar@linaro.org> <2aa937c3d81776f01c2c1d6fcfcb08ba74163b53.1364205812.git.viresh.kumar@linaro.org>
 <CAKohpokq+JJF2Ec3=_QF5dk_w9tMuKZ0trtcgXbC1if=HXEBRg@mail.gmail.com>
 <CAMPhdO9WbCdJq8NdoOjW2Jreka2dSRrNyit_7xrAbX_haEqNGQ@mail.gmail.com> <CAKohpok6vQtbHC0u+XCbPLyJf3w=v=LUNqZB2eJ5msy7=3zWgA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=Fh/SVZCJaJJ0P2vnk5LYs3P+TI5vBR7BDO7OybKsWeM=;
        b=SDJ5p2zWVQXMXjlcMD/xigFFhmSlOFI2bhJPMcQSC9C6JqSs9m8u9BBLgPYtru1Lp8
         GFsHsof9Qcfyphvsev5oijEhIxneD7zJZe3JF+zNBvr/wU7WIHHI75bdj0NzCt+MHnC9
         Z7Kopjoc33KsA2NL5Qcssv1LLF4AIJMIVvyNISU8uansBAXUMXWN0DVoq4eeVYQjA4DZ
         3tZS6tS/NTxVqWyWLc+Vuf7F5lFt8yZ+dAMMTSEl5vFA5v0x4EqvG7LU9HYG/FQ9Vfpq
         25RCyl6OPKMvzA4DVgG4KOj6fwu/eNgqxQc6Kva7CJah/Q6ugc9pux3n0vHLhb0xuc5c
         /C7Q==
In-Reply-To: <CAKohpok6vQtbHC0u+XCbPLyJf3w=v=LUNqZB2eJ5msy7=3zWgA@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, "arvind.chauhan" <arvind.chauhan@arm.com>, "robin.randhawa" <robin.randhawa@arm.com>, "steve.bannister" <Steve.Bannister@arm.com>, "liviu.dudau" <Liviu.Dudau@arm.com>, "charles.garcia-tobin" <charles.garcia-tobin@arm.com>, cpufreq <cpufreq@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linaro-kernel@lists.linaro.org, Arnd Bergmann <arnd.bergmann@linaro.org>, Russell King <linux@arm.linux.org.uk>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Sun, Mar 31, 2013 at 2:45 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 31 March 2013 10:54, Eric Miao <eric.y.miao@gmail.com> wrote:
>> On Sun, Mar 31, 2013 at 11:52 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>> Eric/Haojian,
>>>
>>> On 25 March 2013 15:41, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>> This patch moves cpufreq driver of ARM based pxa3xx platform to drivers/cpufreq.
>>>>
>>>> Cc: Eric Miao <eric.y.miao@gmail.com>
>>
>> Acked-by: Eric Miao <eric.y.miao@gmail.com>
>>
>>>> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
>>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>>> ---
>>>>  arch/arm/mach-pxa/Makefile                                           | 1 -
>>>>  arch/arm/mach-pxa/include/mach/generic.h                             | 1 +
>>>>  drivers/cpufreq/Makefile                                             | 1 +
>>>>  .../mach-pxa/cpufreq-pxa3xx.c => drivers/cpufreq/pxa3xx-cpufreq.c    | 5 +----
>>>>  4 files changed, 3 insertions(+), 5 deletions(-)
>>>>  create mode 100644 arch/arm/mach-pxa/include/mach/generic.h
>>>>  rename arch/arm/mach-pxa/cpufreq-pxa3xx.c => drivers/cpufreq/pxa3xx-cpufreq.c (98%)
>>>
>>> Can i have your Ack or views about 6/9 and 7/9 Patch?
>
> Is this for both the patches??

Yes. Take the Ack for both, those two should really belong to drivers/cpufreq.
