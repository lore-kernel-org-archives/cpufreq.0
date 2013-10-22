From: =?UTF-8?Q?Geyslan_Greg=C3=B3rio_Bem?= <geyslan@gmail.com>
Subject: Re: [PATCH] cpufreq: intel_pstate: fix possible integer overflow
Date: Tue, 22 Oct 2013 08:25:36 -0200
Message-ID: <CAGG-pUSmM3E8iYg2dKPMzLmH4tLQkzjdxGRHMup5z0xKkXonTQ@mail.gmail.com>
References: <1382239876-12688-1-git-send-email-geyslan@gmail.com>
	<1734089.XZ0ga7sQd1@vostro.rjw.lan>
	<5265AE27.90600@gmail.com>
	<7950903.3bCg8Tn2fH@vostro.rjw.lan>
	<CANOOhLRCC360exKKePsJGxYqx3ULZf1Ac0y16hsnPQNP69OHwA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=zlnS2vfZ54y0Gb8eMT2YC9ppmFJ9qTWwcRpwd9gARS8=;
        b=SzjbgQv8M4PjvdGh/yjS+/FryBw6LoVCiJvFBEzH891MFgqinznf1fhFVbqJHYlOyn
         iCQyw6ll1B6t9rqszJMMaBmLFBTOw/uAfDV2ep1Gt4prETgTswr/w5jubYkyAA2Oa2Iz
         GR4NQ/itmaHyb5rI/zxG0SKZMey1CFXXNi5yOp92dojSER0K0HZPz+l3VGtNyHIzh6yW
         0I0heYN5VbeRPxi5mjD2IqApEZq7VnCwCUv1fCGeVbNwAl4UId+6y2YUiyVnmr7ZwXj2
         9E9gILXtIDCCdrdiUnL0JjaJ18I0F7T5TamX1rUHlW5tGNSDGIzqqide6InlZTLi52BC
         iMtQ==
In-Reply-To: <CANOOhLRCC360exKKePsJGxYqx3ULZf1Ac0y16hsnPQNP69OHwA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, "open list:CPU FREQUENCY DRI..." <cpufreq@vger.kernel.org>, "open list:CPU FREQUENCY DRI..." <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

2013/10/21 Dirk Brandewie <dirk.brandewie@gmail.com>:
>
>
> On Monday, October 21, 2013, Rafael J. Wysocki wrote:
>>
>> On Monday, October 21, 2013 03:43:51 PM Dirk Brandewie wrote:
>> > On 10/21/2013 03:47 PM, Rafael J. Wysocki wrote:
>> > > On Monday, October 21, 2013 08:56:22 AM Dirk Brandewie wrote:
>> > >> On 10/19/2013 08:31 PM, Geyslan G. Bem wrote:
>> > >>> The expression 'pstate << 8' is evaluated using 32-bit arithmetic
>> > >>> while
>> > >>> 'val' expects an expression of type u64.
>> > >>>
>> > >>> Signed-off-by: Geyslan G. Bem <geyslan@gmail.com>
>> > >> Acked-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
>> > >
>> > > Actually, isn't (pstate << 8) guaranteed not to overflow?
>> > >
>> >
>> > Yes, I was assuming this was caught by a static checking tool.
>>

Yes, it was caught by Coverity, and I didn't debug the possibles pstate's.

>> What was caught by the tool was the fact that 1UL << 32 might overflow on
>> 32-bit, so using BIT(32) wasn't correct.

This is the entire output:

CID 1108110 (#1 of 1): Unintentional integer overflow
(OVERFLOW_BEFORE_WIDEN)overflow_before_widen: Potentially overflowing
expression "pstate << 8" with type "int" (32 bits, signed) is
evaluated using 32-bit arithmetic before being used in a context which
expects an expression of type "u64" (64 bits, unsigned). To avoid
overflow, cast the left operand to "u64" before performing the left
shift.

>>
>> > I didn't see a downside to giving the compilier complete information.
>>
>> Well, in that case the function's argument should be u64 rather than int.
>>
>> Either you know that it won't overflow, in which case the explicit type
>> casting doesn't change anything, or you are not sure, in which case it's
>> better to use u64 as the original type anyway in my opinion.
>
>
> pstate << 8 can't overflow we can drop this

I realized that are five calls to intel_pstate_set_pstate()

/drivers/cpufreq/intel_pstate.c:410
/drivers/cpufreq/intel_pstate.c:417
/drivers/cpufreq/intel_pstate.c:432
/drivers/cpufreq/intel_pstate.c:514
/drivers/cpufreq/intel_pstate.c:566

I really don't know if the values that pstate assumes could cause
overflow. And I really don't know if these values may change in the
future. So I have assumed that the most careful is to cast, making the
code error proof.

But you know the code, thus know what is better. ;)

Cheers.

>
>>
>> Thanks!
>>
>> --
>> I speak only for myself.
>> Rafael J. Wysocki, Intel Open Source Technology Center.
