From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/2] cpufreq: cpufreq_driver_lock is hot on large systems
Date: Tue, 5 Feb 2013 13:58:20 +0530
Message-ID: <CAOh2x=n+ASeLpGHexxDvPGrN6ia+bLnNUNCb-covGDoABVk_wQ@mail.gmail.com>
References: <1360017913-25667-1-git-send-email-nzimmer@sgi.com>
	<2765418.Ft0GYkgNgL@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=+F8jlcU61ZkpAEcAh8N7qmE3Br2WAfKTx8o6LtXlkFI=;
        b=h/1oAloUjbFx7a+BwFEy6LUJw9cm+s/BghXDz+yEpLt3hX1oBCjs/ZGmT8G2iUmtK6
         PuSKrxlzoeDEkZlr/KkS5InOuBn5uMAQ5HlIFsMd7t67zQZWf06mrRm4fKMjAC68TZ27
         KGeBvVA9kevKGjHQe1pFS/Zm48dTQU+verwUXY7hyTWdWiGgDKrBOKpEAje40YorQ3cU
         n6gpb1yAO0EtWDOLEi7HbAn9UXoryD+NZc1QDnKDlJaRftmp/rsJoa9pJW133Yqa3BL6
         Gp9wugwJzZrGEabeCFMQpmrMXqHb5uH98PQEGeug/66kvU49Tlxdxacnxa9NNlDrzZTs
         jHnw==
In-Reply-To: <2765418.Ft0GYkgNgL@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Nathan Zimmer <nzimmer@sgi.com>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, linaro-dev@lists.linaro.org

On Tue, Feb 5, 2013 at 6:37 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Monday, February 04, 2013 04:45:11 PM Nathan Zimmer wrote:
>> I am noticing the cpufreq_driver_lock is quite hot.
>> On an idle 512 system perf shows me most of the system time is spent on this
>> lock.  This is quite signifigant as top shows 5% of time in system time.
>> My solution was to first convert the lock to a rwlock and then to the rcu.
>>
>>
>> Nathan Zimmer (2):
>>   cpufreq: Convert the cpufreq_driver_lock to a rwlock
>>   cpufreq: Convert the cpufreq_driver_lock to use the rcu
>>
>>  drivers/cpufreq/cpufreq.c | 139 ++++++++++++++++++++++++++--------------------
>>  1 file changed, 79 insertions(+), 60 deletions(-)
>
> I like these changes.
>
> Viresh, anyone, any comments?

Hi Nathan/Rafael,

Even i liked the basic idea behind the patchset, but didn't like the way it
is divided into patches. For me, it is highly discouraged to undo something
that you added in the same patchset. And you did exactly the same thing.

Patch 2 is revert of 1 + rcu stuff.

So, i would expect a single patch, i.e. merge of both patches + rebased
on latest stuff.

--
viresh
