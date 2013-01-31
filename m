From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: governors: implement generic policy_is_shared
Date: Thu, 31 Jan 2013 14:28:56 +0530
Message-ID: <CAOh2x==1ru3bddHnJOge=1rbpc6xwzKV5F5isJhAgwX_R=2TCw@mail.gmail.com>
References: <1359620064-14751-1-git-send-email-fabio.baltieri@linaro.org>
	<CAKohponV-PPO8sqF=rzONLzPi7q-YFOPbrQgoBcNt_NjTJO6WQ@mail.gmail.com>
	<20130131085555.GB30667@balto.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=d9708Ec+xZ2llRQTeD80QoRefIE/txDQ3Wj3eawVrmU=;
        b=vbtK8K6AtWMmwM3X6NijTlQz+vG+b8aDD+Xv/meEF4qqANtCQi0E/QD716pvqlxSws
         Svy4p4h1fQEdxrPXO4Q/bvdeQ4BrjGbaysYyYeTrX3DSr8Iqr18OdpoBmzRho6yD2yIe
         2SHHCGPeaQ0FkEQ4rU5zCP5HvNzsJU2wcmhaGoSD6e6DWe7KbKp22Qskyrmx7Qmj8Vlt
         XYG3t63SAV7bj3RC4LpPMcoidp/18b/4ct7DDnPL1AQPmOC/7G+clCRRrBuXsXxzmIZk
         krHEyLw9+ZgZvdP0kSu1gWFsxYgyu5XQtM96bX4tlA1MluohMGd8M6dpV8/oxh5kJz8h
         YQFA==
In-Reply-To: <20130131085555.GB30667@balto.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabio Baltieri <fabio.baltieri@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linaro-dev@lists.linaro.org, linux-kernel@vger.kernel.org

On Thu, Jan 31, 2013 at 2:25 PM, Fabio Baltieri
<fabio.baltieri@linaro.org> wrote:
> On Thu, Jan 31, 2013 at 02:01:27PM +0530, Viresh Kumar wrote:
>> On 31 January 2013 13:44, Fabio Baltieri <fabio.baltieri@linaro.org> wrote:
>> > Implement a generic helper function policy_is_shared() to replace the
>> > current dbs_sw_coordinated_cpus() at cpufreq level, so that it can be
>> > used by code other than cpufreq governors.
>> >
>> > Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
>> > Signed-off-by: Fabio Baltieri <fabio.baltieri@linaro.org>
>> > ---
>> >  drivers/cpufreq/cpufreq_conservative.c | 2 +-
>> >  drivers/cpufreq/cpufreq_governor.c     | 8 --------
>> >  drivers/cpufreq/cpufreq_governor.h     | 1 -
>> >  drivers/cpufreq/cpufreq_ondemand.c     | 2 +-
>> >  include/linux/cpufreq.h                | 5 +++++
>>
>> Great,
>>
>> But, you missed few places:
>>
>> drivers/cpufreq/acpi-cpufreq.c:        if (bios_with_sw_any_bug &&
>> cpumask_weight(policy->cpus) == 1) {
>> drivers/cpufreq/cpufreq_stats.c:       if (policy &&
>> (cpumask_weight(policy->cpus) == 1)) {
>
> This doesn't look like the same thing to me!  Isn't this check here just
> to trigger during init (exit) on the first (last) cpu?  How would you
> replace it?

I don't think i am wrong, but i can be :)

So, i would replace these as:
drivers/cpufreq/acpi-cpufreq.c:        if (bios_with_sw_any_bug &&
cpumask_weight(policy->cpus) == 1) {
AS
drivers/cpufreq/acpi-cpufreq.c:        if (bios_with_sw_any_bug &&
!policy_is_shared(policy)) {

similarly for the other one too. The whole point is about checking if policy
is managing just one cpu or multiple cpus.
