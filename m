From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: [REGRESSION] Commit a66b2e50 "Preserve sysfs files across suspend/resume"
 causes a regression in intel_pstate
Date: Wed, 10 Jul 2013 09:15:12 -0700
Message-ID: <51DD8890.8040008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=bqfbTQkEuDszyL/4o5tecRwu+3GIFzJ/vZrzyE2i3z8=;
        b=DBtjlg13YwEFUUz0wwNypTeK06h9HoWU4i43b6HZBYGPhFlLdCg39PNoqhQAwXZwJ+
         X2Ip818a17kPuco38o9gfrj9ckQU5L0SUuC0Grt2Dv05KQCGkMH19y+PkTVcYn5Xx71A
         IuJSlnhfSI3eHimw389zxPLB0JnCOSKAR1qQbgh7lupoD8rB/89fpXH4oAYAiPxbjKZQ
         lpjqvmJ+p8Jc8GK+Moeytq0jo4AKp3muY9kNvcbpJ+oYKf4nl7ymWd1piRykQQeSQNqR
         q79y5wApDlEhmVRE/ZmFu7x7ZGyzkEA325Ts/rg04rUCINzudhyXSlmSNqDoNBCiLJNI
         Y3AQ==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq <cpufreq@vger.kernel.org>
Cc: dirk.brandewie@gmail.com, "Rafael J. Wysocki" <rjw@sisk.pl>, srivatsa.bhat@linux.vnet.ibm.com, durgadoss.r@intel.com, "Jarzmik, Robert" <robert.jarzmik@intel.com>, tianyu.lan@intel.com

Hi All,

Tianyu debugged into https://bugzilla.kernel.org/show_bug.cgi?id=59781 and found
that commit a66b2e50 is causing the regression.

Tianyu has proposed a fix (patch attached to bugzilla) but having scaling
drivers receive hotplug notifications through two paths seems weird.

Looking at the core code and some of the other scaling drivers
I don't see an obvious fix.  Maybe adding optional suspend/resume callbacks
to the scaling driver interface?

All the scaling drivers that need to do stateful  work in the init/exit
callbacks are being affected by this change so I think there are other
subtle side-effects out there that haven't been noticed yet.

I am not sure how we should proceed here?

Thoughts?
--Dirk





