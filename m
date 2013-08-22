From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: PROBLEM: cpufreq ondemand governor problem
Date: Thu, 22 Aug 2013 10:45:00 +0530
Message-ID: <CAOh2x=kYKV3Eqwe-16oQ6r3tGMCqd_P=oP+n_GZqa6rSu=vJKQ@mail.gmail.com>
References: <52010083.5020005@yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=cczmmZ2U5hnCminORZn5FNaCEeEaP0RDEajcKT8NjMQ=;
        b=XsgLptvRWXiKW2PLlcyxdcenHNK7kBl5WpI4jJnOsuAHRCq7I8E2+9MqB82npsXhuC
         fUpCrk1b9MaSduP0Zuq386WrjOR938a1AkABGFEa5hUibuNFrjcWcASS00IAd/7L5RYi
         km1aeqPGGGKyuIGDkdkjTblBbZKyyOXa48SnBqZ6gNxkqLqKSKch8aNJDFK5KLSD5KeH
         WSRdr/dPqfHCT8tmV9P7HnWd9OH86WoucKXKE/NvdVuRr0PxALDLP5GEzJiYWCBdn/s5
         CDjIOBVMTTEICgrNOGLBfWTIUBizrQ5CFIh1DfBAalhfH0rT+MeeEaMDRkU2Q7vx/Uw+
         jvZA==
In-Reply-To: <52010083.5020005@yahoo.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Hochschild <illini_80@yahoo.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, 1136700@bugs.launchpad.net, Stratos Karafotis <stratosk@semaphore.gr>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Tue, Aug 6, 2013 at 7:26 PM, Jim Hochschild <illini_80@yahoo.com> wrote:
> [1.] One line summary of the problem:
>
> cpufreq ondemand governor problem

Sorry for being too late brother.. I went through your mail when you sent it
for the first time and thought I will look into it and then got busy, though it
was on my todo list :)

Finally came back to this.. I understand and accept the problem you faced.
Yes that's a issue.

I am sure you want to have a look at this:

commit cffe4e0e7413eb29fb8bd035c8b12b33a4b8522a
Author: Stratos Karafotis <stratosk@semaphore.gr>
Date:   Wed Jun 5 19:01:50 2013 +0300

    cpufreq: Remove unused function __cpufreq_driver_getavg()

    The target frequency calculation method in the ondemand governor has
    changed and it is now independent of the measured average frequency.
    Consequently, the __cpufreq_driver_getavg() function and getavg
    member of struct cpufreq_driver are not used any more, so drop them.

    [rjw: Changelog]
    Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
    Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

 drivers/cpufreq/cpufreq.c | 12 ------------
 1 file changed, 12 deletions(-)

commit 61c63e5ed3b9c472899d7152e961f2ffaafcf5a0
Author: Stratos Karafotis <stratosk@semaphore.gr>
Date:   Wed Jun 5 19:01:42 2013 +0300

    cpufreq: Remove unused APERF/MPERF support

    The target frequency calculation method in the ondemand governor has
    changed and it is now independent of the measured average frequency.
    Consequently, the APERF/MPERF support in cpufreq is not used any
    more, so drop it.

    [rjw: Changelog]
    Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
    Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

 drivers/cpufreq/Makefile       |  2 +-
 drivers/cpufreq/acpi-cpufreq.c |  5 -----
 drivers/cpufreq/mperf.c        | 51
---------------------------------------------------
 drivers/cpufreq/mperf.h        |  9 ---------
 4 files changed, 1 insertion(+), 66 deletions(-)


And so your problem will go away from 3.12 (Its already queued for
next kernel release.)..

Thanks for reporting this issue.
