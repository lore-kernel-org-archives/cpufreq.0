From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add kernel command line option
 disable intel_pstate.
Date: Fri, 15 Feb 2013 08:12:49 -0800
Message-ID: <511E5E81.5050408@intel.com>
References: <6075901.uWCJMxDDFf@vostro.rjw.lan> <1360867132-13004-1-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=mH0k8ZB0Qq+q=2bxwHcMUVmj-cy-=N4dBf=6Q2xd6nMw@mail.gmail.com> <2881062.pPx9cdkTcn@vostro.rjw.lan> <CAKohpomECGhRkFp8afS0DvozZFJif3MhGFG5XX2T2RWzC3Ez9w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=alr+wqjhGmTRUoaxOoTKlgpE4YLvd358DA9wqN/9AoQ=;
        b=GHkIvhPZNn138d76xToPSuybROSU/2jqZKKUJUZEdQGmZxFn9FiUBgwpBHbroGBKSr
         boGEsucqK/A6n+GbFoeXkkwquJDIg6gspZ+OQZcacHB1ng7EcaMpHh9YxJ0dBgZi+S6d
         l7Unksee5fCt+jMX1JDuo0FluPFrQiBGhczyzupHh68XNL44fmjR0iu5VZInxiEECgik
         JH9rDa768jyTlVFCnLVX1pKccEPZl8+kNiXfbdNXy28nRYpf4ecaCoqdBz9cb33huCei
         1xtyOi9RLvlRfBpC7bkWDHFjE7hkbj8+tC141ua4wv394Fif0YpH0pPc2emQDbrWposv
         06kA==
In-Reply-To: <CAKohpomECGhRkFp8afS0DvozZFJif3MhGFG5XX2T2RWzC3Ez9w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/15/2013 05:28 AM, Viresh Kumar wrote:
> On 15 February 2013 18:00, Rafael J. Wysocki <rjw@sisk.pl> wrote:
>> On Friday, February 15, 2013 09:53:24 AM Viresh Kumar wrote:
>>> Parameter to this is really not required. By default intel_pstate
>>> driver is enabled, so just past disable_intel_pstate from command line
>>> without any args.
>>
>> Well, quite frankly, I'm fine with both.  It all boils down to passing a
>> specific string on the kernel command line.
>
> Well, we are all looking to save worlds power here and my suggestion
> would definitely use less power as it has less instructions to execute.
> Just for fun!!.
>

I would like to leave it the way it is now. If for what ever reason we need
another switch passed to the driver we have a place for it without adding
another single purpose command line option

The updated with __initdata and the spelling fixes will follow shortly

--Dirk
