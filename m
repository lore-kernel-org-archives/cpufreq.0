From: Todd Poynor <toddpoynor@google.com>
Subject: Re: RFC: Leave sysfs nodes alone during hotplug
Date: Mon, 7 Jul 2014 15:40:54 -0700
Message-ID: <CAAW3Ypa690EKmDzwx94CaHeR4j_F6_yFmFrn6xTYuLv=pH7B3g@mail.gmail.com>
References: <53B5D22F.2070308@codeaurora.org>
	<CAKohpomuPshe4HpvWSzmZ3vvAjV-zHucfHBVbhB6dUBrrYH8pw@mail.gmail.com>
	<53BAF540.9080904@codeaurora.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=64XX0OGkYERthUXLJ3loWMS9vsEcjqPVf+PouShRIbE=;
        b=K/EsATtbblAt57NLoOJFPQA2HXz7YDFkdOfN5bm9rZqGJAcBz4a/cDtanQMiv4JIao
         dJZGchl+W5uRT0uPR7D7SjDAxkr4W9P+n340ph/xl4yjw1ab9AfQgyGFb2qRRwolM8iP
         IBt90BkWnAk2EWQrJg3gpl3QbVPPz8PL7sOZVL8jqShuPgTsOv+cOn4iShNQiMddHZ+A
         Bh03eshivifksZXqKobBSPhHiUgDHQ89qCbJXBn/Wrm/JuRV04inGRJVmR4iaxyAtbTL
         McLpB2Y9yf03ygg63gAXYdjlJN1/9o1F7mUlTK2aa4YtsSofmoATKT9raVC0bn0ElOsQ
         KNgg==
In-Reply-To: <53BAF540.9080904@codeaurora.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saravana Kannan <skannan@codeaurora.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Srivatsa S. Bhat" <srivatsa@mit.edu>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM mailing list <linux-pm@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Ruchi Kandoi <kandoiruchi@google.com>

On Mon, Jul 7, 2014 at 12:30 PM, Saravana Kannan <skannan@codeaurora.org> wrote:
...
>> Though these are the requirements I have from them:
>> - On hotplug files values should get reset ..
>> - On suspend/resume values must be retained.
>
> Hmm... There's actually enough interest in NOT reseting across hotplug
> because it's also used by thermal when a CPU gets too hot and then it's
> plugged in later. So, userspace has no way to cleanly restore the values.
> But that's a separate topic.

For Android's usage we're also interested in both:

1. not removing and recreating the cpufreq sysfs files for a CPU on
hotplug events (we currently use hotplug uevents to reset file
ownership such that power policy can be controlled by non-root).

2. not resetting the contents of policy files such as scaling_max_freq
(also fixed up from uevents) or stats files (we currently keep a
separate persistent time_in_state for battery accounting purposes).

>>> Any objections to leaving them alone during hotplug? If those files are
>>> read/written to when the entire cluster is hotplugged off, we could just
>>> return an error. I'm not saying it would be impossible to fix all these
>>> deadlock and race issues in the current code -- but it seems like a lot
>>> of
>>> pointless effort to remove/add sysfs nodes.

No objections from our standpoint.


Thanks -- Todd
