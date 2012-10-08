From: viresh kumar <viresh.kumar@linaro.org>
Subject: [Query]: CPUFREQ: Affected and related cpus in cpufreq
Date: Mon, 8 Oct 2012 19:28:46 +0530
Message-ID: <CAOh2x=mJUkRxwwTRh89-Xpm1WwB9ciDOXVohqoTu6B5k6meHdw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type;
        bh=cGjM8JDZbyIXKkIDr49KEZgAFtBFpx6bt24eTWsqtF8=;
        b=Yg4QyZIDgAY3yDulZ/oFjAbv06ys96q/jmRV2wML9jMUE4wZXqt2CxeYFX9s02VH9J
         8CQzuTOKdjp23TUy6lhdq+W9wn7F9JgPQ7c0h+mKoWaF7hNc4qdpIG//FAQ1IXmGpxdK
         NTi+gKCAhaVO0RT/AaLfY2RCgnvqBss7u1z7ngPr3eMusUDTH9MK45D/Y3VEv22aOoIQ
         0KgdxAmdRF8zjjwdweY9gDUqcn5/PtRRWySTJx+i7fe/Em0JtxpOsqAtxNGyUDrDjX4m
         /4eRBlblV/nQ5JR8Q7fQ6M3ktwJTl6+WGD3IqhIPDPiYkJGQdGo+zwsE0xREyyiHp0Sk
         G+Dg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-pm@vger.kernel.org, linaro-dev@lists.linaro.org, spear-devel <spear-devel@list.st.com>, Sudeep.KarkadaNagesha@arm.com

Hi All,

Sorry for  asking one of the most basic question of cpufreq :(

I couldn't get the difference between affected (policy->cpus) and
related cpus (policy->related_cpus) in cpufreq...

As per Documentation/code:

affected_cpus(policy->cpus):
- List of CPUs that require software coordination of frequency.
- Processors part of affected_cpus share policy struct
- Policy limits the frequencies that the processor can work with.

related_cpus(policy->related_cpus):
- List of CPUs that need some sort of frequency coordination, whether
  software or hardware.
- Processors part of related_cpus share governer.
- Governer sets the rules, about when to change limits specified by policy.

Correct?

So, now comes the real question:
- In which scenario's should we populate affected and related cpus?
- Should related cpus will always be a superset of affected cpus?

--
Viresh
